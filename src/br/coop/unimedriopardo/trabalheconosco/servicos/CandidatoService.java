package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.io.File;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;
import br.coop.unimedriopardo.trabalheconosco.util.CandidatoView;

public interface CandidatoService {
	
	public List<Estado> pesquisarEstado();
	public void salvar(Candidato candidato, MultipartFile file);
	public Candidato pesquisarCandidatoPorUsuario(Usuario usuario);
	public Candidato pesquisarCandidatoPorId(Long id);
	public Candidato pesquisarCandidatoPorCpf(String cpf);
	public Candidato pesquisarCandidatoPorLogin(String cpf);
	public Page<Candidato> pesquisarTodos(Pageable pageable);
	public List<Candidato> pesquisarTodos();
	public void gerarNovaSenha(String cpf);
	public void enviarEmail(Usuario usuario, String senha);
	public List<Cargo> pesquisarCargos();
	public List<CandidatoView> listarComFiltro(Long cargoId);
	public void enviarMsgEmail();
	public void enviarMsgEmailVaga();
	public Page<Candidato> listarPaginacao(Pageable pageable);
	public Page<Candidato> listarPaginacaoComPesquisa(String textoPesquisa, Pageable pageable);
	public String uploadCurriculo(String nomeArquivo, MultipartFile file);
	public File retornaPdf(Long id);
	
}
