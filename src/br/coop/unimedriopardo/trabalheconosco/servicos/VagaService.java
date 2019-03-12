package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.util.List;

import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.PostoAtendimento;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;

public interface VagaService {

	public List<Vaga> listarVaga();
	public List<Vaga> listarVagasAbertas();
	public List<Cargo> listarCargo();
	public List<PostoAtendimento> listarPostoAtendimento();
	public void salvar(Vaga vaga);
	public Vaga pesquisarPorId(Long id);
	public void deletar(Long id);
}
