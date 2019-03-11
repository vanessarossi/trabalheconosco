package br.coop.unimedriopardo.trabalheconosco.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.servicos.CandidatoService;

@Controller
@RequestMapping("/candidato")
public class CandidatoController {
	
	private final CandidatoService candidatoService;

	@Autowired
	public CandidatoController(CandidatoService candidatoService) {
		this.candidatoService = candidatoService;
	}
	
	@RequestMapping("/curriculo")
	public String index(Model model) {
		return "candidato.index.tiles";
	}
	
	@GetMapping("/formulario")
	public String formulario(Model model) {
		model.addAttribute("escolaridades", candidatoService.pesquisarEscolaridade());
		model.addAttribute("niveisFormacao",candidatoService.pesquisarNivelFormacao());
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		return "candidato.form.tiles";
	}
	
	@PostMapping("/cadastrar")
	public String cadastrar(Model model, Candidato candidato) {
		Candidato candidatoPesquisado = candidatoService.pesquisarCandidatoPorCpf(candidato.getCpf());	
		if (candidatoPesquisado == null) {
			model.addAttribute("escolaridades", candidatoService.pesquisarEscolaridade());
			model.addAttribute("niveisFormacao",candidatoService.pesquisarNivelFormacao());
			model.addAttribute("estados",candidatoService.pesquisarEstado());
			model.addAttribute("candidato", candidato);
			return "candidato.form.tiles";
		}else {
			model.addAttribute("mensagem", "Já possuímos um cadastro com este CPF");
			return "index.tiles";
		}
	}
		
	@PostMapping("/salvar")
	public String salvar(Candidato candidato, Model model) {
		Candidato candidatoSalvo =  candidatoService.salvar(candidato);
		model.addAttribute("candidato", candidatoSalvo);
		return "redirect:/candidato/curriculo";
	}
	
}
