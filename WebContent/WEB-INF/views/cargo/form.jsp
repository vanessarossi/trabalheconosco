<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Cadastro de Cargo</h2>
</section>
<section class="container">
	<form class="form" action="/trabalheconosco/cargo/salvar" method="post">
		<div class="form-group row">
			<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" id="nome" name="nome" value="${cargo.nome}"/>
			</div>
		</div>
		<div>
			<input type="hidden" class="form-control" id="id" name="id" value="${cargo.id}"/>
			<a href="/trabalheconosco/cargo/listagem" class="btn btn-danger">Cancelar</a>
			<input type="submit" value="Salvar" class="btn btn-success"/>
		</div>
	</form>
</section>
