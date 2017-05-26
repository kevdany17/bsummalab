<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style/css/bootstrap.min.css" rel="stylesheet"/>
<link href="style/css/login.css" rel="stylesheet"/>
<script src="style/js/bootstrap.min.js"></script>
<title>BS-UMMA Lab</title>
</head>
<body>
	<div class="row">
		<div class="col-md-6 col-md-offset-3 content">
			<form action="Login" method="post">
			<div class="row">
				<div class="col-md-3">
					<img src="img/logo.png" alt="logo" id="logo" />
				</div>
				<div class="col-md-8">
					<h1>Inicio de Sesi&oacute;n</h1>
					<% if(request.getAttribute("error")== null){ %>
					<%}else{ %>
					<br>
					<div class="alert alert-danger"><%= request.getAttribute("error") %></div>
					<%} %>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="form-group">
						<label>Nombre de Usuario:</label>
						<input type="text" name="user" class="form-control">
					</div>
					<div class="form-group">
						<label>Contrase&ntilde;a:</label>
						<input type="password" name="password" class="form-control">
					</div>
					<button type="submit" class="btn btn-primary col-md-offset-4">Acceder</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>