package br.coop.unimedriopardo.trabalheconosco.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;
import br.coop.unimedriopardo.trabalheconosco.entidades.VagaxCandidato;
import br.coop.unimedriopardo.trabalheconosco.servicos.CandidatoService;
import br.coop.unimedriopardo.trabalheconosco.servicos.VagaService;

@Controller
@RequestMapping("/vaga")
public class VagaController {
	
	private final VagaService vagaService;
	private final CandidatoService candidatoService;

	@Autowired
	public VagaController(VagaService vagaService, CandidatoService candidatoService) {
		this.vagaService = vagaService;
		this.candidatoService = candidatoService;
	}

	@GetMapping("/listagem")
	public String index(Model model) {
		return "vaga.index.tiles";
	}
	
	@GetMapping("/pesquisa")
	public @ResponseBody Page<Vaga> pesquisaPaginacao(
            @RequestParam(
            		value = "page",
                    required = false,
                    defaultValue = "0") int page,
            @RequestParam(
                    value = "size",
                    required = false,
                    defaultValue = "10") int size) {
		PageRequest pageRequest = new PageRequest(page, size, Sort.DEFAULT_DIRECTION,"dataCadastro");
		return vagaService.listarVaga(pageRequest);
	}
	
	@GetMapping("/lista/aberta")
	public String listarAbertas() {
		return "vaga.listagem.tiles";
	}
	
	@GetMapping("/pesquisa/aberta")
	public @ResponseBody Page<Vaga> pesquisaPaginacaoAberta(
            @RequestParam(
            		value = "page",
                    required = false,
                    defaultValue = "0") int page,
            @RequestParam(
                    value = "size",
                    required = false,
                    defaultValue = "10") int size) {
		PageRequest pageRequest = new PageRequest(page, size, Sort.DEFAULT_DIRECTION,"dataCadastro");
		return vagaService.listarVagasAbertas(pageRequest);
	}
	
	
	@GetMapping("/lista/candidatura/{id}")
	public String listarCandidatura(@PathVariable("id") Long id, Model model) {
		model.addAttribute("vaga", vagaService.pesquisarPorId(id));
		return "vaga.listagem.candidaturas.tiles";
	}
	
	
	@GetMapping("/pesquisa/candidatura")
	public @ResponseBody Page<VagaxCandidato> pesquisaPaginacaoCandidatura(
			@RequestParam(
            		value = "vagaId",
                    required = true) long vagaId,
            @RequestParam(
            		value = "page",
                    required = false,
                    defaultValue = "0") int page,
            @RequestParam(
                    value = "size",
                    required = false,
                    defaultValue = "10") int size) {
		PageRequest pageRequest = new PageRequest(page, size);
		return vagaService.listarCandidaturas(vagaId,pageRequest);
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
	public String informacao(Model model,@PathVariable Long id, Principal principal) {
		Vaga vaga = vagaService.pesquisarPorId(id);
		Candidato candidato = candidatoService.pesquisarCandidatoPorLogin(principal.getName());
		VagaxCandidato vagaxcandidato = vagaService.pesquisarCandidatura(vaga,candidato);
		model.addAttribute("vagaxcandidato",vagaxcandidato);
		model.addAttribute("vaga", vaga);
		return "vaga.info.tiles";
	}
	
	@GetMapping("/candidatar/{id}")
	public String candidatar(Model model,@PathVariable Long id, Principal principal) {
		Candidato candidato = candidatoService.pesquisarCandidatoPorLogin(principal.getName());
		Vaga vaga = vagaService.pesquisarPorId(id);
		vagaService.candidatar(candidato, vaga);
		return "redirect:/vaga/lista/aberta";
	}
	
	@GetMapping("/descandidatar/{id}")
	public String descandidatar(Model model,@PathVariable Long id) {
		vagaService.deletarCandidatura(id);
		return "redirect:/vaga/lista/aberta";
	}
	
}
