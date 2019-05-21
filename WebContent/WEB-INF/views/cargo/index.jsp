<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="text-center">
	<h2>Lista de Cargos</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<a href="/trabalheconosco/cargo/formulario" class="btn btn-sm btn-secondary">Novo Cargo</a>
	<br/>
	<br/>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="tabelaCargo">
			<thead>
				<tr>
					<th>Código</th>
					<th>Nome</th>
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
<spring:url value="/resources/js/lista_cargo.js" var="listaCargoJS"></spring:url>
<script type="text/javascript" src="${listaCargoJS}"></script>
