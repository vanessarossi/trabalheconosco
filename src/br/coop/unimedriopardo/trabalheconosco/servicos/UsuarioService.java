package br.coop.unimedriopardo.trabalheconosco.servicos;

import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;

public interface UsuarioService {

	public Usuario pesquisarPorLoginESenha(String login, String senha);
}
