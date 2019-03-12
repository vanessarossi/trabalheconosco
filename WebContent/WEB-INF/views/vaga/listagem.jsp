<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Lista de Vagas Abertas</h2>
</section>
<section id="conteudo">
<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<br/>
	<br/>
	<table class="table table-sm table-striped table-hover" id="vagasAbertas">
		<thead>
			<tr>
				<th>Cargo</th>
				<th>Posto de Atendimento</th>
				<th>Cidade</th>
				<th>Quantidade</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vagas}" var="vaga">
				<tr>
					<td>${vaga.cargo.nome}</td>
					<td>${vaga.postoAtendimento.nome}</td>
					<td>${vaga.postoAtendimento.cidade.nome}</td>
					<td>${vaga.quantidade}</td>
					<td>
						<a href="/trabalheconosco/vaga/info/${vaga.id}" class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
</section>
<script>
	$(document).ready(function() {
	    $('#vagasAbertas').DataTable({
	    	"oLanguage": {
	    		"sUrl": "/trabalheconosco/resources/js/util/pt-BR.json"
	    	}
	    });
	} );
</script>