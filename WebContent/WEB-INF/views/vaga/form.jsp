<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Cadastro de Vaga</h2>
</section>
<section class="container">
	<form class="form" action="/trabalheconosco/vaga/salvar" method="post">
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="cargo">Cargo</label>
				<select class="form-control" id="cargo" name="cargo.id">
					<option value="">Selecione</option>
					<c:forEach items="${cargos}" var="cargo">
						<option value="${cargo.id}" <c:if test="${cargo.id eq vaga.cargo.id}" >selected</c:if> >${cargo.nome}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="postoAtendimento">Posto de Atendimento</label>
				<select class="form-control" id="postoAtendimento" name="postoAtendimento.id">
					<option value="">Selecione</option>
					<c:forEach items="${postosAtendimento}" var="postoAtendimento">
						<option value="${postoAtendimento.id}" <c:if test="${postoAtendimento.id eq vaga.postoAtendimento.id}" >selected</c:if>>${postoAtendimento.nome}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-6 col-sm-6 col-md-1 col-lg-1 col-xl-1">
				<label for="quantidade">Total</label>
				<input type="text" class="form-control" id="quantidade" name="quantidade" value="${vaga.quantidade}"/>
			</div>
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Ativo </label>
				<br/>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="ativo" name="ativo" value="true" <c:if test="${vaga.ativo eq true}">checked</c:if>/>
					<label class="form-check-label">Sim</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="ativo" name="ativo" value="false"  <c:if test="${vaga.ativo eq false}">checked</c:if>/>
					<label class="form-check-label">Não</label>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Menor Aprendiz </label>
				<br/>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="menorAprendiz" name="menorAprendiz" value="true" <c:if test="${vaga.menorAprendiz eq true}">checked</c:if>/>
					<label class="form-check-label">Sim</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="menorAprendiz" name="menorAprendiz" value="false" <c:if test="${vaga.menorAprendiz eq false}">checked</c:if>/>
					<label class="form-check-label">Não</label>
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Estagiário </label>
				<br/>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="estagiario" name="estagiario" value="true" <c:if test="${vaga.estagiario eq true}">checked</c:if>/>
					<label class="form-check-label">Sim</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="estagiario" name="estagiario" value="false" <c:if test="${vaga.estagiario eq false}">checked</c:if>/>
					<label class="form-check-label">Não</label>
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
				<label class="label-control">Pcd </label>
				<br/>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="pcd" name="pcd" value="true" <c:if test="${vaga.pcd eq true}">checked</c:if>/>
					<label class="form-check-label">Sim</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" id="pcd" name="pcd" value="false" <c:if test="${vaga.pcd eq false}">checked</c:if>/>
					<label class="form-check-label">Não</label>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="principaisAtividades">Principais Atividades</label>
				<textarea id="principaisAtividades" name="principaisAtividades" class="form-control">${vaga.principaisAtividades}</textarea>
			</div>
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="preRequisito">Pre Requisito</label>
				<textarea id="preRequisito" name="preRequisito" class="form-control">${vaga.preRequisito}</textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="palavrasChave">Palavras Chave</label>
				<textarea id="palavrasChave" name="palavrasChave" class="form-control">${vaga.palavrasChave}</textarea>
			</div>				
			<div class="col-9 col-sm-9 col-md-2 col-lg-2 col-xl-2">
				<label for="dataInicial">Data Inicial</label>
				<input type="date" class="form-control" id="dataInicial" name="dataInicial" value="${vaga.dataInicial}" />
			</div>				
			<div class="col-9 col-sm-9 col-md-2 col-lg-2 col-xl-2">
				<label for="dataFinal">Data Final</label>
				<input type="date" class="form-control" id="dataFinal" name="dataFinal" value="${vaga.dataFinal}"/>
			</div>
		</div> 
		<div>
			<input type="hidden" class="form-control" id="id" name="id" value="${vaga.id}"/>
			<a href="/trabalheconosco/vaga/listagem" class="btn btn-danger">Cancelar</a>
			<input type="submit" value="Salvar" class="btn btn-success"/>
		</div>
	</form>
</section>
