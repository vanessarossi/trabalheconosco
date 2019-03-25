package br.coop.unimedriopardo.trabalheconosco.util;

import br.coop.unimedriopardo.trabalheconosco.entidades.Cidade;
import br.coop.unimedriopardo.trabalheconosco.entidades.Escolaridade;

public class PesquisaCandidato {
	
	private String estadoCivil;
	private String sexo;
	private Boolean pcd;
	private Escolaridade escolaridade;
	private Cidade cidade;
	private String textoFormacaoCurso;
	public String getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public Boolean getPcd() {
		return pcd;
	}
	public void setPcd(Boolean pcd) {
		this.pcd = pcd;
	}
	public Escolaridade getEscolaridade() {
		return escolaridade;
	}
	public void setEscolaridade(Escolaridade escolaridade) {
		this.escolaridade = escolaridade;
	}
	public Cidade getCidade() {
		return cidade;
	}
	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	public String getTextoFormacaoCurso() {
		return textoFormacaoCurso;
	}
	public void setTextoFormacaoCurso(String textoFormacaoCurso) {
		this.textoFormacaoCurso = textoFormacaoCurso;
	}
}
