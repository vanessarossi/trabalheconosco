package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;
import br.coop.unimedriopardo.trabalheconosco.entidades.VagaxCandidato;

public interface VagaService {

	public Page<Vaga> listarVaga(Pageable pageable);
	public Page<Vaga> listarVagasAbertas(Pageable pageable);
	public List<Cargo> listarCargo();
	public List<PostoAtendimento> listarPostoAtendimento();
	public void salvar(Vaga vaga);
	public Vaga pesquisarPorId(Long id);
	public void deletar(Long id);
	public void candidatar(Candidato candidato, Vaga vaga);
	public VagaxCandidato pesquisarCandidatura(Vaga vaga, Candidato candidato);
	public void deletarCandidatura(Long id);
	public Page<VagaxCandidato> listarCandidaturas(Long id, Pageable pageable);
}
