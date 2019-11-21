package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactController {
	@RequestMapping("lienhe")
	public String lienhe() {
		return "ContactKH";
	}
	@RequestMapping("Hethong")
	public String hethong() {
		return "system";
	}
}
