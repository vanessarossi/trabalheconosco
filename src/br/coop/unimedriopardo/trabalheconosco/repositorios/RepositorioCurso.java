package br.coop.unimedriopardo.trabalheconosco.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.coop.unimedriopardo.trabalheconosco.entidades.Curso;

public interface RepositorioCurso extends JpaRepository<Curso, Long>{

}
