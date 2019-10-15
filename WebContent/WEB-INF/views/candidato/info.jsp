<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<section class="text-center">
	<h2>Currículo</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<br /> <br />
	<h3>Informações do Candidato</h3>
	<div class="card">
		<div class="card-body">
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-4 col-lg-2 col-xl-2">
					<label for="cpf">CPF</label> 
					<input type="text" readonly class="form-control" id="cpf" value="${candidato.cpf}" />
				</div>
				<div class="col-12 col-sm-12 col-md-6 col-lg-5 col-xl-5">
					<label for="nome">Nome Completo</label> 
					<input type="text" readonly class="form-control" id="nome" value="${candidato.nome}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
					<label for="email">E-mail</label> 
					<input type="text" readonly class="form-control" id="email" value="${candidato.email}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
					<label for="arquivo">Currículo anexado ao perfil</label>
					<a href="/trabalheconosco/candidato/imprimir/${candidato.id}" target="_blank" class="btn btn-sm btn-secondary"><i class="fas fa-download"></i></a>
				</div>
			</div>
		</div>
	</div>
	</br>
	<h3>Cargos que gostaria de ser contratado(a)</h3>
		<div class="card">
			<div class="card-body">
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="opcaoUm">Primeira Opção</label>
						<input type="text" readonly class="form-control" id="opcaoUm" value="${candidato.opcaoUm.nome}"/> 
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="opcaoDois">Segunda Opção</label> 
						<input type="text" readonly class="form-control" id="opcaoDois" value="${candidato.opcaoDois.nome}"/> 
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="opcaoTres">Terceira Opção</label> 
						<input type="text" readonly class="form-control" id="opcaoTres" value="${candidato.opcaoTres.nome}"/> 	
					</div>
				</div>
			 </div>
		</div>
</section>
<br/>
