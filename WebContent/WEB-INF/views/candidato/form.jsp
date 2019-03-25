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
		<h3>Dados Pessoais</h3>
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
							<label for="nome">Nome</label>
							<input type="text" class="form-control" id="nome" name="nome" value="${candidato.nome}" required/>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="estadoCivil">Estado Civil</label>
							<select id="estadoCivil" name="estadoCivil" class="form-control" required>
								<option value="casado" <c:if test="${candidato.estadoCivil eq 'casado'}">selected</c:if>>Casado(a)</option>
								<option value="divorciado" <c:if test="${candidato.estadoCivil eq 'divorciado'}">selected</c:if>>Divorciado(a)</option>
								<option value="separado" <c:if test="${candidato.estadoCivil eq 'separado'}">selected</c:if>>Separado(a)</option>
								<option value="solteiro" <c:if test="${candidato.estadoCivil eq 'solteiro'}">selected</c:if>>Solteiro(a)</option>
								<option value="viuvo" <c:if test="${candidato.estadoCivil eq 'viuvo'}">selected</c:if>>Viúvo(a)</option>
							</select>
						</div>
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="dataNascimento">Data Nascimento</label>
							<input type="text" class="form-control data" id="dataNascimento" name="dataNascimento" value="${candidato.dataNascimento}" required/>
						</div>
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="nacionalidade">Nacionalidade</label>
							<input type="text" class="form-control" id="nacionalidade" name="nacionalidade" value="${candidato.nacionalidade}" required/>
						</div>
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="sexo">Sexo</label>
							<select id="sexo" name="sexo" class="form-control" required>
								<option value="F" <c:if test="${candidato.sexo eq 'F'}">selected</c:if>>Feminino</option>
								<option value="M" <c:if test="${candidato.sexo eq 'M'}">selected</c:if>>Masculino</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
							<label for="nomeMae">Nome da Mãe</label>
							<input type="text" class="form-control" id="nomeMae" name="nomeMae" value="${candidato.nomeMae}" required/>
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
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
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
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="qtdFilho">Total de filhos</label>
							<input type="text" class="form-control" id="qtdFilho" name="qtdFilho" value="${candidato.qtdFilho}" />
						</div>
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
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
								<input class="form-check-input" type="radio" id="ativo" name="pcd" value="false"  <c:if test="${candidato.pcd eq false}">checked</c:if>/>
								<label class="form-check-label">Não</label>
							</div>
						</div>
						<div class="col-12 col-sm-12 col-md-5 col-lg-4 col-xl-4">
							<label for="descricaoPcd">Descreva a deficiência</label>
							<input type="text" class="form-control" id="descricaoPcd" name="descricaoPcd" value="${candidato.descricaoPcd}" />
						</div>
						<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
							<label for="numeroPis">Número do Pis</label>
							<input type="text" class="form-control" id="numeroPis" name="numeroPis" value="${candidato.numeroPis}"/>
						</div>
						<div class="col-12 col-sm-12 col-md-7 col-lg-4 col-xl-4">
							<label for="escolaridade">Escolaridade</label>
							<select id="escolaridade" name="escolaridade.id" class="form-control" required>
								<option value="">Selecione</option>
								<c:forEach items="${escolaridades}" var="escolaridade">
									<option value="${escolaridade.id}" <c:if test="${escolaridade.id eq candidato.escolaridade.id}">selected</c:if>>${escolaridade.nome}</option>
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
							<label  for="foto">Foto</label>
							<input type="hidden" name="foto" value="${candidato.foto}" />
							<input type="file" class="form-control" id="foto" name="imagem" >
						</div>
					</div>
			  </div>
			</div>
			<h3>Informações de Endereço</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="cep">CEP</label>
						<input type="text" class="form-control cep" id="cep" name="endereco.cep" value="${candidato.endereco.cep}" required/>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="endereco">Endereço</label>
						<input type="text" class="form-control" id="endereco" name="endereco.endereco" value="${candidato.endereco.endereco}" required/>
					</div>
					<div class="col-12 col-sm-12 col-md-3 col-lg-1 col-xl-1">
						<label for="numero">Nº</label>
						<input type="text" class="form-control" id="numero" name="endereco.numero" value="${candidato.endereco.numero}" required/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="bairro">Bairro</label>
						<input type="text" class="form-control" id="bairro" name="endereco.bairro" value="${candidato.endereco.bairro}" required/>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
						<label for="complemento">Complemento</label>
						<input type="text" class="form-control" id="complemento" name="endereco.complemento" value="${candidato.endereco.complemento}" required />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="estado">Estado</label>
						${candidato.endereco.cidade.estado.codigoUf}
						<select class="form-control" id="estado" required>
							<option value="">Selecione</option>
							<c:forEach items="${estados}" var="estado">
								<option value="${estado.codigoUf}" <c:if test="${estado.codigoUf eq candidato.endereco.cidade.estado.codigoUf}">selected</c:if>>${estado.nome}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
						<label for="cidade">Cidade</label>
						<input type="hidden" id="cidadeEscolhida" value="${candidato.endereco.cidade.id}"  />
						<select class="form-control" id="cidade" name="endereco.cidade.id" required>
						</select>
					</div>
				</div>
			  </div>
			</div>
			<h3>Contato</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-4 col-lg-2 col-xl-2">
						<label for="telefone">Telefone</label>
						<input type="text" class="form-control telefone" id="telefone" name="contato.telefone" value="${candidato.contato.telefone}" required/>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-2 col-xl-2">
						<label for="celular">Celular</label>
						<input type="text" class="form-control celular" id="celular" name="contato.celular" value="${candidato.contato.celular}" required/>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-2 col-xl-2">
						<label for="numeroContato">Nº Contato</label>
						<input type="text" class="form-control contato" id="numeroContato" name="contato.numeroContato" value="${candidato.contato.numeroContato}" required />
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
						<label for="email">E-mail</label>
						<input type="email" class="form-control" id="email" name="contato.email" value="${candidato.contato.email}" required/>
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
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="dataAdmissao">Data início</label>
						<input type="text" class="form-control data" id="dataInicioExperienciaProfissional"/>
					</div>
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="dataDemissao">Data fim</label>
						<input type="text" class="form-control data" id="dataFimExperienciaProfissional"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<br/>
						<a class="btn btn-sm btn-secondary" onclick="adicionarExperienciaProfissional()"><i class="fas fa-plus"></i></a>
					</div>
					<input type="hidden" id="contadorExperienciasProfissionais" value="${fn:length(candidato.experienciasProfissionais)}"/>
				</div>
				<div class="table-responsive">
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
							<c:forEach items="${candidato.experienciasProfissionais}" var="experienciaProfissional" varStatus="i">
								<tr id="experienciaProfissional${i.index}">
									<td>
										${experienciaProfissional.nomeEmpresa}
										<input type="hidden" name="experienciasProfissionais[${i.index}].id"  value="${experienciaProfissional.id}"/>
										<input type="hidden" name="experienciasProfissionais[${i.index}].nomeEmpresa" value="${experienciaProfissional.nomeEmpresa}"/>
										<input type="hidden" name="experienciasProfissionais[${i.index}].nomeCargo" value="${experienciaProfissional.nomeCargo}"/>
										<input type="hidden" name="experienciasProfissionais[${i.index}].dataInicio" value="${experienciaProfissional.dataInicio}"/>
										<input type="hidden" name="experienciasProfissionais[${i.index}].dataFim"value="${experienciaProfissional.dataFim}"/>
									</td>
									<td>${experienciaProfissional.nomeCargo}</td>
									<td>${experienciaProfissional.dataInicio}</td>
									<td>${experienciaProfissional.dataFim}</td>
									<td>
										<a class="btn btn-sm btn-danger" onclick="deletarExperienciaProfissional(${i.index},${experienciaProfissional.id})"><i class="fas fa-trash-alt"></i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			  </div>
			  </div>
			</div>
			<h3>Formação Acadêmica</h3>
			<div class="card">
			  <div class="card-body">
			    <div class="form-group row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
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
					<div class="col-12 col-sm-12 col-md-5 col-lg-6 col-xl-6">
						<label for="nomeCursoFormacaoAcademica">Nome do Curso</label>
						<input type="text" class="form-control" id="nomeCursoFormacaoAcademica" />
					</div>

					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="dataInicioFormacaoAcademica">Data de Início</label>
						<input type="text" class="form-control data" id="dataInicioFormacaoAcademica"/>
					</div>
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="dataFim">Data Fim</label>
						<input type="text" class="form-control data" id="dataFimFormacaoAcademica"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<br/>
						<a class="btn btn-sm btn-secondary" onclick="adicionarFormacaoAcademica()"><i class="fas fa-plus"></i></a>
						<input type="hidden" id="contadorFormacoesAcademica" value="${fn:length(candidato.formacoesAcademicas)}"/>
					</div>
				</div>
				<div class="table-responsive">
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
								<tr id="formacaoAcademica${i.index}">
									<td>
										${formacaoAcademica.nivelFormacao.nome}
										<input type="hidden" name="formacoesAcademicas[${i.index}].id" value="${formacaoAcademica.id}"/>
										<input type="hidden" name="formacoesAcademicas[${i.index}].nivelFormacao.id" value="${formacaoAcademica.nivelFormacao.id}"/>
										<input type="hidden" name="formacoesAcademicas[${i.index}].instituicao" value="${formacaoAcademica.instituicao}"/>
										<input type="hidden" name="formacoesAcademicas[${i.index}].nomeCurso" value="${formacaoAcademica.nomeCurso}"/>
										<input type="hidden" name="formacoesAcademicas[${i.index}].dataInicio" value="${formacaoAcademica.dataInicio}"/>
										<input type="hidden" name="formacoesAcademicas[${i.index}].dataFim" value="${formacaoAcademica.dataFim}"/>
									</td>
									<td>${formacaoAcademica.instituicao}</td>
									<td>${formacaoAcademica.nomeCurso}</td>
									<td>${formacaoAcademica.dataInicio}</td>
									<td>${formacaoAcademica.dataFim}</td>
									<td>
										<a class="btn btn-sm btn-danger" onclick="deletarFormacaoAcademica(${i.index},${formacaoAcademica.id})"><i class="fas fa-trash-alt"></i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="dataInicio">Data de Início</label>
						<input type="text" class="form-control data" id="dataInicioCurso"/>
					</div>
					<div class="col-12 col-sm-12 col-md-3 col-lg-2 col-xl-2">
						<label for="dataFim">Data Fim</label>
						<input type="text" class="form-control data" id="dataFimCurso"/>
					</div>
					<div class="col-12 col-sm-12 col-md-1 col-lg-1 col-xl-1">
						<br/>
						<a class="btn btn-sm btn-secondary" onclick="adicionarCurso()"><i class="fas fa-plus"></i></a>
						<input type="hidden" id="contadorCursos" value="${fn:length(candidato.cursos)}"/>
					</div>
				</div>
					<div class="table-responsive">
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
									<tr id="curso${i.index}">
										<td>
											${curso.nome}
											<input type="hidden" name="cursos[${i.index}].id" value="${curso.id}"/>
											<input type="hidden" name="cursos[${i.index}].nome" value="${curso.nome}"/>
											<input type="hidden" name="cursos[${i.index}].instituicao" value="${curso.instituicao}"/>
											<input type="hidden" name="cursos[${i.index}].dataInicio" value="${cursto.dataInicio}"/>
											<input type="hidden" name="cursos[${i.index}].dataFim" value="${curso.dataFim}"/>
										</td>
										<td>${curso.instituicao}</td>
										<td>${curso.dataInicio}</td>
										<td>${curso.dataFim}</td>
										<td>
											<a class="btn btn-sm btn-danger" onclick="deletarCurso(${i.index},${curso.id})"><i class="fas fa-trash-alt"></i></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			  </div>
			</div>
			<br/>
		<div>
			<input type="hidden" class="form-control" id="dataCadastro" name="dataCadastro" value="${candidato.dataCadastro}"/>
			<input type="hidden" class="form-control" id="id" name="id" value="${candidato.id}"/>
			<input type="hidden" class="form-control" id="idEndereco" name="endereco.id" value="${candidato.endereco.id}"/>
			<input type="hidden" class="form-control" id="idContato" name="contato.id" value="${candidato.contato.id}"/>
			<input type="hidden" class="form-control" id="idUsuario" name="usuario.id" value="${candidato.usuario.id}"/>
			<a href="/trabalheconosco/home" class="btn btn-danger">Cancelar</a>
			<input type="submit" value="Salvar" class="btn btn-success"/>
		</div>
	</form>
</section>
<spring:url value="/resources/js/estadocidade.js" var="cidadeEstadoJS"></spring:url>
<spring:url value="/resources/js/form_candidato.js" var="formCandidatoJS"></spring:url>
<script type="text/javascript" src="${cidadeEstadoJS}"></script>
<script type="text/javascript" src="${formCandidatoJS}"></script>