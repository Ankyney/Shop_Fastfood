package com.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entities.Category;
import com.shop.entities.User;
import com.shop.model.Cart;
import com.shop.repository.BrandRepository;
import com.shop.services.CategoryService;


public class CommonController {

  @Autowired
  private CategoryService categoryService;
  
  private @Autowired BrandRepository brandRepo;
  
  public ModelAndView getView(String view, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView(view);
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    if (cart == null) cart = new Cart();
    request.getSession().setAttribute("cart", cart);
    mv.addObject("cart", cart);
    
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
      mv.addObject("user", user);
    }
    
    return mv;
  }
  
  
  public ModelAndView getShopView(String view, HttpServletRequest request) {
    ModelAndView mv = getView(view, request);
    List<Category> cates = categoryService.findAll();
    mv.addObject("categories", cates);
    
    List<Category> cate6 = new ArrayList<Category>(cates); 
    cate6  = cate6.subList(0, cate6.size() > 6 ? 6 : cate6.size());
    mv.addObject("cate6", cate6);
    
    mv.addObject("brands", brandRepo.findAll());
    return mv;
  }
}
