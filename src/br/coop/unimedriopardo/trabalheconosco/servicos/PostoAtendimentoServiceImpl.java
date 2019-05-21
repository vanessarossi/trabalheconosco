package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.coop.unimedriopardo.trabalheconosco.entidades.Cidade;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCidade;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioEstado;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioPostoAtendimento;

@Service
@Transactional
public class PostoAtendimentoServiceImpl implements PostoAtendimentoService {

	private RepositorioPostoAtendimento repositorioPostoAtendimento;
	private RepositorioEstado repositorioEstado;	
	private RepositorioCidade repositorioCidade;
	
	@Autowired
	public PostoAtendimentoServiceImpl(RepositorioPostoAtendimento repositorioPostoAtendimento,
			RepositorioEstado repositorioEstado, RepositorioCidade repositorioCidade) {
		super();
		this.repositorioPostoAtendimento = repositorioPostoAtendimento;
		this.repositorioEstado = repositorioEstado;
		this.repositorioCidade = repositorioCidade;
	}

	@Override
	public Page<PostoAtendimento> listar(Pageable pageable) {
		return repositorioPostoAtendimento.findAll(pageable);
	}

	@Override
	public PostoAtendimento pesquisarPorId(Long id) {
		return repositorioPostoAtendimento.findOne(id);
	}

	@Override
	public List<Estado> listarEstadosOrdenadoPorNome() {
		return repositorioEstado.findAll(new Sort("nome"));
	}

	@Override
	public void salvar(PostoAtendimento postoAtendimento) {
		repositorioPostoAtendimento.save(postoAtendimento);
		
	}

	@Override
	public void deletar(Long id) {
		repositorioPostoAtendimento.delete(id);
		
	}

	@Override
	public List<Cidade> pesquisarCidadePorCodigoUf(Long codigoUf) {
		return repositorioCidade.findByEstadoCodigoUf(codigoUf);
	}
	
	
}
