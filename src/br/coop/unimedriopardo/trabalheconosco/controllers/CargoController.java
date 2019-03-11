package br.coop.unimedriopardo.trabalheconosco.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCargo;

@Controller
@RequestMapping("/cargo")
public class CargoController {
	
	@Autowired
	private RepositorioCargo repositorioCargo;
	
	@GetMapping("/listagem")
	public String index(Model model) {
		List<Cargo> listaCargo = repositorioCargo.findAll();
		model.addAttribute("cargos", listaCargo);
		return "cargo.index.tiles";
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
		model.addAttribute("cargo", repositorioCargo.findOne(id));
		return  "cargo.form.tiles";
	}
	
	@GetMapping("/deletar/{id}")
	public String deletar(@PathVariable Long id) {
		repositorioCargo.delete(id);
		return "redirect:/cargo/listagem";
	}
}
