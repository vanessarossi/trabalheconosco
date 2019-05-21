<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="text-center">
	<h2>Lista de Currículos Cadastrados</h2>
</section>
<section id="conteudo">
<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
<a href="/trabalheconosco/candidato/pesquisa/avancada" class="btn btn-sm btn-info">Pesquisa com filtros</a>
<a href="/trabalheconosco/candidato/enviarEmail" class="btn btn-sm btn-light">Enviar e-mail atualização</a>
	<br/>
	<br/>
	<div class="form-group row">
		<div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
			<label for="pesquisa">Pesquisa</label>
			<input type="text" class="form-control" id="pesquisa" name="pesquisa"/>
		</div>
	</div>
	<br>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="tabelaCandidato">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Estado Civil</th>
					<th>Sexo</th>
					<th>Número Pis</th>
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
<spring:url value="/resources/js/lista_candidato.js" var="listaCandidatoJS"></spring:url>
<script type="text/javascript" src="${listaCandidatoJS}"></script>

