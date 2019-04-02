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
	<h3>Dados Pessoais</h3>
	<div class="card">
		<div class="card-body">
			<div class="form-group row">
				<div class="col-6 col-sm-6 col-md-3 col-lg-1 col-xl-1">
					<img class="card-img-top" src="${candidato.foto}">
				</div>
			</div>
			<div class="form-group row">

				<div class="col-12 col-sm-12 col-md-4 col-lg-2 col-xl-2">
					<label for="cpf">CPF</label> <input type="text" readonly
						class="form-control" id="cpf" value="${candidato.cpf}" />
				</div>
				<div class="col-12 col-sm-12 col-md-6 col-lg-5 col-xl-5">
					<label for="nome">Nome Completo</label> <input type="text" readonly
						class="form-control" id="nome" value="${candidato.nome}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="estadoCivil">Estado Civil</label> <input type="text"
						readonly class="form-control" id="estadoCivil"
						value="${candidato.estadoCivil}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="dataNascimento">Data de Nascimento</label> <input
						type="text" readonly class="form-control" id="dataNascimento"
						value="${candidato.dataNascimento}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="nacionalidade">Nacionalidade</label> <input type="text"
						readonly class="form-control" class="form-control"
						id="nacionalidade" value="${candidato.nacionalidade}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="sexo">Sexo</label> <input type="text" readonly
						class="form-control" class="form-control" id="sexo"
						value="${candidato.sexo}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
					<label for="nomeMae">Nome da Mãe</label> <input type="text"
						readonly class="form-control" id="nomeMae"
						value="${candidato.nomeMae}" />
				</div>
				<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
					<label for="nomePai">Nome do Pai</label> <input type="text"
						readonly class="form-control" id="nomePai"
						value="${candidato.nomePai}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
					<label for="nomeConjuge">Nome do Conjuge</label> <input type="text"
						readonly class="form-control" id="nomeConjuge"
						value="${candidato.nomeConjuge}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label class="label-control">Possui filho(s) </label> <input
						type="text" readonly class="form-control" id="filho"
						value="<c:if test="${candidato.filho eq true}">Sim</c:if> <c:if test="${candidato.filho eq N}">Não</c:if>" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="qtdFilho">Total de filhos</label> <input type="text"
						readonly class="form-control" id="qtdFilho"
						value="${candidato.qtdFilho}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="idadeFilho">Idade do(s) Filho(s)</label> <input
						type="text" readonly class="form-control" id="idadeFilho"
						value="${candidato.idadeFilho}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
					<label class="label-control">Possui deficiência </label> <input
						type="text" readonly class="form-control" id="pcd"
						value="<c:if test="${candidato.pcd eq true}">Sim</c:if> <c:if test="${candidato.pcd eq N}">Não</c:if>" />
				</div>
				<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
					<label for="descricaoPcd">Descreva a deficiência</label> <input
						type="text" readonly class="form-control" id="descricaoPcd"
						value="${candidato.descricaoPcd}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="numeroPis">Número do Pis</label> <input type="text"
						readonly class="form-control" id="numeroPis"
						value="${candidato.numeroPis}" />
				</div>
				<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
					<label for="escolaridade">Escolaridade</label> <input type="text"
						readonly class="form-control" id="escolaridade"
						value="${candidato.escolaridade.nome}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
					<label for="linkFacebook">Link Facebook</label> <input type="text"
						readonly class="form-control" id="linkFacebook"
						value="${candidato.linkFacebook}" />
				</div>
			</div>
		</div>
	</div>
	<h3>Informações de Endereço</h3>
	<div class="card">
		<div class="card-body">
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="cep">CEP</label> <input type="text" readonly
						class="form-control" id="cep" value="${candidato.endereco.cep}" />
				</div>
				<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
					<label for="endereco">Endereço</label> <input type="text" readonly
						class="form-control" id="endereco"
						value="${candidato.endereco.endereco}" />
				</div>
				<div class="col-12 col-sm-12 col-md-2 col-lg-1 col-xl-1">
					<label for="numero">Nº</label> <input type="text" readonly
						class="form-control" id="cpf" value="${candidato.endereco.numero}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-5 col-lg-4 col-xl-4">
					<label for="bairro">Bairro</label> <input type="text" readonly
						class="form-control" id="bairro"
						value="${candidato.endereco.bairro}" />
				</div>
				<div class="col-12 col-sm-12 col-md-5 col-lg-4 col-xl-4">
					<label for="complemento">Complemento</label> <input type="text"
						readonly class="form-control" id="complemento"
						value="${candidato.endereco.complemento}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
					<label for="estado">Estado</label> <input type="text" readonly
						class="form-control" id="estado"
						value="${candidato.endereco.cidade.estado.nome}" />
				</div>
				<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
					<label for="cidade">Cidade</label> <input type="text" readonly
						class="form-control" id="cidade"
						value="${candidato.endereco.cidade.nome}" />
				</div>
			</div>
		</div>
	</div>
	<h3>Contato</h3>
	<div class="card">
		<div class="card-body">
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="telefone">Telefone</label> <input type="text" readonly
						class="form-control" id="telefone"
						value="${candidato.contato.telefone}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="celular">Celular</label> <input type="text" readonly
						class="form-control" id="celular"
						value="${candidato.contato.celular}" />
				</div>
				<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
					<label for="numeroContato">Nº Contato</label> <input type="text"
						readonly class="form-control" id="numeroContato"
						value="${candidato.contato.numeroContato}" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
					<label for="email">E-mail</label> <input type="text" readonly
						class="form-control" id="email" value="${candidato.contato.email}" />
				</div>
			</div>
		</div>
	</div>
	<h3>Experiência Profissional</h3>
	<div class="table-responsive">
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
				<c:forEach items="${candidato.experienciasProfissionais}"
					var="experienciaProfissional">
					<tr>
						<td>${experienciaProfissional.nomeEmpresa}</td>
						<td>${experienciaProfissional.nomeCargo}</td>
						<td>${experienciaProfissional.dataInicio}</td>
						<td>${experienciaProfissional.dataFim}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h3>Formação Acadêmica</h3>
	<div class="table-responsive">
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
				<c:forEach items="${candidato.formacoesAcademicas}"
					var="formacaoAcademica" varStatus="i">
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
	</div>
	<h3>Cursos</h3>
	<div class="table-responsive">
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
	</div>
</section>
<br />
