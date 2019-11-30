package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.entities.Brand;
import com.shop.entities.Users;
import com.shop.entities.Category;
import com.shop.entities.Order;
import com.shop.entities.Product;
import com.shop.entities.User;
import com.shop.model.UserDTO;
import com.shop.repository.BrandRepository;
import com.shop.repository.UserRepository;
import com.shop.repository.UsersRepository;
import com.shop.services.CategoryService;
import com.shop.services.OrderDetailService;
import com.shop.services.OrderService;
import com.shop.services.ProductService;

@Controller
public class AdminController {

	private static final int ADM = 10;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService detailService;

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UsersRepository usersRepo;

	private @Autowired BrandRepository brandRepo;

	@GetMapping("/admin")
	public ModelAndView index(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return new ModelAndView("admlogin");

		ModelAndView mv = new ModelAndView("ad_index");
		mv.addObject("admin", user);
		mv.addObject("orders", orderService.count());
		mv.addObject("products", productService.count());
		mv.addObject("revenue", orderService.revenueMonth());
		mv.addObject("bestSeller", productService.getByBestSeller(4));
		return mv;
	}

	// Start
	// Category-------------------------------------------------------------
	@GetMapping("/categoryManager")
	public String category(HttpServletRequest request, ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());

		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return "admlogin";

		return "categoryManager";
	}

	@GetMapping("/category/{id}/delete")
	public String deleteCategory(@PathVariable int id, ModelMap model, final RedirectAttributes redirectAttributes) {
		boolean result =categoryService.delete(id);
		String message = result == true ? "Xóa thất bại!" : "Xóa thành công!";
		redirectAttributes.addFlashAttribute("msg", message);
		return "redirect:/categoryManager";

	}

	@GetMapping("/addCategory")
	public String addCategory(ModelMap model) {
		model.addAttribute("categoryForm", new Category());
		return "formCategory";
	}

	  @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	  public String saveCategory(ModelMap model,@Valid @ModelAttribute("categoryForm") Category category,
	                             BindingResult validateForm, final RedirectAttributes redirectAttributes) {
		  
		
				if (validateForm.hasErrors()) {
					return "formCategory";
				}
				else {
					redirectAttributes.addFlashAttribute("msg", "Them moi thanh cong!");
				      model.addAttribute("message", "them moi thanh cong");
				      categoryService.save(category);
				    }
	    return "redirect:/categoryManager";
	  }

//	@GetMapping("/category/edit")
//	public String editCategory(@PathVariable int id, ModelMap model) {
////		model.addAttribute("categories", categoryService.findOne(id));
//		return "formUpdateCategory";
//
//	}

	@GetMapping("/editCategory")
	public ModelAndView updateCategory(@RequestParam("cateID") int id) {
		ModelAndView mv = new ModelAndView("formUpdateCategory");
		mv.addObject("cate", categoryService.findOne(id));
		return mv;
	}

	@PostMapping("/saveChangeCategory")
	public String saveChangeCategory(ModelMap model, @Validated @ModelAttribute("categoryForm") Category category,
			BindingResult validateForm, final RedirectAttributes redirectAttributes) {
		if (category.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "category", "vui long nhap ten");
		}
		if (validateForm.hasErrors()) {
			model.addAttribute("message", "vui long sua loi");

		} else {
			redirectAttributes.addFlashAttribute("msg", "cap nhat thanh cong!");
			model.addAttribute("message", "Cap nhat thanh cong");
			
			categoryService.save(category);
		}

		return "redirect:/categoryManager";
	}
	// End Category

	// Start Product
	// ---------------------------------------------------------------------
	@GetMapping("/editProduct")
	public String updateProduct(ModelMap model, @RequestParam("proID") long id) {
		model.addAttribute("Categories", categoryService.findAll());
		model.addAttribute("brands", brandRepo.findAll());
		model.addAttribute("productForm", productService.findOne(id));
		return "formUpdateProduct";

	}

	@PostMapping("/saveChangeProduct")
	public String saveChangeProduct(ModelMap model, @ModelAttribute("productForm") Product product,
			BindingResult validateForm, HttpServletRequest request) {

		System.out.println(product.toString());

		if (product.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "product", "vui long nhap ten");
		}
		if (product.getPrice() < 0) {
			validateForm.rejectValue("price", "product", "gia khong nho hon 0");
		}
		if (product.getQuantity() < 0) {
			validateForm.rejectValue("quantity", "product", "so luong khong nho hon 0");
		}
		if (product.getBrand() == null) {
			validateForm.rejectValue("brand", "product", "san pham phai thuoc nhan hieu nao do");
		}
		if (validateForm.hasErrors()) {
			model.addAttribute("message", "vui long sua loi");
		} else {
			model.addAttribute("message", "cap nhat thanh cong");

			if (product.getFile_image().isEmpty()) {
				Product tmp = productService.findOne(product.getId());
				product.setImage(tmp.getImage());
			} else {
				try {
					ServletContext servletContext = request.getServletContext();
					String contextPath = servletContext.getRealPath("/");
					product.getFile_image().transferTo(new File(contextPath + "/" + product.getImage()));

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			productService.save(product);
		}

		return "redirect:/productManager";
	}

	@GetMapping("/productManager")
	public String product(HttpServletRequest request, ModelMap model) {
		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return "admlogin";

		model.addAttribute("products", productService.findAll());
		return "productManager";
	}

	@GetMapping("/product/{id}/delete")
	public String deleteProduct(@PathVariable long id, ModelMap model) {
		productService.delete(id);
		return "redirect:/productManager";
	}

	@GetMapping("/addProduct")
	public String addProduct(ModelMap model) {
		model.addAttribute("Categories", categoryService.findAll());
		model.addAttribute("productForm", new Product());
		model.addAttribute("brands", brandRepo.findAll());
		return "formProduct";
	}

	  @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	  public String saveProduct(ModelMap model,@Valid @ModelAttribute("productForm") Product product,
	                            BindingResult validateForm, HttpServletRequest request) {
	    
	    System.out.println(product.toString());
	    
	    
			if (validateForm.hasErrors()) {
				model.addAttribute("Categories", categoryService.findAll());
			    
			    model.addAttribute("brands", brandRepo.findAll());
				return "formProduct";
			}else {
	      model.addAttribute("message", "them moi thanh cong");
	      try {
	        ServletContext servletContext = request.getServletContext();
	        String contextPath = servletContext.getRealPath("/");
	        product.getFile_image().transferTo(new File(
	            contextPath + "/static/images/prod/" + product.getFile_image().getOriginalFilename()));
	      } catch (IllegalStateException e) {
	        e.printStackTrace();
	      } catch (IOException e) {
	        e.printStackTrace();
	      }

	      product.setImage("static/images/prod/" + product.getFile_image().getOriginalFilename());
	      productService.save(product);
	    }

	    return "redirect:/productManager";
	  }
	// closeProduct

	// Start Order
	@GetMapping("/orderManager")
	public String orderManager(HttpServletRequest request, ModelMap model) {
		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return "admlogin";

		model.addAttribute("newOrder", orderService.getOrder(Order.new_od));
		model.addAttribute("checkedOrder", orderService.getOrder(Order.paid));
		model.addAttribute("succeed", orderService.getOrder(Order.success));
		model.addAttribute("canceled", orderService.getOrder(Order.canceled));
		return "oderManager";
	}

	@GetMapping("/viewOrderDetail")
	public String viewOrderDetail(@RequestParam("orderID") Long orderID, ModelMap model) {
		model.addAttribute("mode", "viewDetail");
		model.addAttribute("order", orderService.findOne(orderID));
		model.addAttribute("orderDetails", detailService.findByOrderID(orderID));
		return "oderManager";
	}

	@PostMapping("/checkedOrder")
	public String checkedOrder(HttpServletRequest request) {
		long orderID = Long.parseLong(request.getParameter("orderID"));
		Short orderStatus = Short.parseShort(request.getParameter("orderStatus"));
		Order order = orderService.findOne(orderID);
		order.setStatus(orderStatus);
		orderService.update(order);
		return "redirect:/orderManager";
	}
	// End Order

	@GetMapping("/revenue")
	public String revenue(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return "admlogin";

		return "revenue";
	}

	@GetMapping("/revenueByMonth")
	public @ResponseBody Collection<Double> revenues() {
		return orderService.revenues().values();
	}

	@GetMapping("/admin/login")
	public ModelAndView login() {
		return new ModelAndView("admlogin");
	}

	@GetMapping("/adm-profile")
	public ModelAndView profile(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return new ModelAndView("admlogin");

		ModelAndView mv = new ModelAndView("ad_profile");
		mv.addObject("admin", user);
		return mv;
	}

	@PutMapping("/admin/update")
	public @ResponseBody Object update(@RequestBody UserDTO dto, HttpServletRequest request) {
		User user = new User();
		user.setId(dto.getId());
		user.setAddress(dto.getAddress());
		user.setEmail(dto.getEmail());
		user.setName(dto.getName());
		user.setPassword(dto.getPassword());
		user.setPhone(dto.getPhone());
		user.setUsername(dto.getUsername());
		user.setRole(ADM);

		int resp = userRepo.save(user).getId();
		request.getSession().setAttribute("user-admin", user);
		return resp;
	}

	@PostMapping("/admin/submit")
	public @ResponseBody Integer submit(HttpServletRequest request, @RequestBody UserDTO dto) {
		Optional<User> user = userRepo.findByUsernameAndPassword(dto.getUsername(), dto.getPassword());

		if (!user.isPresent() || user.get().getRole() != ADM) {
			return 500;
		}

		request.getSession().setAttribute("user-admin", user.get());
		return 200;
	}

	@GetMapping("/admin/signout")
	public @ResponseBody Integer signout(HttpServletRequest request) {
		request.getSession().setAttribute("user-admin", null);
		return 200;
	}

//Start
	// Brand-------------------------------------------------------------
	@GetMapping("/brandManager")
	public String brrand(HttpServletRequest request, ModelMap model) {
		model.addAttribute("brands", brandRepo.findAll());

		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return "admlogin";

		return "brandManager";
	}

	@GetMapping("/brand/{id}/delete")
	public String deleteBrand(@PathVariable long id) {
		brandRepo.deleteById(id);
		return "redirect:/brandManager";

	}

	@GetMapping("/addBrand")
	public String addBrand(ModelMap model) {
		model.addAttribute("brandForm", new Category());
		return "formBrand";
	}

	 @RequestMapping(value = "/addBrand", method = RequestMethod.POST)
	 public String saveBrand(ModelMap model, @Valid @ModelAttribute("brandForm") Brand brand,
	                            BindingResult validateForm, final RedirectAttributes redirectAttributes) {
		
				if (validateForm.hasErrors()) {
					return "formBrand";
				} else {
					redirectAttributes.addFlashAttribute("msg", "Them moi thanh cong!");
	     model.addAttribute("message", "them moi thanh cong");
	     brandRepo.save(brand);
	   }

	   return "redirect:/brandManager";
	 }

	@GetMapping("/editBrand")
	public ModelAndView updateBrand(@RequestParam("id") long id) {
		ModelAndView mv = new ModelAndView("formUpdateBrand");
		mv.addObject("brand", brandRepo.findById(id).get());
		return mv;
	}

//Start
//Users-------------------------------------------------------------
	@GetMapping("/form-users")
	public String users(HttpServletRequest request, ModelMap model) {
		model.addAttribute("users", usersRepo.findAll());

		User user = (User) request.getSession().getAttribute("user-admin");
		if (user == null || user.getRole() != ADM)
			return "admlogin";

		return "formUsers";
	}

	@GetMapping("/users/{id}/delete")
	public String deleteUsers(@PathVariable long id) {
		usersRepo.deleteById(id);
		return "redirect:/form-users";

	}

	@RequestMapping(value = "/formUsers/save", method = RequestMethod.POST)
	public String saveUsers(ModelMap model, Users users, BindingResult validateForm) {
		if (users.getUsername().trim().length() == 0) {
			validateForm.rejectValue("username", "users", "vui long nhap ten");
		}
		if (users.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "users", "vui long nhap ten");
		}
		if (users.getPassword().trim().length() == 0) {
			validateForm.rejectValue("password", "users", "vui long nhap mat khau");
		}
		if (users.getPhone().trim().length() == 11) {
			validateForm.rejectValue("phone", "users", "vui long nhap mat khau");
		}
		if (users.getPassword().trim().length() == 0) {
			validateForm.rejectValue("password", "users", "vui long nhap mat khau");
		}
		if (users.getAddress().trim().length() == 0) {
			validateForm.rejectValue("address", "users", "vui long nhap dia  chi");
		}
		if (users.getEmail().trim().length() == 0) {
			validateForm.rejectValue("email", "users", "vui long nhap email");
		}

		if (validateForm.hasErrors()) {
			model.addAttribute("message", "vui long sua loi");

		} else {
			model.addAttribute("message", "them moi thanh cong");
			usersRepo.save(users);
		}

		return "redirect:/form-users";
	}

	@GetMapping("/editUsers")
	public ModelAndView updateUsers(@RequestParam("id") long id) {
		ModelAndView mv = new ModelAndView("formupdateUsers");
		mv.addObject("users", usersRepo.findById(id).get());
		return mv;
	}
//End Brand

	@PostMapping("/saveChangeBrand")
	public String saveChangeBrand(ModelMap model, @Validated @ModelAttribute("brandForm") Brand brand,
			BindingResult validateForm, final RedirectAttributes redirectAttributes) {
		if (brand.getName().trim().length() == 0) {
			validateForm.rejectValue("name", "brand", "vui long nhap ten");
		}
		if (validateForm.hasErrors()) {
			model.addAttribute("message", "vui long sua loi");

		} else {
			redirectAttributes.addFlashAttribute("msg", "cap nhat thanh cong!");
			model.addAttribute("message", "Cap nhat thanh cong");
			brandRepo.save(brand);
		}

		return "redirect:/brandManager";
	}
	// End Brand
}
