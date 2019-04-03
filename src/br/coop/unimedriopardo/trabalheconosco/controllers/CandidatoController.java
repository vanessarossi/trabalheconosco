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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.servicos.CandidatoService;
import br.coop.unimedriopardo.trabalheconosco.util.PesquisaCandidato;

@Controller
@RequestMapping("/candidato")
public class CandidatoController {
	
	private final CandidatoService candidatoService;

	@Autowired
	public CandidatoController(CandidatoService candidatoService) {
		this.candidatoService = candidatoService;
	}
	
	@RequestMapping("/listagem")
	public String listagemCurriculos(Model model) {
		model.addAttribute("candidatos",candidatoService.pesquisarTodos());
		return "candidato.listagem.tiles";
	}
	
	
	@RequestMapping("/enviarEmail")
	public String enviarEmail() {
		candidatoService.enviarMsgEmail();
		return "home.tiles";
	}
	
	@PostMapping("/pesquisa/avancada/filtrar")
	public String listagemCurriculos(Model model, PesquisaCandidato pesquisaCandidato) {
		model.addAttribute("candidatos",candidatoService.listarComFiltro(pesquisaCandidato.getCidadeId(), pesquisaCandidato.getTextoPesquisa()));
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		return "candidato.pesquisa.avancada.tiles";
	}
		
	@RequestMapping("/pesquisa/avancada")
	public String pesquisaAvancadao(Model model) {
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		return "candidato.pesquisa.avancada.tiles";
	}
		
	@RequestMapping("/meucurriculo")
	public String index(Model model, Principal principal) {
			model.addAttribute("candidato",candidatoService.pesquisarCandidatoPorLogin(principal.getName()));
		return "candidato.index.tiles";
	}
	
	@RequestMapping("/visualizar/informacoes/{id}")
	public String info(Model model, @PathVariable(value="id") Long id) {
		model.addAttribute("candidato", candidatoService.pesquisarCandidatoPorId(id));
		return "candidato.info.tiles";
	}
	
	@RequestMapping("/editar")
	public String editar(Model model, Principal principal) {
		model.addAttribute("escolaridades", candidatoService.pesquisarEscolaridade());
		model.addAttribute("niveisFormacao",candidatoService.pesquisarNivelFormacao());
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		model.addAttribute("candidato",candidatoService.pesquisarCandidatoPorLogin(principal.getName()));
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		return "candidato.form.tiles";
	}
	
	@GetMapping("/formulario")
	public String formulario(Model model) {
		model.addAttribute("escolaridades", candidatoService.pesquisarEscolaridade());
		model.addAttribute("niveisFormacao",candidatoService.pesquisarNivelFormacao());
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		return "candidato.form.tiles";
	}
	
	@PostMapping("/cadastrar")
	public String cadastrar(Model model, Candidato candidato) {
		Candidato candidatoPesquisado = candidatoService.pesquisarCandidatoPorCpf(candidato.getCpf());	
		if (candidatoPesquisado == null) {
			model.addAttribute("escolaridades", candidatoService.pesquisarEscolaridade());
			model.addAttribute("niveisFormacao",candidatoService.pesquisarNivelFormacao());
			model.addAttribute("estados",candidatoService.pesquisarEstado());
			model.addAttribute("cargos", candidatoService.pesquisarCargos());
			model.addAttribute("candidato", candidato);
			return "candidato.form.tiles";
		}else {
			model.addAttribute("mensagem", "CPF já cadastrado!");
			return "index.tiles";
		}
	}
		
	@PostMapping("/salvar")
	public String salvar(Candidato candidato, Model model, @RequestParam("imagem") MultipartFile file) {
		candidatoService.salvar(candidato, file);
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
