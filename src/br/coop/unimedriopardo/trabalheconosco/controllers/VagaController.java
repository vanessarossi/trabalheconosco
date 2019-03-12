package br.coop.unimedriopardo.trabalheconosco.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;
import br.coop.unimedriopardo.trabalheconosco.servicos.VagaService;

@Controller
@RequestMapping("/vaga")
public class VagaController {
	
	private final VagaService vagaService;

	@Autowired
	public VagaController(VagaService vagaService) {
		this.vagaService = vagaService;
	}

	@GetMapping("/listagem")
	public String index(Model model) {
		List<Vaga> vagas = vagaService.listarVaga();
		model.addAttribute("vagas",vagas);
		return "vaga.index.tiles";
	}
	
	@GetMapping("/lista/aberta")
	public String listarAbertas(Model model) {
		List<Vaga> vagas = vagaService.listarVagasAbertas();
		model.addAttribute("vagas",vagas);
		return "vaga.listagem.tiles";
	}
	
	@GetMapping("/formulario")
	public String formulario(Model model) {
		model.addAttribute("cargos", vagaService.listarCargo());
		model.addAttribute("postosAtendimento",vagaService.listarPostoAtendimento());
		return "vaga.form.tiles";
	}
	
	@PostMapping("/salvar")
	public String salvar(Vaga vaga) {
		vagaService.salvar(vaga);
		return "redirect:/vaga/listagem";
	}
	
	@GetMapping("/editar/{id}")
	public String editar(Model model,@PathVariable Long id) {
		Vaga vaga = vagaService.pesquisarPorId(id);
		model.addAttribute("cargos", vagaService.listarCargo());
		model.addAttribute("postosAtendimento",vagaService.listarPostoAtendimento());
		model.addAttribute("vaga", vaga);
		return "vaga.form.tiles";
	}
	
	@GetMapping("/deletar/{id}")
	public String deletar(@PathVariable Long id) {
		vagaService.deletar(id);
		return "redirect:/vaga/listagem";
	}

	@GetMapping("/info/{id}")
	public String informacao(Model model,@PathVariable Long id) {
		Vaga vaga = vagaService.pesquisarPorId(id);
		model.addAttribute("vaga", vaga);
		return "vaga.info.tiles";
	}
}
