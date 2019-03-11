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
	<form class="form" action="/trabalheconosco/candidato/salvar" method="post">
		<h3>Dados Pessoais</h3>
			<div class="card">
			  <div class="card-body">
			  		<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="cpf">CPF</label>
							<input type="text" class="form-control cpf" id="cpf" name="cpf" value="${candidato.cpf}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="senha">Senha</label>
							<input type="password" class="form-control" id="senha"name="usuario.senha"/>
						</div>
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="nome">Nome</label>
							<input type="text" class="form-control" id="nome" name="nome" value="${candidato.nome}"/>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="estadoCivil">Estado Civil</label>
							<select id="estadoCivil" name="estadoCivil" class="form-control">
								<option value="casado">Casado(a)</option>
								<option value="divorciado">Divorciado(a)</option>
								<option value="separado">Separado(a)</option>
								<option value="solteiro">Solteiro(a)</option>
								<option value="viuvo">Viúvo(a)</option>
							</select>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="dataNascimento">Data de Nascimento</label>
							<input type="text" class="form-control data" id="dataNascimento" name="dataNascimento" value="${candidato.dataNascimento}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="nacionalidade">Nacionalidade</label>
							<input type="text" class="form-control" id="nacionalidade" name="nacionalidade" value="${candidato.nacionalidade}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="sexo">Sexo</label>
							<select id="sexo" name="sexo" class="form-control">
								<option value="F" <c:if test="${candidato.sexo eq F}">checked</c:if>>Feminino</option>
								<option value="M" <c:if test="${candidato.sexo eq M}">checked</c:if>>Masculino</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomeMae">Nome da Mãe</label>
							<input type="text" class="form-control" id="nomeMae" name="nomeMae" value="${candidato.nomeMae}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomePai">Nome do Pai</label>
							<input type="text" class="form-control" id="nomePai" name="nomePai" value="${candidato.nomePai}" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomeConjuge">Nome do Conjuge</label>
							<input type="text" class="form-control" id="nomeConjuge" name="nomeConjuge" value="${candidato.nomeConjuge}" />
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label class="label-control">Possui filho(s) </label>
							<br/>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="filho" id="filho" value="true" <c:if test="${candidato.filho eq true}">checked</c:if>/>
								<label class="form-check-label">Sim</label>
							</div>
							<div class="form-check form-check-inline">
								 <input class="form-check-input" type="radio" name="filho" id="filho" value="false" <c:if test="${candidato.filho eq true}">checked</c:if>/>
								 <label class="form-check-label">Não</label>
							</div>
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="qtdFilho">Total de filhos</label>
							<input type="text" class="form-control" id="qtdFilho" name="qtdFilho" value="${candidato.qtdFilho}" />
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="idadeFilho">Idade do(s) Filho(s)</label>
							<input type="text" class="form-control" id="idadeFilho" name="idadeFilho" value="${candidato.idadeFilho}" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
							<label class="label-control">Possui deficiência </label>
							<br/>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="ativo" name="pcd" value="true" <c:if test="${candidato.pcd eq true}">checked</c:if>/>
								<label class="form-check-label">Sim</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="ativo" name="pcd" value="false"  <c:if test="${candidado.pcd eq false}">checked</c:if>/>
								<label class="form-check-label">Não</label>
							</div>
						</div>
						<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
							<label for="descricaoPcd">Descreva a deficiência</label>
							<input type="text" class="form-control" id="descricaoPcd" name="descricaoPcd" value="${candidato.descricaoPcd}" />
						</div>
						<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
							<label for="numeroPis">Número do Pis</label>
							<input type="text" class="form-control" id="numeroPis" name="numeroPis" value="${candidato.numeroPis}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
							<label for="escolaridade">Escolaridade</label>
							<select id="escolaridade" name="escolaridade.id" class="form-control">
								<option>Selecione</option>
								<c:forEach items="${escolaridades}" var="escolaridade">
									<option value="${escolaridade.id}" <c:if test="${escolaridade.id eq candidado.escolaridade.id}">selected</c:if>>${escolaridade.nome}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="linkFacebook">Link Facebook</label>
							<input type="text" class="form-control" id="linkFacebookcpf" name="linkFacebook" value="${candidato.linkFacebook}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
							<label for="foto">Foto</label>
							<input type="file" class="form-control" id="foto" name="foto" value="${candidato.foto}"/>
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
						<input type="text" class="form-control cep" id="cep" name="endereco.cep" value="${candidato.endereco.cep}"/>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="endereco">Endereço</label>
						<input type="text" class="form-control" id="endereco" name="endereco.endereco" value="${candidato.endereco.endereco}"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<label for="numero">Nº</label>
						<input type="text" class="form-control" id="numero" name="endereco.numero" value="${candidato.endereco.numero}"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="bairro">Bairro</label>
						<input type="text" class="form-control" id="bairro" name="endereco.bairro" value="${candidato.endereco.bairro}"/>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="complemento">Complemento</label>
						<input type="text" class="form-control" id="complemento" name="endereco.complemento" value="${candidato.endereco.complemento}" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="estado">Estado</label>
						<select class="form-control" id="estado">
							<option value="">Selecione</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado.codigoUf}" <c:if test="${candidato.endereco.cidade.estado.codigoUf eq estado.codigoUf}">checked</c:if>>${estado.nome}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="cidade">Cidade</label>
						<select class="form-control" id="cidade" name="endereco.cidade.codigoIbge">
						</select>
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
						<input type="text" class="form-control telefone" id="telefone" name="contato.telefone" value="${candidato.contato.telefone}" />
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="celular">Celular</label>
						<input type="text" class="form-control celular" id="celular" name="contato.celular" value="${candidato.contato.celular}" />
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="numeroContato">Nº Contato</label>
						<input type="text" class="form-control contato" id="numeroContato" name="contato.numeroContato" value="${candidato.contato.numeroContato}" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="email">E-mail</label>
						<input type="email" class="form-control" id="email" name="contato.email" value="${candidato.contato.email}"/>
					</div>
				</div>
			  </div>
			</div>
			<h3>Experiência Profissional</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="nomeEmpresa">Nome da Empresa</label>
						<input type="text" class="form-control" id="nomeEmpresa"  />
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="nomeCargo">Nome do Cargo</label>
						<input type="text" class="form-control" id="nomeCargo"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="dataAdmissao">Data início</label>
						<input type="text" class="form-control data" id="dataInicioExperienciaProfissional"/>
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="dataDemissao">Data fim</label>
						<input type="text" class="form-control data" id="dataFimExperienciaProfissional"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<br/>
						<a class="btn btn-sm btn-secondary" onclick="adicionarExperienciaProfissional()"><i class="fas fa-plus"></i></a>
					</div>
					<input type="hidden" id="contadorExperienciasProfissionais" value="${fn:length(candidato.experienciasProfissionais)}"/>
				</div>
				<table class="table" id="tabelaExperienciaProfissional">
					<thead>
						<tr>
							<th>Empresa</th>
							<th>Cargo</th>
							<th>Início</th>
							<th>Fim</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${candidato.experienciasProfissionais}" var="experienciaProfissional">
							<tr>
								<td>
									${experienciaProfissional.nomeEmpresa}
									<input type="hidden" name="candidato.experienciasProfissionais[${i.index}].experienciaProfissional.id"  value="experienciaProfissional.id"/>
									<input type="hidden" name="candidato.experienciasProfissionais[${i.index}].experienciaProfissional.nomeEmpresa" value="experienciaProfissional.nomeEmpresa"/>
									<input type="hidden" name="candidato.experienciasProfissionais[${i.index}].experienciaProfissional.Cargo" value="experienciaProfissional.nomeCargo"/>
									<input type="hidden" name="candidato.experienciasProfissionais[${i.index}].experienciaProfissional.dataInicio" value="experienciaProfissional.dataInicio"/>
									<input type="hidden" name="candidato.experienciasProfissionais[${i.index}].experienciaProfissional.dataFim"value="experienciaProfissional.dataFim"/>
								</td>
								<td>${experienciaProfissional.nomeCargo}</td>
								<td>${experienciaProfissional.dataInicio}</td>
								<td>${experienciaProfissional.dataFim}</td>
								<td>
									<a class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  </div>
			</div>
			<h3>Formação Acadêmica</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
						<label for="nivelFormacao">Nivel de Formação</label>
						<select id="nivelFormacao" class="form-control">
							<option value="">SELECIONE</option>
							<c:forEach items="${niveisFormacao}" var="nivelFormacao">
								<option value="${nivelFormacao.id}">${nivelFormacao.nome}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="instituicaoFormacaoAcademica">Instituição</label>
						<input type="text" class="form-control" id="instituicaoFormacaoAcademica" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="nomeCursoFormacaoAcademica">Nome do Curso</label>
						<input type="text" class="form-control" id="nomeCursoFormacaoAcademica" />
					</div>

					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="dataInicioFormacaoAcademica">Data de Início</label>
						<input type="text" class="form-control data" id="dataInicioFormacaoAcademica"/>
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="dataFim">Data Fim</label>
						<input type="text" class="form-control data" id="dataFimFormacaoAcademica"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<br/>
						<a class="btn btn-sm btn-secondary" onclick="adicionarFormacaoAcademica()"><i class="fas fa-plus"></i></a>
						<input type="hidden" id="contadorFormacoesAcademica" value="${fn:length(candidato.formacoesAcademicas)}"/>
					</div>
				</div>
				<table class="table" id="tabelaFormacoesAcademica">
					<thead>
						<tr>
							<th>Nível Formação</th>
							<th>Instituição</th>
							<th>Curso</th>
							<th>Início</th>
							<th>Fim</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${candidato.formacoesAcademicas}" var="formacaoAcademica" varStatus="i">
							<tr>
								<td>
									${formacaoAcademica.nivelFormacao.nome}
									<input type="hidden" name="candidato.formacoesAcademicas[${i.index}].formacaoAcademica.id" value="formacaoAcademica.id"/>
									<input type="hidden" name="candidato.formacoesAcademicas[${i.index}].formacaoAcademica.id" value="formacaoAcademica.nivelFormaca.id"/>
									<input type="hidden" name="candidato.formacoesAcademicas[${i.index}].formacaoAcademica.id" value="formacaoAcademica.instituicao"/>
									<input type="hidden" name="candidato.formacoesAcademicas[${i.index}].formacaoAcademica.id" value="formacaoAcademica.nomeCurso"/>
									<input type="hidden" name="candidato.formacoesAcademicas[${i.index}].formacaoAcademica.id" value="formacaoAcademica.dataInicio"/>
									<input type="hidden" name="candidato.formacoesAcademicas[${i.index}].formacaoAcademica.id" value="formacaoAcademica.dataFim"/>
								</td>
								<td>${formacaoAcademica.instituicao}</td>
								<td>${formacaoAcademica.nomeCurso}</td>
								<td>${formacaoAcademica.dataInicio}</td>
								<td>${formacaoAcademica.dataFim}</td>
								<td>
									<a class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  </div>
			</div>
			<h3>Cursos</h3>
			<div class="card">
			  <div class="card-body">
			     <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="nomeCurso">Nome do curso</label>
						<input type="text" class="form-control" id="nomeCurso" />
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="instituicaoCurso">Instituição</label>
						<input type="text" class="form-control" id="instituicaoCurso" />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="dataInicio">Data de Início</label>
						<input type="text" class="form-control data" id="dataInicioCurso"/>
					</div>
					<div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
						<label for="dataFim">Data Fim</label>
						<input type="text" class="form-control data" id="dataFimCurso"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<br/>
						<a class="btn btn-sm btn-secondary" onclick="adicionarCurso()"><i class="fas fa-plus"></i></a>
						<input type="hidden" id="contadorCursos" value="${fn:length(candidato.cursos)}"/>
					</div>
				</div>
				<table class="table" id="tabelaCursos">
					<thead>
						<tr>
							<th>Nome do Curso</th>
							<th>Instituição</th>
							<th>Início</th>
							<th>Fim</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${candidato.cursos}" var="curso" varStatus="i">
							<tr>
								<td>
									${curso.nome}
									<input type="hidden" name="candidato.cursos[${i.index}].curso.id" value="curso.id"/>
									<input type="hidden" name="candidato.cursos[${i.index}].curso.nome" value="curso.nome"/>
									<input type="hidden" name="candidato.cursos[${i.index}].curso.instituicao" value="curso.instituicao"/>
									<input type="hidden" name="candidato.cursos[${i.index}].curso.dataInicio" value="cursto.dataInicio"/>
									<input type="hidden" name="candidato.cursos[${i.index}].curso.dataFim" value="curso.dataFim"/>
								</td>
								<td>${curso.instituicao}</td>
								<td>${curso.dataInicio}</td>
								<td>${curso.dataFim}</td>
								<td>
									<a class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  </div>
			</div>
			<br/>
		<div>
			<input type="hidden" class="form-control" id="id" name="dataCadastro" value="${candidato.dataCadastro}"/>
			<input type="hidden" class="form-control" id="id" name="id" value="${candidato.id}"/>
			<a href="/trabalheconosco/" class="btn btn-warning">Cancelar</a>
			<input type="submit" value="Salvar" class="btn btn-success"/>
		</div>
	</form>
</section>
<spring:url value="/resources/js/estadocidade.js" var="cidadeEstadoJS"></spring:url>
<spring:url value="/resources/js/form_candidato.js" var="formCandidatoJS"></spring:url>
<script type="text/javascript" src="${cidadeEstadoJS}"></script>
<script type="text/javascript" src="${formCandidatoJS}"></script>