package br.coop.unimedriopardo.trabalheconosco.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public String home() {
		return "home.tiles";
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.tiles";
	}
	
}
