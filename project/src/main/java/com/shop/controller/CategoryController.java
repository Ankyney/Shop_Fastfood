package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.services.CategoryService;
import com.shop.services.ProductService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@GetMapping("/load")
	public String category(ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());
		return "load";
	}

	@GetMapping("/products")
	public String getPrByCate(@RequestParam("cateID") Long id, ModelMap model) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("products", productService.searchByCateID(id));
		return "load";
	}



}
