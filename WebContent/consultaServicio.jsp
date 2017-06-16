<% if(session.getAttribute("User")==null){%>
	<link href="style/css/journal.css" rel="stylesheet"/>
	<div class="alert alert-danger"><h1>No tiene Acceso a esta Página</h1></div>
<%
}else{
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="com.bsummalab.bean.Servicio" %>
<%@page import="com.bsummalab.bean.Usuario" %>
<%@page import="java.util.LinkedList" %>
<link href="style/css/panel.css" rel="stylesheet"/>
<div class="container-fluid">
<script type="text/javascript">
 function eliminar(identificador,nombre){
	 $("#service").html(nombre);
	 $("div[class=modal]").modal();
	 $("#confirmar").on("click",function(){
		$.get("ConsultarServicio",{id:identificador,tipo:'delete'},function(data){
			if(data=="200"){
				alert("Cambios Realizados");
				location.reload();
			}else{
				$("div[class=modal]").modal('hide');
				alert("Error al Actualizar Datos");
			}
		});		 
	 });
 }
</script>
<div class="row">
<div class="col-md-12">
<% Usuario user =(Usuario)session.getAttribute("User"); %>
		<table class="table table-striped table-hover ">
			  <thead>
			    <tr>
			      <th>#</th>
			      <th>Nombre</th>
			      <th>Costo</th>
			      <th>Detalles</th>
			      <% if(user.getPerfil().equals("Admin")) {%>
			      		<th>Administrar</th>
			      <%} %>
			    </tr>
			  </thead>
			  <tbody>
			  <% 
			LinkedList<Servicio> list = (LinkedList<Servicio>)request.getAttribute("servicios");
			for(int i=0;i<list.size();i++ ){%>
				<tr>
			      <td><%= list.get(i).getId() %></td>
			      <td><%= list.get(i).getNombre() %></td>
			      <td>$<%= list.get(i).getCosto() %></td>
			      <td><%= list.get(i).getDescripcion() %></td>
			       <% if(user.getPerfil().equals("Admin")) {%>
			      		<td><a href="ConsultarServicio?tipo=edit&id=<%= list.get(i).getId()%>" class="btn btn-info">Editar</a></td>
			      		<td><a href="javascript:eliminar('<%= list.get(i).getId()%>','<%= list.get(i).getNombre() %>')" class="btn btn-danger">Eliminar</a></td>
			      <%} %>
			    </tr>
			<% } %>
			  </tbody>
		</table> 
		</div>	
	</div>
</div>
<div class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Servicio</h4>
      </div>
      <div class="modal-body">
        <p>Confirma que desea Eliminar el Servicio&nbsp;<b><span id="service"></span></b></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="confirmar">Confirmar</button>
      </div>
    </div>
  </div>
</div>
				
<jsp:include page="footer.jsp"></jsp:include>
<%}%>