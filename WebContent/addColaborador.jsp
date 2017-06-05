<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="java.util.Date" %>
<%@page import="com.bsummalab.bean.Servicio" %>
<%@page import="com.bsummalab.bean.Usuario" %>
<%@page import="java.util.LinkedList" %>
<link href="style/css/panel.css" rel="stylesheet"/>

<div class="container-fluid">
<div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="forms">Ingresar Personal T&eacute;cnico</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-md-offset-3">
            <div class="well bs-component">
             <form class="form-horizontal" action="AgregarColaborador" method="post">
                <fieldset>
                  <div class="form-group">
                    <label for="usuario" class="col-lg-2 control-label">Usuario</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="contrasena" class="col-lg-2 control-label">Contrase&ntilde;a</label>
                    <div class="col-lg-10">
                      <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Contrasena">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="nombre" class="col-lg-2 control-label">Nombre Completo</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Completo">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="perfil" class="col-lg-2 control-label">Perfil</label>
                    <div class="col-lg-10">
                      <select class="form-control" name="perfil" id="perfil">
                      		<option value="Tecnico">T&eacute;cnico</option>
                      		<option value="Admin">Admin</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="correo" class="col-lg-2 control-label">Correo</label>
                    <div class="col-lg-10">
                      <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="telefono" class="col-lg-2 control-label">Tel&eacute;fono</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Tel&eacute;fono">
                    </div>
                  </div>
                  
                
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <!-- <button type="reset" class="btn btn-default">Cancel</button>-->
                      <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div>
  </div>
 </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>