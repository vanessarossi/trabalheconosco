package br.coop.unimedriopardo.trabalheconosco.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.coop.unimedriopardo.trabalheconosco.entidades.FormacaoAcademica;

public interface RepositorioFormacaoAcademica extends JpaRepository<FormacaoAcademica, Long> {

}
