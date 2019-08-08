package br.coop.unimedriopardo.trabalheconosco.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;
import br.coop.unimedriopardo.trabalheconosco.entidades.Candidato;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

public class GeradorDeImpressao {

	public File gerarImpressao(Candidato candidato) throws JRException, URISyntaxException, IOException {	
		File file = new File(System.getProperty("catalina.home")+"/webapps/trabalheconosco/WEB-INF/resources/jasper/curriculo.jasper");
        InputStream jasperStream = new FileInputStream(file);
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);	    
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, getMap(candidato), new JRBeanCollectionDataSource(candidato.getExperienciasProfissionais()));
	   
	    String caminho = System.getProperty("catalina.home")+"/webapps/curriculos";
		 File pasta;
		   pasta = new File(caminho);
		   if (!pasta.exists()){
		       pasta.mkdir();
		   }
 
	    FileOutputStream fileOutputStream = new FileOutputStream(caminho+"/"+candidato.getId()+".pdf");
	    JasperExportManager.exportReportToPdfStream(jasperPrint, fileOutputStream);
	    File arquivo = new File(caminho+"/"+candidato.getId()+".pdf");
		return arquivo;
	}
	
	public Map<String, Object> getMap(Candidato candidato) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nomeCompleto",candidato.getNome());
		map.put("estadoCivil",candidato.getEstadoCivil());
		map.put("dataNascimento",candidato.getDataNascimento());
		map.put("nacionalidade",candidato.getNacionalidade());
		map.put("sexo", candidato.getSexo());
		map.put("nomeMae",candidato.getNomeMae());
		map.put("nomePai",candidato.getNomePai());
		map.put("nomeConjuge",candidato.getNomeConjuge());
		map.put("possuiFilho",candidato.getFilhoString());
		map.put("totalFilho",candidato.getQtdFilhoString());
		map.put("idadeFilho",candidato.getIdadeFilho());
		map.put("possuiDeficiencia",candidato.getPcdString());
		map.put("descricaoPcd", candidato.getDescricaoPcd());
		map.put("numeroPis", candidato.getNumeroPis());
		map.put("escolaridade", candidato.getEscolaridade().getNome());
		
		map.put("cep",candidato.getEndereco().getCep());
		map.put("endereco",candidato.getEndereco().getEndereco());
		map.put("numero",candidato.getEndereco().getNumero());
		map.put("bairro",candidato.getEndereco().getBairro());
		map.put("complemento", candidato.getEndereco().getComplemento());
		map.put("estado",candidato.getEndereco().getCidade().getEstado().getNome());
		map.put("cidade", candidato.getEndereco().getCidade().getNome());
		
		map.put("telefone",candidato.getContato().getTelefone());
		map.put("celular",candidato.getContato().getCelular());
		map.put("numeroContato",candidato.getContato().getNumeroContato());
		map.put("email",candidato.getContato().getEmail());
		
		map.put("primeiraOpcao",candidato.getOpcaoUm() == null ? "" : candidato.getOpcaoUm().getNome());
		map.put("segundaOpcao",candidato.getOpcaoDois() == null ? "" : candidato.getOpcaoDois().getNome());
		map.put("terceiraOpcao",candidato.getOpcaoTres() == null ? "" : candidato.getOpcaoTres().getNome());
		
		map.put("cursos", new JRBeanCollectionDataSource(candidato.getCursos()));
		map.put("formacoesAcademicas", new JRBeanCollectionDataSource(candidato.getFormacoesAcademicas()));
				
		return map;
	}
	
}
