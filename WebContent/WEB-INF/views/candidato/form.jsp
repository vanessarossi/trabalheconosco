<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Cadastro de Currículo</h2>
</section>
<section class="container">
	<form class="form" action="/trabalheconosco/candidato/salvar" method="post" enctype=multipart/form-data>
		<h3>Informações do Candidato</h3>
			<div class="card">
			  <div class="card-body">
			  		<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="cpf">CPF</label>
							<input type="text" class="form-control cpf" id="cpf" name="cpf" value="${candidato.cpf}" onkeyup="somenteNumeros(this)" required/>
						</div>
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="senha">Senha</label>
							<input type="password" class="form-control" id="senha"name="usuario.senha" required/>
						</div>
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="nome">Nome Completo</label>
							<input type="text" class="form-control" id="nome" name="nome" value="${candidato.nome}" required/>
						</div>
					</div>		
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="email">E-mail</label>
							<input type="email" class="form-control" id="email" name="email" value="${candidato.email}" required/>
						</div>
					</div>	
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="arquivo">Anexe ao perfil o seu currículo em pdf atualizado.</label>
							<input type="file" class="form-control" id="arquivo" name="arquivo" required/>
						</div>
					</div>	
			  </div>
			</div>
			<h3>Quais cargos que você gostaria de ser contratado(a) ?</h3>
			<div class="card">
			  <div class="card-body">
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
							<label for="opcaoUm">Primeira Opção</label> 
							<select class="form-control" id="opcaoUm" name="opcaoUm.id" required>
								<option value="">Selecione</option>
								<c:forEach items="${cargos}" var="cargo">
									<option value="${cargo.id}" <c:if test="${cargo.id eq candidato.opcaoUm.id}">selected</c:if> >${cargo.nome}</option>
								</c:forEach>
							</select>
						</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="opcaoDois">Segunda Opção</label> 
						<select class="form-control" id="opcaoDois" name="opcaoDois.id" required>
							<option value="">Selecione</option>
							<c:forEach items="${cargos}" var="cargo">
								<option value="${cargo.id}" <c:if test="${cargo.id eq candidato.opcaoDois.id}">selected</c:if> >${cargo.nome}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
							<label for="opcaoTres">Terceira Opção</label> 
							<select class="form-control" id="opcaoTres" name="opcaoTres.id" required>
								<option value="">Selecione</option>
								<c:forEach items="${cargos}" var="cargo">
									<option value="${cargo.id}" <c:if test="${cargo.id eq candidato.opcaoTres.id}">selected</c:if> >${cargo.nome}</option>
								</c:forEach>
							</select>
						</div>
				</div>
			  </div>
			</div>
			<br/>
		<div>
			<input type="hidden" class="form-control" id="dataCadastro" name="dataCadastro" value="${candidato.dataCadastro}"/>
			<input type="hidden" class="form-control" id="id" name="id" value="${candidato.id}"/>
			<input type="hidden" class="form-control" id="idUsuario" name="usuario.id" value="${candidato.usuario.id}"/>
			<a href="/trabalheconosco/home" class="btn btn-danger">Cancelar</a>
			<input type="submit" value="Salvar" class="btn btn-success"/>
		</div>
	</form>
</section>

<spring:url value="/resources/js/form_candidato.js" var="formCandidatoJS"></spring:url>
<script type="text/javascript" src="${formCandidatoJS}"></script>

</br></br>
