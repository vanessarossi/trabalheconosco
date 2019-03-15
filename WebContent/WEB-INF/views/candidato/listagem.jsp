<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Lista de Currículos Cadastrados</h2>
</section>
<section id="conteudo">
<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
<a href="/trabalheconosco/home" class="btn btn-sm btn-info">Pesquisa com filtros</a>
	<br/>
	<br/>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="candidatos">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Estado Civil</th>
					<th>Cidade</th>
					<th>Escolaridade</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${candidatos}" var="candidato">
					<tr>
						<td>${candidato.nome}</td>
						<td>${candidato.estadoCivil}</td>
						<td>${candidato.endereco.cidade.nome}</td>
						<td>${candidato.escolaridade.nome}</td>
						<td>
							<a href="/trabalheconosco/candidato/visualizar/informacoes/${candidato.id}" class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<script>
	$(document).ready(function() {
	    $('#candidatos').DataTable({
	    	"oLanguage": {
	    		"sUrl": "/trabalheconosco/resources/js/util/pt-BR.json"
	    	},
	    	"bAutoWidth":true,
	        "bLengthChange": false,
	        "bPaginate": true,
	        "bFilter": true,
	        "bSort": false,
	        "bInfo": true,
	        "processing": true,
	        "bJQueryUI": false,
	        "sPaginationType": "full_numbers",
	        "iDisplayLength":  10,
	    });
	} );
</script>
