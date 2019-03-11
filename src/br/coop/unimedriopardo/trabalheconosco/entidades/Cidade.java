package br.coop.unimedriopardo.trabalheconosco.entidades;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
@Table(name="cidade")
public class Cidade {

	@Id
	@Column(name="codigo_ibge")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long codigoIbge;
	
	@Column(length=100)
	private String nome;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "codigo_uf", nullable=false, foreignKey = @ForeignKey(name = "Fk_estado_cidade"))
	private Estado estado;
	
	@JsonIgnore
	@OneToMany(mappedBy="cidade")
	private List<PostoAtendimento> postosAtendimento;
	
	@JsonIgnore
	@OneToMany(mappedBy="cidade")
	private List<Endereco> enderecos;

	public Long getCodigoIbge() {
		return codigoIbge;
	}

	public void setCodigoIbge(Long codigoIbge) {
		this.codigoIbge = codigoIbge;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public List<PostoAtendimento> getPostosAtendimento() {
		return postosAtendimento;
	}

	public void setPostosAtendimento(List<PostoAtendimento> postosAtendimento) {
		this.postosAtendimento = postosAtendimento;
	}

	public List<Endereco> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
}
