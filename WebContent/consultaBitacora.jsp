<% if(session.getAttribute("User")==null){%>
	<link href="style/css/journal.css" rel="stylesheet"/>
	<div class="alert alert-danger"><h1>No tiene Acceso a esta Página</h1></div>
<%
}else{
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="com.bsummalab.bean.Bitacora" %>
<%@page import="com.bsummalab.bean.Usuario" %>
<%@page import="java.util.LinkedList" %>
<link href="style/css/panel.css" rel="stylesheet"/>
<div class="container-fluid">
<script type="text/javascript">
 function eliminar(identificador,nombre,tipo){
	 $("#service").html(nombre+" -> Equipo: "+tipo);
	 $("div[class=modal]").modal();
	 $("#confirmar").on("click",function(){
		$.get("ConsultarBitacora",{id:identificador,tipo:'delete'},function(data){
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
<% Usuario user =(Usuario)session.getAttribute("User"); %>
<div class="col-md-12">
		<table class="table table-striped table-hover ">
			  <thead>
			    <tr>
			      <th>#</th>
			      <th>Cliente</th>
			      <th>Tel&eacute;fono</th>
			      <th>Tipo de Equipo</th>
			      <th>Marca</th>
			      <th>Fecha de Ingreso</th>
			      <th>Servicio</th>
			      <th>Administrar</th>
			    </tr>
			  </thead>
			  <tbody>
			  <% 
			LinkedList<Bitacora> list = (LinkedList<Bitacora>)request.getAttribute("lista");
			for(int i=0;i<list.size();i++ ){%>
				<tr>
			      <td><%= list.get(i).getEquipos().get(0).getId() %></td>
			      <td><%= list.get(i).getCliente().getNombre() %></td>
			      <td>$<%= list.get(i).getCliente().getTelefono() %></td>
			      <td><%= list.get(i).getEquipos().get(0).getTipo() %></td>
			      <td><%= list.get(i).getEquipos().get(0).getMarca() %></td>
			      <td><%= list.get(i).getEquipos().get(0).getFechaIngreso() %></td>
			      <td><%= list.get(i).getServicios().get(0).getNombre() %></td>
			      <td><a href="ConsultarBitacora?tipo=edit&id=<%= list.get(i).getEquipos().get(0).getId()%>" class="btn btn-info">Editar</a></td>
			      <% if(user.getPerfil().equals("Admin")) {%>
			      	<td><a href="javascript:eliminar('<%= list.get(i).getEquipos().get(0).getId()%>','<%= list.get(i).getCliente().getNombre() %>','<%= list.get(i).getEquipos().get(0).getTipo() %>')" class="btn btn-danger">Eliminar</a></td>
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
        <h4 class="modal-title">Eliminar Equipo de la Bitacora</h4>
      </div>
      <div class="modal-body">
        <p>Confirma que desea Eliminar el Registro del Cliente&nbsp;<b><span id="service"></span></b></p>
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