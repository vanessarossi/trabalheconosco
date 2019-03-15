<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="text-center">
	<p class="lead"></p>
</section>
<section id="forms">
	<div class="row card-columns justify-content-center">
		<div class="col-11 col-sm-11 col-md-5 col-lg-3 col-xl-3">
			<div class="card text-center card-pantone381c" id="cadastro">
				<br /> <i class="fas fa-user fa-5x"></i>
				<div class="card-body">
					<h5 class="card-title">Ainda não é cadastrado?</h5>
					<h6 class="card-subtitle mb-2 text-muted text-center">Faça o
						seu cadastro e tenha a oportunidade de participar do processo de
						seleção.</h6>
					<form class="form" action="/trabalheconosco/candidato/cadastrar"
						method="post">
						<div class="form-group">
							<label for="cpf">CPF</label> <input type="text"
								class="form-control cpf" id="cpf" name="cpf" />
						</div>
						<div class="form-group">
							<label for="email">E-mail</label> <input type="text"
								class="form-control" id="email" name="contato.email" />
						</div>
						<div class="form-group">
							<span>${mensagem}</span><br />
							<button type="submit" class="btn btn-dark">Cadastrar</button>
							<br />
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class=" col-11 col-sm-11 col-md-5 col-lg-3 col-xl-3">
			<div class="card text-center card-pantone561c" id="formLogin">
				<br /> <i class="fas fa-sign-in-alt fa-5x"></i>
				<div class="card-body">
					<h5 class="card-title">Acesse o seu currículo e participe dos
						nossos processos seletivos.</h5>
					<form class="form" action="/trabalheconosco/login" method="post"
						autocomplete="off">
						<div class="form-group">
							<label for="usuario">CPF</label> <input type="text"
								class="form-control" id="login" name="login" />
						</div>
						<div class="form-group">
							<label for="senha">Senha</label> <input type="password"
								class="form-control" id="senha" name="senha" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success">Entrar</button>
							<br />
							<br /> <a href="#" onclick="gerarNovaSenha()"
								class="badge badge-info">Esqueci minha senha</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<spring:url value="/resources/js/form_login.js" var="formLoginJS"></spring:url>
<script type="text/javascript" src="${formLoginJS}"></script>