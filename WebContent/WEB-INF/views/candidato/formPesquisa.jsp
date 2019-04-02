<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<section class="text-center">
	<h2>Cadastro de Currículo</h2>
</section>
<section class="container">
	<form class="form" action="/trabalheconosco/candidato/pesquisa/avancada/filtrar" method="post">
		<h3>Formulário de Pesquisa</h3>
		<div class="card">
			<div class="card-body">
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="estado">Estado</label>
						${candidato.endereco.cidade.estado.codigoUf} 
						<select class="form-control" id="estado">
							<option value="">Selecione</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado.codigoUf}"
									<c:if test="${estado.codigoUf eq candidato.endereco.cidade.estado.codigoUf}">selected</c:if>>${estado.nome}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="cidade">Cidade</label> <input type="hidden"
							id="cidadeEscolhida" value="${candidato.endereco.cidade.id}" />
						<select class="form-control" id="cidade" name="cidadeId" required>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
						<label for="cargo">O que procura nas formações, cursos ou experiencias profissionais ?</label>
						<input type="text" class="form-control" id="textoPesquisa" name="textoPesquisa" />
					</div>
				</div>
				<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
				<input type="submit" value="Pesquisar" class="btn btn-sm btn-info" />
			</div>
		</div>
	</form>
	<div class="table-responsive">
		<table class="table table-sm table-striped table-hover"
			id="candidatos">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Estado Civil</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${candidatos}" var="candidato">
					<tr>
						<td>${candidato.nome}</td>
						<td>${candidato.estadoCivil}</td>
						<td><a href="/trabalheconosco/candidato/visualizar/informacoes/${candidato.id}"
							class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<spring:url value="/resources/js/estadocidade.js" var="cidadeEstadoJS"></spring:url>
<script type="text/javascript" src="${cidadeEstadoJS}"></script>
