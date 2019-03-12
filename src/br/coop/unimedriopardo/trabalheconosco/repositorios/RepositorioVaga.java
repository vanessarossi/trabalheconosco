package br.coop.unimedriopardo.trabalheconosco.repositorios;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;

public interface RepositorioVaga extends JpaRepository<Vaga, Long>{

	public List<Vaga> findByAtivoAndDataInicialLessThanEqualAndDataFinalGreaterThanEqual(Boolean ativo, Date dataAtual, Date dataFim);
}
