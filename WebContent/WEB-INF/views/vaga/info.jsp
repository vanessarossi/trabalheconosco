<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Informações da Vaga</h2>
</section>
<section class="container">
	<form class="form" action="/trabalheconosco/vaga/candidatar" method="post">
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="cargo">Cargo</label>
				<span class="form-control" id="cargo">${vaga.cargo.nome}</span>
			</div>
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="postoAtendimento">Posto de Atendimento</label>
				<span class="form-control" id="postoAtendimento">${vaga.postoAtendimento.nome}</span>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
				<label for="quantidade">Total</label>
				<span id="quantidade" class="form-control">${vaga.quantidade}</span>
			</div>
			
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Menor Aprendiz </label>
				<br/>
				<span id="menorAprendiz" class="form-control"><c:if test="${vaga.menorAprendiz eq true}">Sim</c:if><c:if test="${vaga.menorAprendiz eq false}">Não</c:if></span>
			</div>
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Estagiário </label>
				<br/>
				<span id="estagiario" class="form-control"><c:if test="${vaga.estagiario eq true}">Sim</c:if><c:if test="${vaga.estagiario eq false}">Não</c:if></span>
			</div>
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Pcd </label>
				<br/>
				<span id="pcd" class="form-control"><c:if test="${vaga.pcd eq true}">Sim</c:if><c:if test="${vaga.pcd eq false}">Não</c:if></span>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="principaisAtividades">Principais Atividades</label>
				<textarea id="principaisAtividades" class="form-control" readonly="readonly">${vaga.principaisAtividades}</textarea>
			</div>
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="preRequisito">Pre Requisito</label>
				<textarea id="preRequisito" class="form-control" readonly="readonly">${vaga.preRequisito}</textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="palavrasChave">Palavras Chave</label>
				<textarea id="palavrasChave" class="form-control" readonly="readonly">${vaga.palavrasChave}</textarea>
			</div>				
		</div> 
		<div>
			<input type="hidden" class="form-control" id="id" name="id" value="${vaga.id}"/>
			<a href="/trabalheconosco/vaga/lista/aberta" class="btn btn-danger">Cancelar</a>
		 	<c:if test="${vagaxcandidato == null}">
		 		<a href="/trabalheconosco/vaga/candidatar/${vaga.id}" class="btn btn-success">Candidatar-me à vaga</a>		 	
			</c:if>
			<c:if test="${vagaxcandidato != null}">
		 		<a href="/trabalheconosco/vaga/descandidatar/${vagaxcandidato.id}" class="btn btn-warning">Cancelar interesse à vaga</a>		 	
			</c:if>
		</div>
	</form>
</section>
