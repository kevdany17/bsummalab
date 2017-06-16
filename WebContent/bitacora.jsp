<% if(session.getAttribute("User")==null){%>
	<link href="style/css/journal.css" rel="stylesheet"/>
	<div class="alert alert-danger"><h1>No tiene Acceso a esta Página</h1></div>
<%
}else{
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<link href="style/css/panel.css" rel="stylesheet"/>
<div class="container-fluid">
	<div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="forms">Consultar Bitacora</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-md-offset-3">
            <div class="well bs-component">
             <form class="form-horizontal" action="ConsultarBitacora" method="get">
                <fieldset>
                  <div class="form-group">
                    <label for="usuario" class="col-lg-2 control-label">Nombre Cliente</label>
                    <div class="col-lg-10">
                    <input type="hidden"  id="tipo" name="tipo" value="consulta">
                      <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Cliente">
                      
                    </div>
                  </div>                
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <!-- <button type="reset" class="btn btn-default">Cancel</button>-->
                      <button type="submit" class="btn btn-primary">Consultar</button>
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