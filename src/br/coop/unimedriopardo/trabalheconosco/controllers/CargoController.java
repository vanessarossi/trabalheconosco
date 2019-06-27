package br.coop.unimedriopardo.trabalheconosco.controllers;

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

import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCargo;

@Controller
@RequestMapping("/cargo")
public class CargoController {
	
	@Autowired
	private RepositorioCargo repositorioCargo;
	
	@GetMapping("/listagem")
	public String index() {
		return "cargo.index.tiles";
	}
	
	@GetMapping("/pesquisa")
	public @ResponseBody Page<Cargo> pesquisaPaginacao(
            @RequestParam(
            		value = "page",
                    required = false,
                    defaultValue = "0") int page,
            @RequestParam(
                    value = "size",
                    required = false,
                    defaultValue = "10") int size) {
		PageRequest pageRequest = new PageRequest(page, size, Sort.DEFAULT_DIRECTION,"nome");
		return repositorioCargo.findAll(pageRequest);
	}
	
	
	
	@GetMapping("/formulario")
	public String formulario(Model model) {
		return  "cargo.form.tiles";
	}
	
	@PostMapping("/salvar")
	public String salvar(Cargo cargo) {
		repositorioCargo.save(cargo);
		return "redirect:/cargo/listagem";
	}
	
	@GetMapping("/editar/{id}")
	public String editar(Model model, @PathVariable Long id) {
		model.addAttribute("cargo", repositorioCargo.findById(id).orElse(new Cargo()));
		return  "cargo.form.tiles";
	}
	
	@GetMapping("/deletar/{id}")
	public String deletar(@PathVariable Long id) {
		repositorioCargo.deleteById(id);
		return "redirect:/cargo/listagem";
	}
}
