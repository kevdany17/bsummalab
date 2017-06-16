<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bsummalab.bean.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <meta http-equiv="Expires" content="0" /> 
<meta http-equiv="Pragma" content="no-cache" />-->
<!--  <script type="text/javascript">
  if(history.forward(1)){
    location.replace( history.forward(1) );
  }
</script>-->
<link href="style/css/journal.css" rel="stylesheet"/>
<script
  src="http://code.jquery.com/jquery-1.10.2.min.js"
  integrity="sha256-C6CB9UYIS9UJeqinPHWTHVqh/E1uhG5Twh+Y5qFQmYg="
  crossorigin="anonymous"></script>
<script src="style/js/bootstrap.min.js"></script>
<link href="style/css/header.css" rel="stylesheet"/>

<title>BS-UMMA Lab</title>
</head>
<body class="container-fluid">

<% Usuario user = (Usuario)request.getSession().getAttribute("User"); %>
<div class="row">
	<div class="col-md-2">
		<img src="img/logo.png" alt="logo" id="logo" />
	</div>
	<div class="col-md-9 text-center">
		<h1>Bitacora de Servicios</h1>
		<h2>UMMA Lab Technology</h2>
	</div>
</div>
<div class="row">
	<div class="col-md-2" id="sub-header">
		<h6>Bienvenido:&nbsp;<%= user.getNombre() %></h6>
	</div>
	<div class="col-md-1 col-md-offset-9">
		<a href="Logout"><h6>Salir</h6></a>
	</div>
</div>
