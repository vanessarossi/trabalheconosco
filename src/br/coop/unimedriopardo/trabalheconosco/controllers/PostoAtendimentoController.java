package br.coop.unimedriopardo.trabalheconosco.controllers;

import java.util.List;
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
import br.coop.unimedriopardo.trabalheconosco.entidades.Cidade;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.servicos.PostoAtendimentoService;

@Controller
@RequestMapping("/postoAtendimento")
public class PostoAtendimentoController {

	private final PostoAtendimentoService postoAtendimentoService;
	
	@Autowired
	public PostoAtendimentoController(PostoAtendimentoService postoAtendimentoService) {
		super();
		this.postoAtendimentoService = postoAtendimentoService;
	}

	@GetMapping("/listagem")
	public String index() {
		return "postoAtendimento.index.tiles";
	}
	
	@GetMapping("/pesquisa")
	public @ResponseBody Page<PostoAtendimento> pesquisaPaginacao(
            @RequestParam(
            		value = "page",
                    required = false,
                    defaultValue = "0") int page,
            @RequestParam(
                    value = "size",
                    required = false,
                    defaultValue = "10") int size) {
		PageRequest pageRequest = new PageRequest(page, size, Sort.DEFAULT_DIRECTION,"nome");
		return postoAtendimentoService.listar(pageRequest);
	}
	
	
	@GetMapping("/formulario")
	public String formulario(Model model) {
		model.addAttribute("estados",postoAtendimentoService.listarEstadosOrdenadoPorNome());
		model.addAttribute("postoAtendimento", new PostoAtendimento());
		return "postoAtendimento.form.tiles";
	}
	
	@PostMapping("/salvar")
	public String salvar(PostoAtendimento postoAtendimento) {
		postoAtendimentoService.salvar(postoAtendimento);
		return "redirect:/postoAtendimento/listagem";
	}
	
	@GetMapping("/editar/{id}")
	public String editar(Model model, @PathVariable Long id) {
		PostoAtendimento postoAtendimento = postoAtendimentoService.pesquisarPorId(id);
		model.addAttribute("estados",postoAtendimentoService.listarEstadosOrdenadoPorNome());
		model.addAttribute("postoAtendimento", postoAtendimento);
		return "postoAtendimento.form.tiles";
	}
	
	@GetMapping("/deletar/{id}")
	public String deletar(@PathVariable Long id) {
		postoAtendimentoService.deletar(id);
		return "redirect:/postoAtendimento/listagem";
	}

	@GetMapping("/pesquisarCidadePorEstado/{codigoUf}")
	public @ResponseBody List<Cidade> pesquisarCidadePorEstado(@PathVariable("codigoUf") Long codigoUf){
		List<Cidade> cidades = postoAtendimentoService.pesquisarCidadePorCodigoUf(codigoUf);
		return cidades;
	}
}
