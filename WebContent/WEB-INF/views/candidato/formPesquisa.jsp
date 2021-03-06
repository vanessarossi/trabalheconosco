<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Cadastro de Currículo</h2>
</section>
<section class="container">

	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<a href="/trabalheconosco/candidato/listagem" class="btn btn-sm btn-secondary">Pesquisar todos</a>
	<a href="/trabalheconosco/candidato/enviarEmail" class="btn btn-sm btn-light">Enviar e-mail atualização</a>


	<form class="form" action="/trabalheconosco/candidato/pesquisa/avancada/filtrar" method="post">
		<h3>Formulário de Pesquisa</h3>
		<div class="card">
			<div class="card-body">
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
					<label for="cargo">Cargos</label> 
					<select class="form-control" id="cargo" name="cargoId">
						<option value="">Selecione</option>
						<c:forEach items="${cargos}" var="cargo">
							<option value="${cargo.id}">${cargo.nome}</option>
						</c:forEach>
					</select>
					</div>
				</div>
				<input type="submit" value="Pesquisar" class="btn btn-sm btn-info" />
			</div>
		</div>
	</form>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover"
			id="candidatos">
			<thead>
				<tr>
					<th>Nome</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${candidatos}" var="candidato">
					<tr>
						<td>${candidato.nome}</td>
						<td>
							<a href="/trabalheconosco/candidato/visualizar/informacoes/${candidato.id}" class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>
						</td>
						<td>
							<c:if test="${candidato.caminhoArquivo != '' }"><a href="/trabalheconosco/candidato/imprimir/${candidato.id}" target="_blank" class="btn btn-sm btn-secondary"><i class="fas fa-download"></i></a></c:if>
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
