package br.coop.unimedriopardo.trabalheconosco.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.coop.unimedriopardo.trabalheconosco.servicos.CandidatoService;

@Controller
public class HomeController {
	
	private final CandidatoService candidatoService;
	
	@Autowired
	public HomeController(CandidatoService candidatoService) {
		super();
		this.candidatoService = candidatoService;
	}

	@RequestMapping("/home")
	public String home(Model model, Principal principal) {
		model.addAttribute("candidatoLogado",candidatoService.pesquisarCandidatoPorLogin(principal.getName()));
		return "home.tiles";
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.tiles";
	}
	
}
