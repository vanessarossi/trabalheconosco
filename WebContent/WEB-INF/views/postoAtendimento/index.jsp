<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="text-center">
	<h2>Lista de Postos de Atendimento</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<a href="/trabalheconosco/postoAtendimento/formulario" class="btn btn-sm btn-secondary">Novo Posto de Atendimento</a>
	<br/>
	<br/>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="tabelaPostosAtendimento">
			<thead>
				<tr>
					<th>Código</th>
					<th>Nome</th>
					<th>Cidade</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-end" id="paginacao"></ul>
		</nav>
	</div>
</section>
<spring:url value="/resources/js/lista_postoAtendimento.js" var="listaPostoAtendimentoJS"></spring:url>
<script type="text/javascript" src="${listaPostoAtendimentoJS}"></script>
