package br.coop.unimedriopardo.trabalheconosco.repositorios;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import br.coop.unimedriopardo.trabalheconosco.entidades.VagaxCandidato;

public interface RepositorioVagaxCandidato extends JpaRepository<VagaxCandidato, Long>{
	
	public VagaxCandidato findByVaga_idAndCandidato_id(Long vagaId, Long candidatoId);
	public Page<VagaxCandidato> findByVaga_id(Long vagaId, Pageable pageable);
}
