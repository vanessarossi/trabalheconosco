<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Lista de Postos de Atendimento</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<a href="/trabalheconosco/postoAtendimento/formulario" class="btn btn-sm btn-secondary">Novo Posto de Atendimento</a>
	<br/>
	<br/>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="postosAtendimento">
			<thead>
				<tr>
					<th>Código</th>
					<th>Nome</th>
					<th>Cidade</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${postosAtendimento}" var="postoAtendimento">
					<tr>
						<td>${postoAtendimento.id}</td>
						<td>${postoAtendimento.nome}</td>
						<td>${postoAtendimento.cidade.nome}</td>
						<td>
							<a href="/trabalheconosco/postoAtendimento/editar/${postoAtendimento.id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
							<a href="/trabalheconosco/postoAtendimento/deletar/${postoAtendimento.id}" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<script>
	$(document).ready(function() {
	    $('#postosAtendimento').DataTable({
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
