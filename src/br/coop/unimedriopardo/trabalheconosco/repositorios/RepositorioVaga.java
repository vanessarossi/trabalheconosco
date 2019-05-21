package br.coop.unimedriopardo.trabalheconosco.repositorios;

import java.util.Date;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import br.coop.unimedriopardo.trabalheconosco.entidades.Vaga;

public interface RepositorioVaga extends JpaRepository<Vaga, Long>{

	public Page<Vaga> findByAtivoAndDataInicialLessThanEqualAndDataFinalGreaterThanEqual(Boolean ativo, Date dataAtual, Date dataFim, Pageable pageable);
}
