<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<section class="text-center">
	<h2>Meu Currículo</h2>
</section>
<section id="conteudo">
	<a href="/trabalheconosco/candidato/editar" class="btn btn-sm btn-secondary">Editar Currículo</a>
	<a href="/trabalheconosco/home" class="btn btn-sm btn-danger">Cancelar</a>
	<br/>
	<br/>
	<h3>Dados Pessoais</h3>
		<div class="card">
			<div class="card-body">
			  	<div class="form-group row">
			  		<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
			  			<img class="card-img-top" src="..." alt="Card image cap">
			  		</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="cpf">CPF</label>
						<span class="form-control" id="cpf">${candidato.cpf}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="nome">Nome</label>
						<span class="form-control" id="nome">${candidato.nome}</span>
					</div>
				</div>
				<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="estadoCivil">Estado Civil</label>
							<span class="form-control" id="estadoCivil">${candidato.estadoCivil}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="dataNascimento">Data de Nascimento</label>
							<span class="form-control" id="dataNascimento">${candidato.dataNascimento}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="nacionalidade">Nacionalidade</label>
							<span class="form-control" id="nacionalidade">${candidato.nacionalidade}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="sexo">Sexo</label>
							<span class="form-control" id="sexo"> ${candidato.sexo}</span>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomeMae">Nome da Mãe</label>
							<span class="form-control" id="nomeMae">${candidato.nomeMae}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomePai">Nome do Pai</label>
							<span class="form-control" id="nomePai">${candidato.nomePai}</span>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomeConjuge">Nome do Conjuge</label>
							<span class="form-control" id="nomeConjuge">${candidato.nomeConjuge}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label class="label-control">Possui filho(s) </label>
							<span class="form-control" id="filho"><c:if test="${candidato.filho eq true}">Sim</c:if> <c:if test="${candidato.filho eq N}">Não</c:if></span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="qtdFilho">Total de filhos</label>
							<span class="form-control" id="qtdFilho">${candidato.qtdFilho}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="idadeFilho">Idade do(s) Filho(s)</label>
							<span class="form-control" id="idadeFilho">${candidato.idadeFilho}</span>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
							<label class="label-control">Possui deficiência </label>
							<span class="form-control" id="pcd"><c:if test="${candidato.pcd eq true}">Sim</c:if> <c:if test="${candidato.pcd eq N}">Não</c:if></span>
						</div>
						<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
							<label for="descricaoPcd">Descreva a deficiência</label>
							<span class="form-control" id="descricaoPcd">${candidato.descricaoPcd}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="numeroPis">Número do Pis</label>
							<span class="form-control" id="numeroPis">${candidato.numeroPis}</span>
						</div>
						<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
							<label for="escolaridade">Escolaridade</label>
							<span class="form-control" id="escolaridade">${candidato.escolaridade.nome}</span>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="linkFacebook">Link Facebook</label>
							<span class="form-control" id="linkFacebook">${candidato.linkFacebook}</span>
						</div>
					</div>
			  </div>
			</div>
			<h3>Informações de Endereço</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="cep">CEP</label>
						<span class="form-control" id="cep">${candidato.endereco.cep}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="endereco">Endereço</label>
						<span class="form-control" id="endereco">${candidato.endereco.endereco}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<label for="numero">Nº</label>
						<span class="form-control" id="cpf">${candidato.endereco.numero}</span>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="bairro">Bairro</label>
						<span class="form-control" id="bairro">${candidato.endereco.bairro}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="complemento">Complemento</label>
						<span class="form-control" id="complemento">${candidato.endereco.complemento}</span>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="estado">Estado</label>
						<span class="form-control" id="estado">${candidato.endereco.cidade.estado.nome}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="cidade">Cidade</label>
						<span class="form-control" id="cidade">${candidato.endereco.cidade.nome}</span>
					</div>
				</div>
			  </div>
			</div>
			<h3>Contato</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="telefone">Telefone</label>
						<span class="form-control" id="telefone">${candidato.contato.telefone}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="celular">Celular</label>
						<span class="form-control" id="celular">${candidato.contato.celular}</span>
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="numeroContato">Nº Contato</label>
						<span class="form-control" id="numeroContato">${candidato.contato.numeroContato}</span>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="email">E-mail</label>
						<span class="form-control" id="email">${candidato.contato.email}</span>
					</div>
				</div>
			  </div>
			</div>
			<h3>Experiência Profissional</h3>
			<table class="table" id="tabelaExperienciaProfissional">
				<thead>
					<tr>
						<th>Empresa</th>
						<th>Cargo</th>
						<th>Início</th>
						<th>Fim</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${candidato.experienciasProfissionais}" var="experienciaProfissional">
						<tr>
							<td>${experienciaProfissional.nomeEmpresa}</td>
							<td>${experienciaProfissional.nomeCargo}</td>
							<td>${experienciaProfissional.dataInicio}</td>
							<td>${experienciaProfissional.dataFim}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h3>Formação Acadêmica</h3>
			<table class="table" id="tabelaFormacoesAcademica">
				<thead>
					<tr>
						<th>Nível Formação</th>
						<th>Instituição</th>
						<th>Curso</th>
						<th>Início</th>
						<th>Fim</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${candidato.formacoesAcademicas}" var="formacaoAcademica" varStatus="i">
						<tr>
							<td>${formacaoAcademica.nivelFormacao.nome}</td>
							<td>${formacaoAcademica.instituicao}</td>
							<td>${formacaoAcademica.nomeCurso}</td>
							<td>${formacaoAcademica.dataInicio}</td>
							<td>${formacaoAcademica.dataFim}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h3>Cursos</h3>
			<table class="table" id="tabelaCursos">
				<thead>
					<tr>
						<th>Nome do Curso</th>
						<th>Instituição</th>
						<th>Início</th>
						<th>Fim</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${candidato.cursos}" var="curso" varStatus="i">
						<tr>
							<td>${curso.nome}</td>
							<td>${curso.instituicao}</td>
							<td>${curso.dataInicio}</td>
							<td>${curso.dataFim}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</section>
