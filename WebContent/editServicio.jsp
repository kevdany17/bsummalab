<% if(session.getAttribute("User")==null){%>
	<link href="style/css/journal.css" rel="stylesheet"/>
	<div class="alert alert-danger"><h1>No tiene Acceso a esta Página</h1></div>
<%
}else{
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="com.bsummalab.bean.Servicio" %>
<link href="style/css/panel.css" rel="stylesheet"/>
<div class="container-fluid">
<div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="forms">Editar Servicio</h1>
            </div>
          </div>
        </div>
        <div class="row">
        <% Servicio service =(Servicio) request.getAttribute("servicio");%>
          <div class="col-md-6 col-md-offset-3">
            <div class="well bs-component">
             <form class="form-horizontal" action="ConsultarServicio" method="post"  autocomplete="off">
                <fieldset>
                  <div class="form-group">
                    <label for="id" class="col-lg-2 control-label">ID:</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="id" name="id" placeholder="Usuario" value="<%= service.getId()%>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="nombre" class="col-lg-2 control-label">Nombre</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="nombre" name="nombre" value="<%= service.getNombre() %>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="costo" class="col-lg-2 control-label">Costo</label>
                    <div class="col-lg-10 input-group">
                    	<div class="input-group-addon">$</div>
                      <input type="text" class="form-control" id="costo" name="costo" value="<%= service.getCosto() %>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="detalles" class="col-lg-2 control-label">Detalles</label>
                    <div class="col-lg-10">
                      <textarea rows="7" id="detalles" name="detalles" style="width:100%;"><%= service.getDescripcion() %></textarea>
                    </div>
                  </div>                               
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <!-- <button type="reset" class="btn btn-default">Cancel</button>-->
                      <button type="submit" class="btn btn-primary">Actualizar</button>
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
<%}%>