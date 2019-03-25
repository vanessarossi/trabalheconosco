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
	<form class="form" action="#" method="post" enctype=multipart/form-data>
		<h3>Formulário de Pesquisa</h3>
		<div class="card">
			<div class="card-body">
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="estadoCivil">Estado Civil</label> 
					<select id="estadoCivil" name="estadoCivil" class="form-control">
							<option value="">Selecione</option>
							<option value="casado">Casado(a)</option>
							<option value="divorciado">Divorciado(a)</option>
							<option value="separado">Separado(a)</option>
							<option value="solteiro">Solteiro(a)</option>
							<option value="viuvo">Viúvo(a)</option>
					</select>
					</div>
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="sexo">Sexo</label> <select id="sexo" name="sexo" class="form-control">
							<option value="">Selecione</option>
							<option value="F">Feminino</option>
							<option value="M">Masculino</option>
						</select>
					</div>
					<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
						<label class="label-control">Possui deficiência </label> <br />
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" id="ativo" name="pcd" value="true" /> 
								<label class="form-check-label">Sim</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" id="ativo"name="pcd" value="false" /> 
							<label class="form-check-label">Não</label>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-7 col-lg-4 col-xl-4">
						<label for="escolaridade">Escolaridade</label> 
						<select id="escolaridade" name="escolaridade.id" class="form-control">
							<option value="">Selecione</option>
							<c:forEach items="${escolaridades}" var="escolaridade">
								<option value="${escolaridade.id}"
									<c:if test="${escolaridade.id eq candidato.escolaridade.id}">selected</c:if>>${escolaridade.nome}</option>
							</c:forEach>
						</select>
					</div>
				</div>
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
						<select class="form-control" id="cidade" name="endereco.cidade.id"
							required>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
						<label for="cargo">O que procura nas formações ou cursos ?</label>
						<input type="text" class="form-control" id="cargo" name="cargo" />
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
					<th>Cidade</th>
					<th>Escolaridade</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="/trabalheconosco/candidato/visualizar/informacoes/${candidato.id}"
						class="btn btn-sm btn-secondary"><i class="fas fa-search-plus"></i></a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
<spring:url value="/resources/js/estadocidade.js" var="cidadeEstadoJS"></spring:url>
<script type="text/javascript" src="${cidadeEstadoJS}"></script>
