package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Contato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Curso;
import br.coop.unimedriopardo.trabalheconosco.entidades.Endereco;
import br.coop.unimedriopardo.trabalheconosco.entidades.Escolaridade;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.ExperienciaProfissional;
import br.coop.unimedriopardo.trabalheconosco.entidades.FormacaoAcademica;
import br.coop.unimedriopardo.trabalheconosco.entidades.NivelFormacao;
import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCandidato;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioContato;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCurso;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioEndereco;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioEscolaridade;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioEstado;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioExperienciaProfisional;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioFormacaoAcademica;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioNivelFormacao;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioUsuario;

@Service
@Transactional
public class CandidatoServiceImpl implements CandidatoService {
	
	 private final RepositorioEscolaridade repositorioEscolaridade;
	 private final RepositorioNivelFormacao repositorioNivelFormacao;
	 private final RepositorioEstado repositorioEstado;
	 private final RepositorioCandidato repositorioCandidato;
	 private final RepositorioContato repositorioContato;
	 private final RepositorioEndereco repositorioEndereco;
	 private final RepositorioUsuario repositorioUsuario;
	 private final RepositorioExperienciaProfisional repositorioExperienciaProfissional;
	 private final RepositorioFormacaoAcademica repositorioFormacaoAcademica;
	 private final RepositorioCurso repositorioCurso;
	
	@Autowired
	public CandidatoServiceImpl(RepositorioCandidato repositorioCandidato, RepositorioNivelFormacao repositorioNivelFormacao,
			RepositorioEstado repositorioEstado, RepositorioEscolaridade repositorioEscolaridade, 
			RepositorioContato repositorioContato, RepositorioEndereco repositorioEndereco,
			RepositorioUsuario repositorioUsuario, RepositorioExperienciaProfisional repositorioExperienciaProfisional,
			RepositorioFormacaoAcademica repositorioFormacaoAcademica, RepositorioCurso repositorioCurso) {
		super();
		this.repositorioCandidato = repositorioCandidato;
		this.repositorioNivelFormacao = repositorioNivelFormacao;
		this.repositorioEstado = repositorioEstado;
		this.repositorioEscolaridade = repositorioEscolaridade;
		this.repositorioContato = repositorioContato;
		this.repositorioEndereco = repositorioEndereco;
		this.repositorioUsuario = repositorioUsuario;
		this.repositorioExperienciaProfissional = repositorioExperienciaProfisional;
		this.repositorioFormacaoAcademica = repositorioFormacaoAcademica;
		this.repositorioCurso = repositorioCurso;
	}

	@Override
	public List<Escolaridade> pesquisarEscolaridade() {
		return repositorioEscolaridade.findAll(new Sort("id"));
	}

	@Override
	public List<NivelFormacao> pesquisarNivelFormacao() {
		return repositorioNivelFormacao.findAll(new Sort("id"));
	}

	@Override
	public List<Estado> pesquisarEstado() {
		return repositorioEstado.findAll(new Sort("nome"));
	}

	@Override
	public void salvar(Candidato candidato, MultipartFile file) {
		List<FormacaoAcademica> formacoesAcademicas = candidato.getFormacoesAcademicas();
		List<Curso> cursos = candidato.getCursos();
		List<ExperienciaProfissional> experienciasProfissionais = candidato.getExperienciasProfissionais();
		//salvar contato
		Contato contato = candidato.getContato();
		contato = repositorioContato.save(contato);
		//salvar endereco
		Endereco endereco = candidato.getEndereco();
		endereco = repositorioEndereco.save(endereco);
		//salvar usuario
		Usuario usuario = new Usuario();
		usuario.setId(candidato.getUsuario().getId());
		usuario.setLogin(candidato.getCpf().replace(".", "").replace("-", ""));
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		usuario.setSenha(passwordEncoder.encode(candidato.getUsuario().getSenha())); 	
		usuario.setAtivo(true);
		usuario.setPerfilAcesso("ROLE_USER");
		usuario = repositorioUsuario.save(usuario);
		//salvar candidato
		Candidato novoCandidato = new Candidato();
		novoCandidato.setId(candidato.getId());
		novoCandidato.setCpf(candidato.getCpf());
		novoCandidato.setNome(candidato.getNome());
		novoCandidato.setEstadoCivil(candidato.getEstadoCivil());
		novoCandidato.setDataNascimento(candidato.getDataNascimento());
		novoCandidato.setNacionalidade(candidato.getNacionalidade());
		novoCandidato.setSexo(candidato.getSexo());
		novoCandidato.setNomeMae(candidato.getNomeMae());
		novoCandidato.setNomePai(candidato.getNomePai());
		novoCandidato.setNomeConjuge(candidato.getNomeConjuge());
		novoCandidato.setFilho(candidato.getFilho());
		novoCandidato.setQtdFilho(candidato.getQtdFilho());
		novoCandidato.setIdadeFilho(candidato.getIdadeFilho());
		novoCandidato.setPcd(candidato.getPcd());
		novoCandidato.setDescricaoPcd(candidato.getDescricaoPcd());
		novoCandidato.setNumeroPis(candidato.getNumeroPis());
		novoCandidato.setLinkFacebook(candidato.getLinkFacebook());
		novoCandidato.setEscolaridade(candidato.getEscolaridade());
		novoCandidato.setEndereco(endereco);
		novoCandidato.setContato(contato);
		novoCandidato.setUsuario(usuario);
		novoCandidato.setFoto(candidato.getFoto());
		novoCandidato.setDataCadastro(candidato.getDataCadastro() == null ? new Date() : candidato.getDataCadastro());
		novoCandidato.setDataUltimaAtualizacao(new Date());
		novoCandidato = repositorioCandidato.save(novoCandidato);
		//salvar experiencia profissional
		if(experienciasProfissionais != null) {
			for (ExperienciaProfissional experienciaProfissional : experienciasProfissionais) {
				ExperienciaProfissional ep = experienciaProfissional;
				ep.setCandidato(novoCandidato);
				repositorioExperienciaProfissional.save(ep);
			}
		}
		//salvar informacao academica
		if(formacoesAcademicas != null) {
			for (FormacaoAcademica formacaoAcademica : formacoesAcademicas) {
				FormacaoAcademica fa = formacaoAcademica;
				fa.setCandidato(novoCandidato);
				repositorioFormacaoAcademica.save(fa);
			}
		}
		//salvar cursos
		if(cursos != null) {
			for (Curso curso : cursos) {
				Curso c = curso;
				c.setCandidato(novoCandidato);
				repositorioCurso.save(c);
			}
		}

		if (! file.isEmpty()) {
			String nomeArquivo = novoCandidato.getId().toString();
			String foto = uploadFoto(nomeArquivo, file);
			novoCandidato.setFoto(foto);
			repositorioCandidato.save(novoCandidato);
		}
		
	}

	@Override
	public Candidato pesquisarCandidatoPorUsuario(Usuario usuario) {
		return repositorioCandidato.findByUsuario_Id(usuario.getId());
	}

	@Override
	public Candidato pesquisarCandidatoPorId(Long id) {
		return repositorioCandidato.findOne(id);
	}

	@Override
	public Candidato pesquisarCandidatoPorCpf(String cpf) {
		return repositorioCandidato.findByCpf(cpf);
	}

	@Override
	public Candidato pesquisarCandidatoPorLogin(String cpf) {
		return repositorioCandidato.findByUsuario_Login(cpf);
	}

	@Override
	public void deletarFormacaoAcademica(Long id) {
		repositorioFormacaoAcademica.delete(id);
	}

	@Override
	public void deletarExperienciaProfissional(Long id) {
		repositorioExperienciaProfissional.delete(id);
	}

	@Override
	public void deletarCurso(Long id) {
		repositorioCurso.delete(id);
	}

	@Override
	public List<Candidato> pesquisarTodos() {
		return repositorioCandidato.findAll(new Sort("dataCadastro"));
	}

	@Override
	public String uploadFoto(String nomeArquivo, MultipartFile file) {
		 String caminho = System.getProperty("catalina.home") + "/webapps/fotos";
		 File pasta;
		   pasta = new File(caminho);
		   if (!pasta.exists()){
		       pasta.mkdir();
		   }
		  String caminhoArquivo = caminho + "/" + nomeArquivo +".jpg";
		  File novoArquivo = new File(caminhoArquivo);
		  FileOutputStream saida;
	
			try {
				saida = new FileOutputStream(novoArquivo);
				saida.write(file.getBytes(), 0, file.getBytes().length);
				saida.close();	
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
		return "/fotos/"+nomeArquivo +".jpg";
	}

	@Override
	public void gerarNovaSenha(String cpf) {
		Usuario usuario = repositorioUsuario.findByLogin(cpf);
		if (usuario != null) {
			String senha = gerarSenhaAleatoria();
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			usuario.setSenha(passwordEncoder.encode(senha)); 	
			repositorioUsuario.save(usuario);
			enviarEmail(usuario, senha);
		}
	
	}
	
	public String gerarSenhaAleatoria() {
		String letras = "ABCDEFGHIJKLMNOPQRSTUVYWXZ";
        Random random = new Random();
        String chave = "";
        int index = -1;
        int valorNumerico= 0;
        for (int i = 0; i < 4; i++) {
            index = random.nextInt(letras.length());
            valorNumerico = random.nextInt(10);
            chave += letras.substring(index, index + 1);
            chave += valorNumerico;
        }
        return chave;
	}

	
	public void enviarEmail(Usuario usuario, String senha) {
		Properties props = new Properties();
        /** Parâmetros de conexão com servidor Gmail */
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                         protected PasswordAuthentication getPasswordAuthentication() 
                         {
                               return new PasswordAuthentication("unimed250@gmail.com", "uni250rp");
                         }
                    });

        /** Ativa Debug para sessão */
        session.setDebug(true);
        try {
              Message message = new MimeMessage(session);
              message.setFrom(new InternetAddress("unimed250@gmail.com")); //Remetente

              Address[] toUser = InternetAddress //Destinatário(s)
                         .parse(usuario.getCandidato().getContato().getEmail());  

              message.setRecipients(Message.RecipientType.TO, toUser);
              message.setSubject("Recuperação de senha - Fale Conosco Unimed Rio Pardo");//Assunto
              
              
              String body= "Olá " + usuario.getCandidato().getNome()+", \n"+
                      " Você solicitou uma nova senha para o sistema Fale Conosco da Unimed Rio Pardo e a sua nova senha é: "+senha+"\n"+
                      " Para alterar, acesse o seu currículo e coloque a nova senha.\n"+
                      " Por favor, não responda este e-mail, pois o mesmo não será recebido, qualquer duvida entre em contato com o departamento de TI.";
                         
              message.setText(body);

              /**Método para enviar a mensagem criada*/
              Transport.send(message);
         } catch (MessagingException e) {
              throw new RuntimeException(e);
        }
	}
}
