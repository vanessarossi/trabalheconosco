package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;
import br.coop.unimedriopardo.trabalheconosco.entidades.VagaxCandidato;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCargo;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioPostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioVaga;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioVagaxCandidato;

@Service
@Transactional
public class VagaServiceImpl implements VagaService{

	private RepositorioVaga repositorioVaga;
	private RepositorioCargo repositorioCargo;
	private RepositorioPostoAtendimento repositorioPostoAtendimento;
	private RepositorioVagaxCandidato repositorioVagaxCandidato;
	
	@Autowired
	public VagaServiceImpl(RepositorioVaga repositorioVaga, RepositorioCargo repositorioCargo,
			RepositorioPostoAtendimento repositorioPostoAtendimento, RepositorioVagaxCandidato repositorioVagaxCandidato) {
		super();
		this.repositorioVaga = repositorioVaga;
		this.repositorioCargo = repositorioCargo;
		this.repositorioPostoAtendimento = repositorioPostoAtendimento;
		this.repositorioVagaxCandidato = repositorioVagaxCandidato;
	}

	@Override
	public Page<Vaga> listarVaga(Pageable pageable) {
		return repositorioVaga.findAll(pageable);
	}

	@Override
	public List<Cargo> listarCargo() {
		return repositorioCargo.findAll(new Sort("nome"));
	}

	@Override
	public List<PostoAtendimento> listarPostoAtendimento() {
		return repositorioPostoAtendimento.findAll(new Sort("nome"));
	}

	@Override
	public void salvar(Vaga vaga) {
		if (vaga.getAtivo() == null){
			vaga.setAtivo(false);
		}if(vaga.getEstagiario() == null){
			vaga.setEstagiario(false);
		}if(vaga.getMenorAprendiz() == null) {
			vaga.setMenorAprendiz(false);
		}if(vaga.getPcd() == null) {
			vaga.setPcd(false);
		}
		vaga.setDataCadastro(new Date());
		repositorioVaga.save(vaga);
	}

	@Override
	public Vaga pesquisarPorId(Long id) {
		return repositorioVaga.findOne(id);
	}

	@Override
	public void deletar(Long id) {
		repositorioVaga.delete(id);
	}

	@Override
	public Page<Vaga> listarVagasAbertas(Pageable pageable) {
		return repositorioVaga.findByAtivoAndDataInicialLessThanEqualAndDataFinalGreaterThanEqual(true, new Date(), new Date(), pageable);
	}

	@Override
	public void candidatar(Candidato candidato, Vaga vaga) {
		VagaxCandidato candidatura =  repositorioVagaxCandidato.findByVaga_idAndCandidato_id(vaga.getId(), candidato.getId());
		if (candidatura == null) {
			VagaxCandidato vagaxCandidato = new VagaxCandidato();
			vagaxCandidato.setCandidato(candidato);
			vagaxCandidato.setVaga(vaga);
			repositorioVagaxCandidato.save(vagaxCandidato);
		}
	}

	@Override
	public VagaxCandidato pesquisarCandidatura(Vaga vaga, Candidato candidato) {
		return repositorioVagaxCandidato.findByVaga_idAndCandidato_id(vaga.getId(), candidato.getId());
	}

	@Override
	public void deletarCandidatura(Long id) {
		repositorioVagaxCandidato.delete(id);
	}

	@Override
	public Page<VagaxCandidato> listarCandidaturas(Long id, Pageable pageable) {
		return repositorioVagaxCandidato.findByVaga_id(id, pageable);
	}
}
