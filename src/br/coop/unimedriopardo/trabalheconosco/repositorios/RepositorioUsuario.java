package br.coop.unimedriopardo.trabalheconosco.repositorios;

import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long>{

	public Usuario findByLogin(String login);
	
	public Usuario findByLoginAndSenha(String login, String senha);

}
