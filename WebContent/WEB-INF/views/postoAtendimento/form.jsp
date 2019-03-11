<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Cadastro de Posto de Atendimento</h2>
</section>
<section class="container">
	<form class="form" action="/trabalheconosco/postoAtendimento/salvar" method="post">
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" id="nome" name="nome" value="${postoAtendimento.nome}"/>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="estado">Estado</label>
				<select class="form-control" id="estado">
					<option value="">Selecione</option>
					<c:forEach items="${estados}" var="estado">
						<option value="${estado.codigoUf}">${estado.nome}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="cidade">Cidade</label>
				<select class="form-control" id="cidade" name="cidade.codigoIbge">
				</select>
			</div>
		</div>
		<div>
			<input type="hidden" class="form-control" id="id" name="id" value="${postoAtendimento.id}"/>
			<a href="/trabalheconosco/postoAtendimento/listagem" class="btn btn-warning">Cancelar</a>
			<input type="submit" value="Salvar" class="btn btn-success"/>
		</div>
	</form>
</section>
<spring:url value="/resources/js/estadocidade.js" var="cidadeEstadoJS"></spring:url>
<script type="text/javascript" src="${cidadeEstadoJS}"></script>