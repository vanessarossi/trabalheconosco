package br.coop.unimedriopardo.trabalheconosco.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.coop.unimedriopardo.trabalheconosco.entidades.Endereco;

public interface RepositorioEndereco extends JpaRepository<Endereco, Long> {

}
