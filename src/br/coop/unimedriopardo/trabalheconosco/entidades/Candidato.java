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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "candidato")
public class Candidato {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(name = "cpf", length = 20, unique=true)
	private String cpf;

	@NotBlank
	@Column(name = "nome", length = 200)
	private String nome;

	@Column(name = "data_cadastro")
	private String dataCadastro;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "data_ultima_atualizacao")
	private Date dataUltimaAtualizacao;

	@Column(name="email" , length=150)
	private String email;
	
	@Column(name="caminhoAnexo", length=100)
	private String caminhoAnexo;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "opcao_um_cargo_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "Fk_candidato_opcao_um"))
	private Cargo opcaoUm;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "opcao_dois_cargo_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "Fk_candidato_opcao_dois"))
	private Cargo opcaoDois;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "opcao_tres_cargo_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "Fk_candidato_opcao_tres"))
	private Cargo opcaoTres;
	
	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "usuario_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_usuario_usuario"))
	private Usuario usuario;

	@JsonIgnore
	@OneToMany(mappedBy = "candidato")
	private List<VagaxCandidato> vagasxcandidato;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome.toUpperCase();
	}

	public String getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(String dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Date getDataUltimaAtualizacao() {
		return dataUltimaAtualizacao;
	}

	public void setDataUltimaAtualizacao(Date dataUltimaAtualizacao) {
		this.dataUltimaAtualizacao = dataUltimaAtualizacao;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCaminhoAnexo() {
		return caminhoAnexo;
	}

	public void setCaminhoAnexo(String caminhoAnexo) {
		this.caminhoAnexo = caminhoAnexo;
	}

	public Cargo getOpcaoUm() {
		return opcaoUm;
	}

	public void setOpcaoUm(Cargo opcaoUm) {
		this.opcaoUm = opcaoUm;
	}

	public Cargo getOpcaoDois() {
		return opcaoDois;
	}

	public void setOpcaoDois(Cargo opcaoDois) {
		this.opcaoDois = opcaoDois;
	}

	public Cargo getOpcaoTres() {
		return opcaoTres;
	}

	public void setOpcaoTres(Cargo opcaoTres) {
		this.opcaoTres = opcaoTres;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<VagaxCandidato> getVagasxcandidato() {
		return vagasxcandidato;
	}

	public void setVagasxcandidato(List<VagaxCandidato> vagasxcandidato) {
		this.vagasxcandidato = vagasxcandidato;
	}
	
}
