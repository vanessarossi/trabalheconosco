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
	
	 @Query(nativeQuery = true, value = "call pesquisarComFiltro(:cidadeId, :textoPesquisa);")
	public List<Object[]> pesquisaComFiltro(@Param("cidadeId") Long cidade, @Param("textoPesquisa") String textoPesquisa);
	
}
