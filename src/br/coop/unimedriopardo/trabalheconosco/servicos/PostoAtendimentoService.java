package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import br.coop.unimedriopardo.trabalheconosco.entidades.Cidade;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;

public interface PostoAtendimentoService {
	
	public Page<PostoAtendimento> listar(Pageable pageable);
	public PostoAtendimento pesquisarPorId(Long id);
	public List<Estado> listarEstadosOrdenadoPorNome();
	public void salvar(PostoAtendimento postoAtendimento);
	public void deletar(Long id);
	public List<Cidade> pesquisarCidadePorCodigoUf(Long codigoUf);

}
