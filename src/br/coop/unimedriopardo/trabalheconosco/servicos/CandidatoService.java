package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.List;

import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Escolaridade;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.NivelFormacao;
import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;

public interface CandidatoService {
	
	public List<Escolaridade> pesquisarEscolaridade();
	public List<NivelFormacao> pesquisarNivelFormacao();
	public List<Estado> pesquisarEstado();
	public Candidato salvar(Candidato candidato);
	public Candidato pesquisarCandidatoPorUsuario(Usuario usuario);
	public Candidato pesquisarCandidatoPorId(Long id);
	public Candidato pesquisarCandidatoPorCpf(String cpf);
	
}
