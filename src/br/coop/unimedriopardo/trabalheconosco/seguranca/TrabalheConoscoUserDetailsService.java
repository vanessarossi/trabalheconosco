package br.coop.unimedriopardo.trabalheconosco.seguranca;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioUsuario;

public class TrabalheConoscoUserDetailsService implements UserDetailsService{
	

	@Autowired
	private RepositorioUsuario repositorioUsuario;
	
	@Override
	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
		Usuario usuario = repositorioUsuario.findByLogin(login);
		if (usuario == null) {
			throw new UsernameNotFoundException("Usuário não encontrado");
		}
		Set<GrantedAuthority> perfis = new HashSet<GrantedAuthority>();
		perfis.add(new SimpleGrantedAuthority(usuario.getPerfilAcesso()));
		return new User(usuario.getLogin(), usuario.getSenha(), perfis);
	}
	
	
}