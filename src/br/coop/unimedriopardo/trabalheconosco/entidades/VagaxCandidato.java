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

@Entity
@Table(name="vagaxcandidato")
public class VagaxCandidato {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="selecionado_entrevista")
	private Boolean selecionadoEntrevista;
	
	@Column(name="contratado")
	private Boolean contratado;
	
	@ManyToOne
	@JoinColumn(name = "vaga_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_vaga_vagaxcandidato"))
	private Vaga vaga;
	
	@ManyToOne
	@JoinColumn(name = "candidato_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_candidato_vagaxcandidato"))
	private Candidato candidato;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getSelecionadoEntrevista() {
		return selecionadoEntrevista;
	}

	public void setSelecionadoEntrevista(Boolean selecionadoEntrevista) {
		this.selecionadoEntrevista = selecionadoEntrevista;
	}

	public Boolean getContratado() {
		return contratado;
	}

	public void setContratado(Boolean contratado) {
		this.contratado = contratado;
	}

	public Vaga getVaga() {
		return vaga;
	}

	public void setVaga(Vaga vaga) {
		this.vaga = vaga;
	}

	public Candidato getCandidato() {
		return candidato;
	}

	public void setCandidato(Candidato candidato) {
		this.candidato = candidato;
	}
	
	
}
