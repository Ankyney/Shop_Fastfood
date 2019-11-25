package com.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entities.Product;
import com.shop.model.Cart;
import com.shop.model.CartResponse;
import com.shop.model.Item;
import com.shop.repository.ProductRepository;



@RestController
@RequestMapping("/cart")
public class CartController extends CommonController {

  private @Autowired ProductRepository productRepository;

  @GetMapping("")
  public ModelAndView cart(HttpServletRequest request) {
    return getShopView("checkout", request);
  }
  
  @GetMapping("/remove/{productId}")
  public CartResponse remove(@PathVariable Long productId, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Product product = productRepository.findById(productId).get();
    cart.removeToCart(productId);
    session.setAttribute("cart", cart);
    return updateCartView(cart, "Đã xóa sản phẩm khỏi giỏ hàng: " + product.getName());
  }

  @GetMapping("/plus/{productId}/{quantity}")
  public CartResponse plus(@PathVariable Long productId, @PathVariable Integer quantity, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Product product = productRepository.findById(productId).get();
    if (cart.getCartItems().containsKey(productId)) {
      cart.plusToCart(productId, new Item(product, cart.getCartItems().get(productId).getQuantity() + quantity));
    } else {
      cart.plusToCart(productId, new Item(product, quantity));
    }
    session.setAttribute("cart", cart);
    return updateCartView(cart, "Đã thêm thành công : " + product.getName());
  }

  @GetMapping("/sub/{productId}/{quantity}")
  public CartResponse sub(@PathVariable Long productId, @PathVariable Integer quantity, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Product product = productRepository.findById(productId).get();
    cart.subToCart(productId, new Item(product, cart.getCartItems().get(productId).getQuantity() - quantity));
    session.setAttribute("cart", cart);
    return updateCartView(cart, "Sản phẩm đã được bỏ bớt: " + product.getName());
  }
  
  private CartResponse updateCartView(Cart cart, String message) {
    CartResponse resp = new CartResponse();
    Double totalPrices = 0d;
    int quantity = 0;
    
    if (cart != null) {
      Map<Long, Item> datas = cart.getCartItems();
      
      for(Item i: datas.values()) {
        totalPrices += (i.getProduct().getPrice() * i.getQuantity());
        quantity += i.getQuantity();
      }
    }
    resp.setQuantity(quantity);
    resp.setPrice(totalPrices.longValue());
    resp.setMessage(message);
    return resp;
  }
}
