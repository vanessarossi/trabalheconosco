package br.coop.unimedriopardo.trabalheconosco.servicos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioUsuario;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService{

	 private final RepositorioUsuario repositorioUsuario;

	
	@Autowired
	public UsuarioServiceImpl(RepositorioUsuario repositorioUsuario) {
		super();
		this.repositorioUsuario = repositorioUsuario;

	}


	@Override
	public Usuario pesquisarPorLoginESenha(String login, String senha) {
		return repositorioUsuario.findByLoginAndSenha(login, senha);
	}
}
