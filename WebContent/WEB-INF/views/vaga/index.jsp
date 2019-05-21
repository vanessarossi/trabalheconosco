<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="text-center">
	<h2>Lista de Vagas</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<a href="/trabalheconosco/vaga/formulario" class="btn btn-sm btn-secondary">Nova Vaga</a>
	<br/>
	<br/>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="tabelaVaga">
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
				
			</tbody>
		</table>
	</div>
	<nav>
		<ul class="pagination justify-content-end" id="paginacao"></ul>
	</nav>
</section>
<spring:url value="/resources/js/lista_vaga.js" var="listaVagaJS"></spring:url>
<script type="text/javascript" src="${listaVagaJS}"></script>