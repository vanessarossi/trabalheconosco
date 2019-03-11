package br.coop.unimedriopardo.trabalheconosco.repositorios;

import br.coop.unimedriopardo.trabalheconosco.entidades.Contato;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RepositorioContato extends JpaRepository<Contato, Long>{

}
