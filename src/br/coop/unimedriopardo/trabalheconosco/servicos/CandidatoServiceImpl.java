package br.coop.unimedriopardo.trabalheconosco.servicos;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import br.coop.unimedriopardo.trabalheconosco.entidades.Cargo;
import br.coop.unimedriopardo.trabalheconosco.entidades.Estado;
import br.coop.unimedriopardo.trabalheconosco.entidades.Usuario;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCandidato;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioCargo;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioEstado;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioUsuario;
import br.coop.unimedriopardo.trabalheconosco.repositorios.RepositorioVaga;
import br.coop.unimedriopardo.trabalheconosco.util.CandidatoView;


@Service
@Transactional
public class CandidatoServiceImpl implements CandidatoService {
	

	 private final RepositorioEstado repositorioEstado;
	 private final RepositorioCandidato repositorioCandidato;
	 private final RepositorioUsuario repositorioUsuario;

	 private final RepositorioCargo repositorioCargo;
	
	@Autowired
	public CandidatoServiceImpl(RepositorioCandidato repositorioCandidato,RepositorioEstado repositorioEstado, 
			RepositorioUsuario repositorioUsuario, RepositorioCargo repositorioCargo, RepositorioVaga repositorioVaga) {
		super();
		this.repositorioCandidato = repositorioCandidato;
		this.repositorioEstado = repositorioEstado;
		this.repositorioUsuario = repositorioUsuario;
		this.repositorioCargo = repositorioCargo;
	}

	@Override
	public List<Estado> pesquisarEstado() {
		return repositorioEstado.findAll(new Sort("nome"));
	}

	@Override
	public void salvar(Candidato candidato, MultipartFile file) {	
		//salvar usuario
		Usuario usuario = new Usuario();
		usuario.setId(candidato.getUsuario().getId());
		usuario.setLogin(candidato.getCpf());
		
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
		novoCandidato.setEmail(candidato.getEmail());
		novoCandidato.setUsuario(usuario);
		novoCandidato.setOpcaoUm(candidato.getOpcaoUm());
		novoCandidato.setOpcaoDois(candidato.getOpcaoDois());
		novoCandidato.setOpcaoTres(candidato.getOpcaoTres());
	
		
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		
		novoCandidato.setDataCadastro(candidato.getDataCadastro().equals("") ? format.format(new Date()) : candidato.getDataCadastro());
		novoCandidato.setDataUltimaAtualizacao(new Date());
		novoCandidato = repositorioCandidato.save(novoCandidato);
		
		
		//salvar curriculo
		if (! file.isEmpty()) {
			String nomeArquivo = novoCandidato.getId().toString();
			String caminhoAnexo = uploadCurriculo(nomeArquivo, file);
			novoCandidato.setCaminhoAnexo(caminhoAnexo);
			repositorioCandidato.save(novoCandidato);
		}
	}

	@Override
	public Candidato pesquisarCandidatoPorUsuario(Usuario usuario) {
		return repositorioCandidato.findByUsuario_Id(usuario.getId());
	}

	@Override
	public Candidato pesquisarCandidatoPorId(Long id) {
		return repositorioCandidato.findById(id).orElse(new Candidato());
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
	public Page<Candidato> pesquisarTodos(Pageable pageable) {
		Page<Candidato> candidatos = repositorioCandidato.findAll(pageable);
		return candidatos;
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
                         .parse(usuario.getCandidato().getEmail());  

              message.setRecipients(Message.RecipientType.TO, toUser);
              message.setSubject("Nova senha - Trabalhe Conosco Unimed Rio Pardo");//Assunto
              
              
              String body= "Ola " + usuario.getCandidato().getNome()+", \n"+
                      " A sua nova senha para o sistema Fale Conosco da Unimed Rio Pardo foi gerada: "+senha+"\n"+
                      " Para alterar, acesse o seu currículo e coloque a nova senha.\n"+
                      " Qualquer duvida entre em contato com o departamento de TI. \n Telefone (19) 3682-8888";
                         
              message.setText(body);

              /**Método para enviar a mensagem criada*/
              Transport.send(message);
         } catch (MessagingException e) {
              throw new RuntimeException(e);
        }
	}

	@Override
	public List<Candidato> pesquisarTodos() {
		return repositorioCandidato.findAll();
	}

	@Override
	public List<CandidatoView> listarComFiltro(Long cargoId) {
		List<Object[]> objetos = new ArrayList<Object[]>();
		
		if (cargoId != null ) {
			objetos = repositorioCandidato.pesquisarComFiltroCargo(cargoId);
		}

		List<CandidatoView> candidatos = new ArrayList<CandidatoView>();
		for (Object[] objeto : objetos) {
			CandidatoView candidatoView = new CandidatoView();
			candidatoView.setId(objeto[0].toString());
			candidatoView.setNome(objeto[1].toString());
			candidatos.add(candidatoView);		
		} 
		return candidatos;
	}

	@Override
	public List<Cargo> pesquisarCargos() {
		return repositorioCargo.findAll(new Sort("nome"));
	}

	@Override
	public void enviarMsgEmail() {
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
        	
        	List<Candidato> candidatos = repositorioCandidato.findAll();
        	
        	for (Candidato candidato : candidatos) {
        		 Message message = new MimeMessage(session);
                 message.setFrom(new InternetAddress("unimed250@gmail.com")); //Remetente

                 Address[] toUser = InternetAddress.parse(candidato.getEmail()); //destinatario

                 message.setRecipients(Message.RecipientType.TO, toUser);
                 message.setSubject("Informativo - Trabalhe Conosco Unimed Rio Pardo");//Assunto
                  
                 String body= "Ola " + candidato.getNome()+", \n"+
                         " Mantenha seu cadastro sempre atualizado ! \n"+
                         " Qualquer duvida entre em contato com o departamento de TI. \n Telefone (19) 3682-8888";            
                 message.setText(body);
                 /**Método para enviar a mensagem criada*/
                 Transport.send(message);
			}
           
         } catch (MessagingException e) {
              throw new RuntimeException(e);
        }
	}


	@Override
	public Page<Candidato> listarPaginacao(Pageable pageable) {
		return repositorioCandidato.findAll(pageable);
	}

	@Override
	public Page<Candidato> listarPaginacaoComPesquisa(String textoPesquisa, Pageable pageable) {
		return repositorioCandidato.findByNomeContaining(textoPesquisa, pageable);
	}

	@Override
	public void enviarMsgEmailVaga() {
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
        	List<Candidato> candidatos = repositorioCandidato.findAll();
        	
        	for (Candidato candidato : candidatos) {
        		 Message message = new MimeMessage(session);
                 message.setFrom(new InternetAddress("unimed250@gmail.com")); //Remetente

                 Address[] toUser = InternetAddress.parse(candidato.getEmail()); //destinatario

                 message.setRecipients(Message.RecipientType.TO, toUser);
                 message.setSubject("Informativo - Trabalhe Conosco Unimed Rio Pardo");//Assunto
                  
                 String body= "Ola " + candidato.getNome()+", \n"+
                         " Mantenha seu cadastro sempre atualizado ! \n"+
                         " Qualquer duvida entre em contato com o departamento de TI. \n Telefone (19) 3682-8888";            
                 message.setText(body);
                 /**Método para enviar a mensagem criada*/
                 Transport.send(message);
			}
           
         } catch (MessagingException e) {
              throw new RuntimeException(e);
        }
	}

	@Override
	public String uploadCurriculo(String nomeArquivo, MultipartFile file) {
		 String caminho = System.getProperty("catalina.home") + "/webapps/curriculo";
		 File pasta;
		   pasta = new File(caminho);
		   if (!pasta.exists()){
		       pasta.mkdir();
		   }
		  String caminhoArquivo = caminho + "/" + nomeArquivo +".pdf";
		  File novoArquivo = new File(caminhoArquivo);
		  FileOutputStream saida;
	
			try {
				saida = new FileOutputStream(novoArquivo);
				saida.write(file.getBytes(), 0, file.getBytes().length);
				saida.close();	
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
		return "/curriculo/"+nomeArquivo +".pdf";
	}

	@Override
	public File retornaPdf(Long id) {
		String caminho = System.getProperty("catalina.home") + "/webapps/curriculo";
	    File arquivo = new File(caminho+"/"+id+".pdf");
		return arquivo;
	}

}
