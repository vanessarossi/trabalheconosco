<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<section class="text-center">
	
	<p class="lead">Bem vindo, ${principal.username} !</p>
</section>
<br/>
<section id="menu">
	<div class="row card-columns justify-content-center">
		<div class="col-11 col-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/cargo/listagem">
				<div class="card text-center card-pantone731c" id="prestador">
					<br/>
					<i class="fas fa-briefcase fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Cargo</h5>
					</div>
				</div>
			</a>		
		</div>
		<div class=" col-11 col-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/postoAtendimento/listagem">
				<div class="card text-center card-pantone" id="usuario">
					<br/>
					<i class="fas fa-building fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Posto de Atendimento</h5>
					</div>
				</div>
			</a>
		</div>
	</div>
	<div class="row card-columns justify-content-center">
		<div class=" col-11 col-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/curriculo/listagem">
				<div class="card text-center card-pantone561c" id="usuario">
					<br/>
					<i class="fas fa-file fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Curriculos</h5>
					</div>
				</div>
			</a>
		</div>
		<div class=" col-11 col-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/vaga/listagem">
				<div class="card text-center card-pantone192C" id="cadastroResultado">
					<br/>
					<i class="fas fa-users fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Vaga</h5>
					</div>
				</div>
			</a>
		</div>
	</div>
	<div class="row card-columns justify-content-center">
		<div class=" col-11 csol-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/candidato/meucurriculo">
				<div class="card text-center card-pantone357c" id="envioResultado">
					<i class="far fa-id-card fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Meu Curriculo</h5>
					</div>
				</div>
			</a>
		</div>
		<div class=" col-11 csol-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/vaga/lista/aberta">
				<div class="card text-center card-pantone381c" id="logEnvio">
					<i class="fas fa-list-alt fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Vagas Abertas</h5>
					</div>
				</div>
			</a>
		</div>
	</div>
	<div class="row card-columns justify-content-center">
		<div class=" col-11 csol-sm-11 col-md-3 col-lg-3 col-xl-3">
			<a href="/trabalheconosco/logout">
				<div class="card text-center card-pantone2627c" id="conferenciaResultado">
					<i class="fas fa-sign-out-alt fa-5x"></i>
					<div class="card-body">
						<h5 class="card-title">Sair do Sistema</h5>
					</div>
				</div>
			</a>
		</div>
	</div>
</section>