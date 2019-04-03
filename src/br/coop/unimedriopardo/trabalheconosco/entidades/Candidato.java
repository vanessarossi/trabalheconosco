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

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "candidato")
public class Candidato {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Column(name = "cpf", length = 20)
	private String cpf;

	@NotBlank
	@Column(name = "nome", length = 200)
	private String nome;

	@NotBlank
	@Column(name = "estado_civil", length = 15)
	private String estadoCivil;

	@NotBlank
	@Column(name = "data_nascimento", length = 10)
	private String dataNascimento;

	@NotBlank
	@Column(name = "nacionalidade", length = 100)
	private String nacionalidade;

	@NotBlank
	@Column(name = "sexo", length = 1)
	private String sexo;

	@NotBlank
	@Column(name = "nome_mae", length = 200)
	private String nomeMae;

	@Column(name = "nome_pai", length = 200)
	private String nomePai;

	@Column(name = "nome_conjuge", length = 100)
	private String nomeConjuge;

	@Column(name = "pcd")
	private Boolean pcd;

	@Column(name = "descricao_pcd")
	private String descricaoPcd;

	@Column(name = "numero_pis")
	private String numeroPis;

	@Column(name = "filho")
	private Boolean filho;

	@Column(name = "qtd_filho")
	private Integer qtdFilho;

	@Column(name = "idade_filho")
	private String idadeFilho;

	@Column(name = "link_facebook")
	private String linkFacebook;

	@Column(name = "foto")
	private String foto;

	@Column(name = "data_cadastro")
	private String dataCadastro;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "data_ultima_atualizacao")
	private Date dataUltimaAtualizacao;

	@OneToOne
	@JoinColumn(name = "endereco_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_endereco_candidato"))
	private Endereco endereco;

	@OneToOne
	@JoinColumn(name = "contato_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_contato_candidato"))
	private Contato contato;

	@ManyToOne
	@JoinColumn(name = "escolaridade_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_escolaridade_candidato"))
	private Escolaridade escolaridade;

	@ManyToOne
	@JoinColumn(name = "opcao_um_cargo_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "Fk_candidato_opcao_um"))
	private Cargo opcaoUm;
		
	@ManyToOne
	@JoinColumn(name = "opcao_dois_cargo_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "Fk_candidato_opcao_dois"))
	private Cargo opcaoDois;
	
	@ManyToOne
	@JoinColumn(name = "opcao_tres_cargo_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "Fk_candidato_opcao_tres"))
	private Cargo opcaoTres;
	
	@OneToOne
	@JoinColumn(name = "usuario_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "Fk_usuario_usuario"))
	private Usuario usuario;

	@OneToMany(mappedBy = "candidato")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<FormacaoAcademica> formacoesAcademicas;

	@OneToMany(mappedBy = "candidato")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Curso> cursos;

	@OneToMany(mappedBy = "candidato")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<ExperienciaProfissional> experienciasProfissionais;
		
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
		this.nome = nome;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(String dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getNacionalidade() {
		return nacionalidade;
	}

	public void setNacionalidade(String nacionalidade) {
		this.nacionalidade = nacionalidade;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public String getNomePai() {
		return nomePai;
	}

	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}

	public String getNomeConjuge() {
		return nomeConjuge;
	}

	public void setNomeConjuge(String nomeConjuge) {
		this.nomeConjuge = nomeConjuge;
	}

	public Boolean getPcd() {
		return pcd;
	}

	public void setPcd(Boolean pcd) {
		this.pcd = pcd;
	}

	public String getDescricaoPcd() {
		return descricaoPcd;
	}

	public void setDescricaoPcd(String descricaoPcd) {
		this.descricaoPcd = descricaoPcd;
	}

	public String getNumeroPis() {
		return numeroPis;
	}

	public void setNumeroPis(String numeroPis) {
		this.numeroPis = numeroPis;
	}

	public Boolean getFilho() {
		return filho;
	}

	public void setFilho(Boolean filho) {
		this.filho = filho;
	}

	public Integer getQtdFilho() {
		return qtdFilho;
	}

	public void setQtdFilho(Integer qtdFilho) {
		this.qtdFilho = qtdFilho;
	}

	public String getIdadeFilho() {
		return idadeFilho;
	}

	public void setIdadeFilho(String idadeFilho) {
		this.idadeFilho = idadeFilho;
	}

	public String getLinkFacebook() {
		return linkFacebook;
	}

	public void setLinkFacebook(String linkFacebook) {
		this.linkFacebook = linkFacebook;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
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

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public Escolaridade getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(Escolaridade escolaridade) {
		this.escolaridade = escolaridade;
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

	public List<FormacaoAcademica> getFormacoesAcademicas() {
		return formacoesAcademicas;
	}

	public void setFormacoesAcademicas(List<FormacaoAcademica> formacoesAcademicas) {
		this.formacoesAcademicas = formacoesAcademicas;
	}

	public List<Curso> getCursos() {
		return cursos;
	}

	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}

	public List<ExperienciaProfissional> getExperienciasProfissionais() {
		return experienciasProfissionais;
	}

	public void setExperienciasProfissionais(List<ExperienciaProfissional> experienciasProfissionais) {
		this.experienciasProfissionais = experienciasProfissionais;
	}

	public List<VagaxCandidato> getVagasxcandidato() {
		return vagasxcandidato;
	}

	public void setVagasxcandidato(List<VagaxCandidato> vagasxcandidato) {
		this.vagasxcandidato = vagasxcandidato;
	}
}
