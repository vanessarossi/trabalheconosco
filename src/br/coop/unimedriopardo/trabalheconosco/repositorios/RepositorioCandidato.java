package br.coop.unimedriopardo.trabalheconosco.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;

public interface RepositorioCandidato extends JpaRepository<Candidato, Long>{

	public Candidato findByUsuario_Id(Long id);
	public Candidato findByUsuario_Login(String cpf);
	public Candidato findByCpf(String cpf);
}
