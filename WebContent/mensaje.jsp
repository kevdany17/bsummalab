<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style/css/bootstrap.min.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::Estado::</title>
</head>
<body class="content">
<%
	if(Integer.parseInt(request.getAttribute("estado").toString())==1){
		%>
		<div class="alert alert-success">
			<h1>Registro Exitoso</h1>
		</div>
		
<%
	}else{
		%>
		<div class="alert alert-danger">
			<h1>Registro Exitoso</h1>
		</div>
<%	
	}
%>
</body>
</html>