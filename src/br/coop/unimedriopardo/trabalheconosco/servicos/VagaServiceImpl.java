package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCargo;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioPostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioVaga;

@Service
@Transactional
public class VagaServiceImpl implements VagaService{

	private RepositorioVaga repositorioVaga;
	private RepositorioCargo repositorioCargo;
	private RepositorioPostoAtendimento repositorioPostoAtendimento;
	
	@Autowired
	public VagaServiceImpl(RepositorioVaga repositorioVaga, RepositorioCargo repositorioCargo,
			RepositorioPostoAtendimento repositorioPostoAtendimento) {
		super();
		this.repositorioVaga = repositorioVaga;
		this.repositorioCargo = repositorioCargo;
		this.repositorioPostoAtendimento = repositorioPostoAtendimento;
	}

	@Override
	public List<Vaga> listarVaga() {
		return repositorioVaga.findAll(new Sort("dataCadastro"));
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
	public List<Vaga> listarVagasAbertas() {
		return repositorioVaga.findByAtivoAndDataInicialLessThanEqualAndDataFinalGreaterThanEqual(true, new Date(), new Date());
	}
}
