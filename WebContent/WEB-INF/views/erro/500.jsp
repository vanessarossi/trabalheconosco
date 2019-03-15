<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/css/normalize.css" var="normalizeCSS"></spring:url>
<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS"></spring:url>
<spring:url value="https://use.fontawesome.com/releases/v5.5.0/css/all.css" var="fontawesomeCSS"></spring:url>
<spring:url value="/resources/js/comum/jquery.min.js" var="jqueryJS"></spring:url>
<spring:url value="/resources/js/comum/bootstrap.min.js" var="bootstrapJS"></spring:url>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/resources/img/logo_unimed.png" type="image/x-icon"/>
<title>Trabale Conosco - Erro 500 </title>
	<link href="${normalizeCSS}" rel="stylesheet">
	<link href="${bootstrapCSS}" rel="stylesheet">
	<link href="${fontawesomeCSS}" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-dark bg-dark bg-pantone348c">
	 	<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
	 		<a class="navbar-brand" href="/trabalheconosco/home">Trabalhe Conosco - Unimed São José do Rio Pardo</a>
	 	</div>
	</nav>
	<section class="text-center">
		<h1 class="h1">Encontramos um erro !</h1>
	</section>
	<br/>
	<br>
	<section class="form-group col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center">
		<a href="/trabalheconosco/home" class="rounded "><img src="/trabalheconosco/resources/img/rocket.png" alt="rocket" /></a>
	</section>
	<br/>
	<br/>
	<section class="form-group col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
			<p class="text-center lead">Entre em contato com a Unimed, caso o erro persista!</p>
	</section>
</body>
	<script type="text/javascript" src="${jqueryJS}"></script>
	<script type="text/javascript" src="${bootstrapJS}"></script>
</html>