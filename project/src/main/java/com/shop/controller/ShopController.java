package com.shop.controller;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.Utils;
import com.shop.entities.Order;
import com.shop.entities.OrderDetail;
import com.shop.entities.OrderDetailId;
import com.shop.entities.Product;
import com.shop.entities.User;
import com.shop.model.Cart;
import com.shop.repository.BrandRepository;
import com.shop.repository.ProductRepository;
import com.shop.services.CategoryService;
import com.shop.services.OrderDetailService;
import com.shop.services.OrderService;
import com.shop.services.ProductService;

@Controller
@RequestMapping("")
public class ShopController extends CommonController {
  
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService detailService;
	
	private @Autowired BrandRepository brandRepo;  
	private @Autowired ProductRepository productRepo;  

	@GetMapping("/login") 
  public ModelAndView login(HttpServletRequest request) {
    return getView("userlogin", request);
  }
	
	@GetMapping("/registry")
  public ModelAndView viewRegistry(HttpServletRequest request) {
    return getView("user", request);
  }
	
	@GetMapping("/user")
  public ModelAndView viewUser(HttpServletRequest request) {
    return getView("user", request);
  }
	
	@RequestMapping("/home")
	public ModelAndView index(HttpServletRequest request) {
	  ModelAndView mv = getShopView("index", request);
	  
	  mv.addObject("bestSeller", productService.getByBestSeller(4));
		mv.addObject("mostViews", productService.getByMostViews(8));
		return mv;
	}

	
	@RequestMapping("/allProduct")
	public ModelAndView product(HttpServletRequest request) {
	  ModelAndView mv = getShopView("product", request);
		mv.addObject("products", productService.findAll());
		return mv;
	}

	@GetMapping("/search")
	public String search(ModelMap model, @RequestParam("searchValue") String value) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("brands", brandRepo.findAll());
		if (productService.search(value).size() > 0) {
			model.addAttribute("products", productService.search(value));
		}
		return "product";
	}

	@GetMapping("/searchProduct")
	public ModelAndView productFilter(HttpServletRequest request) {

	  ModelAndView mv = getShopView("product", request);
	  
		String priceRange = request.getParameter("priceRange");
		String categoryID = request.getParameter("cateID");
		Long id = 0l;
		if (categoryID != null) {
			id = Long.parseLong(categoryID);
		}
		
		mv.addObject("categoryID", categoryID);

		long[] price = {1l , 1000l};
		if (priceRange != null) {
			price = Utils.getPrice(priceRange);
		}
		mv.addObject("priceValue1", price[0]);
    mv.addObject("priceValue2", price[1]);
		
		try {
			if (categoryID == null) {
				if (productService.SearchByPriceRange(price[0], price[1]).size() > 0) {
				  mv.addObject("products", productService.SearchByPriceRange(price[0], price[1]));
				}
				return mv;
			}
			if (priceRange == null) {
				if (productService.searchByCateID(id).size() > 0) {
				  mv.addObject("products", productService.searchByCateID(id));
				}
				return mv;
			}
			if (categoryID != null && priceRange != null) {
				if (productService.SearchByCateAndPriceRange(id, price[0], price[1]).size() > 0) {
				  mv.addObject("products", productService.SearchByCateAndPriceRange(id, price[0], price[1]));
				}
				return mv;
			}
		} catch (NullPointerException e) {
			System.out.println(e.toString());
		}
		return mv;
	}

	@GetMapping("/productDetail")
	public ModelAndView productDetail(ModelMap model, @RequestParam("cateID") long cateID,
			@RequestParam("productID") long productID, HttpServletRequest request) {
	  
	  ModelAndView mv = getShopView("productDetail", request);
	  Product p = productService.findOne(productID);
		model.addAttribute("product", p);
		model.addAttribute("details", p.getDescription().split("\n"));
		model.addAttribute("relatedProducts", productService.searchByCateID(cateID));
		
		p.setViews(p.getViews() + 1);
		productRepo.save(p);
		return mv;
	}

	@GetMapping("/order")
	public String testLoad(ModelMap model) {
		model.addAttribute("orderForm", new Order());
		model.addAttribute("orderDetailForm", new OrderDetail());
		return "checkout";
	}

	@PostMapping("/order") 
	public @ResponseBody Integer addOrder(@RequestBody Order order, HttpServletRequest request) {
		// SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println("Tên: " + order.getCustomerName() + " Địa chỉ: " + order.getAddress());
		
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		order.setTotal(cart.totalCart());
		order.setCreated(new Date());
		
		if("paypal".equals(order.getPayment())) {
		  order.setStatus(Order.paid);
		} else {
		  order.setStatus(Order.new_od);
		}
		
		Long id = orderService.save(order);
		List<OrderDetail> ods = cart.getItems().stream().map(i -> {
		  OrderDetail tmp = new OrderDetail();
		  tmp.setAmount(i.getProduct().getPrice() * i.getQuantity());
		  tmp.setQuantity(i.getQuantity());
		  
		  Order tmpod = new Order();
		  tmpod.setId(id);

		  OrderDetailId oid = new OrderDetailId(tmpod, i.getProduct());
		  tmp.setId(oid);
		  
		  Product p = i.getProduct();
		  p.setQuantity(p.getQuantity() - i.getQuantity());
		  productRepo.save(p);
		  return tmp;
		}).collect(Collectors.toList());
		
		detailService.save(ods);
		request.getSession().setAttribute("cart", null);
		return 1;
	}

	@GetMapping("/order/{id}/cancel")
	public @ResponseBody Integer cancelOrder(@PathVariable Long id) {
    Order order = orderService.findOne(id);
    order.setStatus(Order.canceled);
    orderService.save(order);
    return 1;
  }
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/profile")
  public ModelAndView profile(HttpServletRequest request) {
	  ModelAndView mv = getShopView("profile", request);
	  
	  User user = (User) mv.getModel().get("user");
	  List<Order> orders = orderService.getUserOrders(user.getName());
	  System.out.println(orders);
	  if (orders != null && orders.size() > 0) {
	    mv.addObject("orders", orders);
	  }
    return mv;
  }
}
