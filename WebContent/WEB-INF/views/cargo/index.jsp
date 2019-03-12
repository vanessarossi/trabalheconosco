<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Lista de Cargos</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<a href="/trabalheconosco/cargo/formulario" class="btn btn-sm btn-secondary">Novo Cargo</a>
	<br/>
	<br/>
	<table class="table table-sm table-striped table-hover" id="cargos">
		<thead>
			<tr>
				<th>Código</th>
				<th>Nome</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cargos}" var="cargo">
				<tr>
					<td>${cargo.id}</td>
					<td>${cargo.nome}</td>
					<td>
						<a href="/trabalheconosco/cargo/editar/${cargo.id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
						<a href="/trabalheconosco/cargo/deletar/${cargo.id}" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
</section>
<script>
	$(document).ready(function() {
	    $('#cargos').DataTable({
	    	"oLanguage": {
	    		"sUrl": "/trabalheconosco/resources/js/util/pt-BR.json"
	    	}
	    });
	} );
</script>
