<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Lista de Vagas</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/vaga/formulario" class="btn btn-sm btn-secondary">Nova Vaga</a>
	<br/>
	<br/>
	<table class="table table-sm table-striped table-hover">
		<thead>
			<tr>
				<th>Código</th>
				<th>Cargo</th>
				<th>Ativo</th>
				<th>Data Inicial</th>
				<th>Data Final</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vagas}" var="vaga">
				<tr>
					<td>${vaga.id}</td>
					<td>${vaga.cargo.nome}</td>
					<td>${vaga.ativo}</td>
					<td>${vaga.dataInicial}</td>
					<td>${vaga.dataFinal}</td>
					<td>
						<a href="/trabalheconosco/vaga/editar/${vaga.id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
						<a href="/trabalheconosco/vaga/deletar/${vaga.id}" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
</section>
