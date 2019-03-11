package br.coop.unimedriopardo.trabalheconosco.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;

public interface RepositorioCargo extends JpaRepository<Cargo, Long> {

}
