package br.coop.unimedriopardo.trabalheconosco.util;

import java.io.File;

public class BaseUpload {

	 File folder;

	 public BaseUpload() {
	   String folderPath = System.getProperty("catalina.home") + "/webapps/fotos";
	   folder = new File(folderPath);
	   if (!folder.exists()){
	       folder.mkdir();
	   }
	}

}
