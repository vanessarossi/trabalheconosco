package br.coop.unimedriopardo.trabalheconosco.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="formacao_academica")
public class FormacaoAcademica {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	@Column(name="nome_curso", length=200)
	private String nomeCurso;
	
	@NotBlank
	@Column(name="instituicao" ,length=200)
	private String instituicao;
	
	@Column(name="data_inicio", length=10)
	private String dataInicio;
	
	@Column(name="data_fim", length=10)
	private String dataFim;
	
	@ManyToOne
	@JoinColumn(name = "nivel_formacao_id", referencedColumnName="id" , nullable=false, foreignKey = @ForeignKey(name = "Fk_nivel_formacao_formacao_academica"))
	private NivelFormacao nivelFormacao;
	
	@ManyToOne
	@JoinColumn(name="candidato_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_candidato_formacao_academica"))
	private Candidato candidato;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeCurso() {
		return nomeCurso;
	}

	public void setNomeCurso(String nomeCurso) {
		this.nomeCurso = nomeCurso;
	}

	public String getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}

	public String getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getDataFim() {
		return dataFim;
	}

	public void setDataFim(String dataFim) {
		this.dataFim = dataFim;
	}

	public NivelFormacao getNivelFormacao() {
		return nivelFormacao;
	}

	public void setNivelFormacao(NivelFormacao nivelFormacao) {
		this.nivelFormacao = nivelFormacao;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}
}
