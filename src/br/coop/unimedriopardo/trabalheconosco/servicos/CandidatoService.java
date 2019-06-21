package br.coop.unimedriopardo.trabalheconosco.servicos;


import java.io.File;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.Escolaridade;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.NivelFormacao;
import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;
import br.coop.unimedriopardo.trabalheconosco.util.CandidatoView;

public interface CandidatoService {
	
	public List<Escolaridade> pesquisarEscolaridade();
	public List<NivelFormacao> pesquisarNivelFormacao();
	public List<Estado> pesquisarEstado();
	public void salvar(Candidato candidato, MultipartFile file);
	public Candidato pesquisarCandidatoPorUsuario(Usuario usuario);
	public Candidato pesquisarCandidatoPorId(Long id);
	public Candidato pesquisarCandidatoPorCpf(String cpf);
	public Candidato pesquisarCandidatoPorLogin(String cpf);
	public String uploadFoto(String nomeArquivo,MultipartFile file);
	public void deletarFormacaoAcademica(Long id);
	public void deletarExperienciaProfissional(Long id);
	public void deletarCurso(Long id);
	public Page<Candidato> pesquisarTodos(Pageable pageable);
	public List<Candidato> pesquisarTodos();
	public void gerarNovaSenha(String cpf);
	public void enviarEmail(Usuario usuario, String senha);
	public List<Cargo> pesquisarCargos();
	public List<CandidatoView> listarComFiltro(Long cidadeId, String textoPesquisa, Long cargoId);
	public void enviarMsgEmail();
	public void enviarMsgEmailVaga();
	public File imprimirCurriculo(Candidato candidato);
	public Page<Candidato> listarPaginacao(Pageable pageable);
	public Page<Candidato> listarPaginacaoComPesquisa(String textoPesquisa, Pageable pageable);
}
