package br.coop.unimedriopardo.trabalheconosco.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;

public interface RepositorioCandidato extends JpaRepository<Candidato,Long>, PagingAndSortingRepository<Candidato, Long> {

	public Candidato findByUsuario_Id(Long id);
	public Candidato findByUsuario_Login(String cpf);
	public Candidato findByCpf(String cpf);
	
	
	@Query(nativeQuery = true, value = "call pesquisarComFiltroCargo(:cargoId);")
	public List<Object[]> pesquisarComFiltroCargo(@Param("cargoId") Long cargoId);
	
	@Query(nativeQuery = true, value = "call pesquisarComFiltroCargoCidade(:cargoId, :cidadeId);")
	public List<Object[]> pesquisarComFiltroCargoCidade(@Param("cargoId") Long cargoId, @Param("cidadeId") Long cidadeId);
	
	@Query(nativeQuery = true, value = "call pesquisarComFiltroCidade(:cidadeId);")
	public List<Object[]> pesquisarComFiltroCidade(@Param("cidadeId") Long cidadeId);
	
	@Query(nativeQuery = true, value = "call pesquisarComFiltroCidadeTextoCargo(:cidadeId, :textoPesquisa, :cargoId);")
	public List<Object[]> pesquisarComFiltroCidadeTextoCargo(@Param("cidadeId") Long cidade, @Param("textoPesquisa") String textoPesquisa, @Param("cargoId") Long cargoId);
	
	

}
