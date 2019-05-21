<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="text-center">
	<h2>Lista Candidaturas</h2>
</section>
<section id="conteudo">
<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
<a href="/trabalheconosco/vaga/listagem" class="btn btn-sm btn-primary">Listagem de Vagas</a>
	<br/>
	<br/>
	<section class="text-center">
		<h4>Vaga : ${vaga.cargo.nome} - ${vaga.postoAtendimento.nome }</h4>
	</section>
	<input type="hidden" name="vagaId" id="vagaId" value="${vaga.id}"/>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover" id="tabelaCandidatura">
			<thead>
				<tr>
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
<spring:url value="/resources/js/lista_candidato_vaga.js" var="listaCandidatosVagaJS"></spring:url>
<script type="text/javascript" src="${listaCandidatosVagaJS}"></script>