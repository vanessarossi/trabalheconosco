package br.coop.unimedriopardo.trabalheconosco.entidades;

import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="vaga")
public class Vaga {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Column(name="menor_aprendiz")
	private Boolean menorAprendiz;

	@NotNull
	@Column(name="estagiario")
	private Boolean estagiario;

	@NotNull
	@Column(name="pcd")
	private Boolean pcd;
	
	@Column(name="pre_requisito", length=500)
	private String preRequisito;
	
	@NotBlank
	@Column(name="principais_atividades", length=500)
	private String principaisAtividades;
	
	@Column(name="palavras_chave", length=200)
	private String palavrasChave;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="data_cadastro")
	private Date dataCadastro;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="data_inicial")
	private Date dataInicial;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="data_final")
	private Date dataFinal;
	
	@Column(name="quantidade")
	private Integer quantidade;
	
	@NotNull
	@Column(name="ativo")
	private Boolean ativo;
	
	@ManyToOne
	@JoinColumn(name = "cargo_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_cargo_vaga"))
	private Cargo cargo;
	
	@ManyToOne
	@JoinColumn(name = "posto_atendimento_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_posto_atendimento_vaga"))
	private PostoAtendimento postoAtendimento;
	
	@JsonIgnore
	@OneToMany(mappedBy="vaga")
	private List<VagaxCandidato> vagasxcandidato;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getMenorAprendiz() {
		return menorAprendiz;
	}

	public void setMenorAprendiz(Boolean menorAprendiz) {
		this.menorAprendiz = menorAprendiz;
	}

	public Boolean getEstagiario() {
		return estagiario;
	}

	public void setEstagiario(Boolean estagiario) {
		this.estagiario = estagiario;
	}

	public Boolean getPcd() {
		return pcd;
	}

	public void setPcd(Boolean pcd) {
		this.pcd = pcd;
	}

	public String getPreRequisito() {
		return preRequisito;
	}

	public void setPreRequisito(String preRequisito) {
		this.preRequisito = preRequisito;
	}

	public String getPrincipaisAtividades() {
		return principaisAtividades;
	}

	public void setPrincipaisAtividades(String principaisAtividades) {
		this.principaisAtividades = principaisAtividades;
	}

	public String getPalavrasChave() {
		return palavrasChave;
	}

	public void setPalavrasChave(String palavrasChave) {
		this.palavrasChave = palavrasChave;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public PostoAtendimento getPostoAtendimento() {
		return postoAtendimento;
	}

	public void setPostoAtendimento(PostoAtendimento postoAtendimento) {
		this.postoAtendimento = postoAtendimento;
	}

	public List<VagaxCandidato> getVagasxcandidato() {
		return vagasxcandidato;
	}

	public void setVagasxcandidato(List<VagaxCandidato> vagasxcandidato) {
		this.vagasxcandidato = vagasxcandidato;
	}
}
