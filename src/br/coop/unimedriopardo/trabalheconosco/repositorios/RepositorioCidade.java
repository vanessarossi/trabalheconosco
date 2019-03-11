package br.coop.unimedriopardo.trabalheconosco.repositorios;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cidade;

public interface RepositorioCidade extends JpaRepository<Cidade, Long>{

	public List<Cidade> findByEstadoCodigoUf(Long id);
}
