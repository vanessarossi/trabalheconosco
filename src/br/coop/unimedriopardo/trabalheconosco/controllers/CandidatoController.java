package br.coop.unimedriopardo.trabalheconosco.controllers;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Principal;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String listagemCurriculos() {
		return "candidato.listagem.tiles";
	}
	
	@GetMapping("/pesquisa")
	public @ResponseBody Page<Candidato> pesquisaPaginacao(
			@RequestParam(
            		value = "textoPesquisa",
                    required = false,
                    defaultValue = "") String textoPesquisa,
            @RequestParam(
            		value = "page",
                    required = false,
                    defaultValue = "0") int page,
            @RequestParam(
                    value = "size",
                    required = false,
                    defaultValue = "10") int size) {
		PageRequest pageRequest = new PageRequest(page, size, Sort.DEFAULT_DIRECTION,"nome");
		Page<Candidato> candidatos = null;
		
		if (textoPesquisa != "") {
			candidatos = candidatoService.listarPaginacaoComPesquisa(textoPesquisa, pageRequest);
		}else {
			candidatos = candidatoService.listarPaginacao(pageRequest);
		}
		return candidatos;
	}
	
	@RequestMapping("/enviarEmail")
	public String enviarEmail() {
		candidatoService.enviarMsgEmail();
		return "home.tiles";
	}
	
	@PostMapping("/pesquisa/avancada/filtrar")
	public String listagemCurriculos(Model model, PesquisaCandidato pesquisaCandidato) {
		model.addAttribute("candidatos",candidatoService.listarComFiltro(pesquisaCandidato.getCargoId()));
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		return "candidato.pesquisa.avancada.tiles";
	}
		
	@RequestMapping("/pesquisa/avancada")
	public String pesquisaAvancadao(Model model) {
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
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		model.addAttribute("candidato",candidatoService.pesquisarCandidatoPorLogin(principal.getName()));
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		return "candidato.form.tiles";
	}
	
	@GetMapping("/formulario")
	public String formulario(Model model) {
		model.addAttribute("estados",candidatoService.pesquisarEstado());
		model.addAttribute("cargos", candidatoService.pesquisarCargos());
		return "candidato.form.tiles";
	}
	
	@PostMapping("/cadastrar")
	public String cadastrar(Model model, Candidato candidato) {
		Candidato candidatoPesquisado = candidatoService.pesquisarCandidatoPorCpf(candidato.getCpf());	
		if (candidatoPesquisado == null) {
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
	public String salvar(Candidato candidato, Model model, @RequestParam("arquivo") MultipartFile file) {
		candidatoService.salvar(candidato, file);
		return "redirect:/candidato/meucurriculo";
	}
	
	@GetMapping("/imprimir/{id}")
	public void imprimir (HttpServletResponse response,@PathVariable(value="id") Long id) {
		try {
			File file = candidatoService.retornaPdf(id);
			response.setContentType("pdf");
			response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "utf-8"));
			
			InputStream in = new FileInputStream(file);
			ServletOutputStream out = response.getOutputStream();
	
			byte[] buffer = new byte[(int)file.length()];
			int nLidos;
			
			while((nLidos = in.read(buffer)) >= 0) {
				out.write(buffer, 0, nLidos);
			}
			out.flush();
			out.close();
			in.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
