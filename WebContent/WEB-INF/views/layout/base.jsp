<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<spring:url value="/resources/css/normalize.css" var="normalizeCSS"></spring:url>
<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS"></spring:url>
<spring:url value="https://use.fontawesome.com/releases/v5.5.0/css/all.css" var="fontawesomeCSS"></spring:url>
<spring:url value="/resources/css/principal.css" var="principalCSS"></spring:url>

<spring:url value="/resources/js/comum/jquery.min.js" var="jqueryJS"></spring:url>
<spring:url value="/resources/js/comum/bootstrap.min.js" var="bootstrapJS"></spring:url>
<spring:url value="/resources/js/comum/jquery.mask.js" var="jqueryMaskJS"></spring:url>
<spring:url value="/resources/js/comum/mask.js" var="maskJS"></spring:url>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/resources/img/logo_unimed.png" type="image/x-icon"/>
<title>Trabale Conosco - <tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute> </title>

<link href="${normalizeCSS}" rel="stylesheet">
<link href="${bootstrapCSS}" rel="stylesheet">
<link href="${fontawesomeCSS}" rel="stylesheet">
<link href="${principalCSS}" rel="stylesheet">

<script type="text/javascript" src="${jqueryJS}"></script>
<script type="text/javascript" src="${bootstrapJS}"></script>
<script type="text/javascript" src="${jqueryMaskJS}"></script>
<script type="text/javascript" src="${maskJS}"></script>
</head>
<body>
	<div>
		<tiles:insertAttribute name="header" ignore="false"></tiles:insertAttribute>
	</div>
	<div class="container-fluid">
		<tiles:insertAttribute name="body" ignore="false"></tiles:insertAttribute>
	</div>
</body>

</html>