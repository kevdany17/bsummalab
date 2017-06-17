<%@page import="com.bsummalab.bean.Usuario" %>
<div class="row">
	<div class="col-md-12">
		<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="Login">Inicio</a>
    </div>
	<% String pagina = (String) request.getAttribute("pagina"); %>
	<% Usuario user =(Usuario)session.getAttribute("User"); %>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="<%= pagina.equals("1")?"active":"" %>"><a href="Login">Registro</a></li>
		<li class="<%= pagina.equals("2")?"active":"" %>"><a href="ConsultarBitacora?tipo=select">Bitacora</a></li>
		 <% if(user.getPerfil().equals("Admin")) {%>
		<li class="<%= pagina.equals("3")?"active":"" %>"><a href="AgregarColaborador">Ingresar T&eacute;cnicos </a></li>
		<%} %>
        <li class="dropdown <%= pagina.equals("4")?"active":"" %>">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Servicios<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="AgregarServicio">Agregar Nuevo</a></li>
            <li><a href="ConsultarServicio?tipo=select">Mostrar Servicios</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
	</div>
</div>