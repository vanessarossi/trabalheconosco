package br.coop.unimedriopardo.trabalheconosco.controllers;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
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
	
	@RequestMapping("/listagem")
	public String listaCurriculos(Model model) {
			model.addAttribute("candidatos", candidatoService.pesquisarTodos());
		return "candidato.listagem.tiles";
	}
	
	
	@RequestMapping("/meucurriculo")
	public String index(Model model, Principal principal) {
			model.addAttribute("candidato",candidatoService.pesquisarCandidatoPorLogin(principal.getName()));
		return "candidato.index.tiles";
	}
	
	@RequestMapping("/editar")
	public String editar(Model model, Principal principal) {
		model.addAttribute("escolaridades", candidatoService.pesquisarEscolaridade());
		model.addAttribute("niveisFormacao",candidatoService.pesquisarNivelFormacao());
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		model.addAttribute("candidato",candidatoService.pesquisarCandidatoPorLogin(principal.getName()));
		return "candidato.form.tiles";
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
			model.addAttribute("mensagem", "CPF j� cadastrado!");
			return "index.tiles";
		}
	}
		
	@PostMapping("/salvar")
	public String salvar(Candidato candidato, Model model) {
		Candidato candidatoSalvo =  candidatoService.salvar(candidato);
		model.addAttribute("candidato", candidatoSalvo);
		return "redirect:/candidato/meucurriculo";
	}
	
	@GetMapping("/deletar/experienciaProfissional/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletarExperienciaProfissional(@PathVariable("id") Long id){
		candidatoService.deletarExperienciaProfissional(id);
	}
	
	@GetMapping("/deletar/formacaoAcademica/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletarFormacaoAcademica(@PathVariable("id") Long id){
		candidatoService.deletarFormacaoAcademica(id);
	}
	
	@GetMapping("/deletar/curso/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletarCurso(@PathVariable("id") Long id){
		candidatoService.deletarCurso(id);
	}
	
}