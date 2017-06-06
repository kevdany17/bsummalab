<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="com.bsummalab.bean.Servicio" %>
<%@page import="com.bsummalab.bean.Bitacora" %>
<%@page import="java.util.LinkedList" %>
<link href="style/css/panel.css" rel="stylesheet"/>
<script type="text/javascript">
	$(document).ready(function(){
		var costo = 0;
		var temp = 0;
		var total = 0;
		$("input[type=checkbox]").each(function(){
			temp = $("#total").val();
			costo = $(this).data('costo');
			if($(this).prop('checked')){
				total = total+costo;
				$("#total").val(total);
			}else{
				total = total-costo;
				$("#total").val(total);
			}
			
		});
	});
</script>
<div class="container-fluid">
<% Bitacora bitacora = (Bitacora) request.getAttribute("bitacora"); %>
 <form action="ConsultarBitacora" method="post">
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Nombre del Cliente:
						<input name="nombre-cliente" type="text" class="form-control" value="<%= bitacora.getCliente().getNombre() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Tel&eacute;fono:
						<input name="telefono" type="text" class="form-control" value="<%= bitacora.getCliente().getTelefono() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Correo:
						<input name="correo" type="email" class="form-control" value="<%= bitacora.getCliente().getCorreo() %>" disabled>
					</label>
				</div>
			</div>
			<!-- <div class="col-md-3">
				<div class="form-group">
					<label>
						Recibe:
						<input name="correo" type="email" class="form-control" >
					</label>
				</div>
			</div>-->
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Fecha de Ingreso:
						<input name="fecha-ingreso" type="date" class="form-control" value="<%= bitacora.getEquipos().get(0).getFechaIngreso() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Marca:
						<input name="marca" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getMarca() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Modelo:
						<input name="modelo" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getModelo() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Tipo:
						<input name="modelo" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getTipo() %>" disabled>
					</label>
				</div>
			</div>
		</div>
		<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label>
					Sistema:
					<input name="modelo" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getSistema() %>" disabled>
				</label>
			</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						RAM:
						<input name="ram" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getRam() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						HDD:
						<input name="hdd" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getHdd() %>" disabled>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Licencia:
						<input name="licencia" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getLicencia() %>" disabled>
					</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label>
						Observaciones:<br>
						<textarea cols="57" rows="8" name="observaciones"><%= bitacora.getEquipos().get(0).getObservaciones() %></textarea>
					</label>
				</div>
			</div>
			<div class="col-md-3">
			<div class="form-group">
				<label>
					Diagnostico:
					<input name="diagnostico" type="text" class="form-control" value="<%= bitacora.getEquipos().get(0).getDiagnostico() %>" disabled>
				</label>
			</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Estado:
						<select class="form-control" name="estado">
							<option value="<%= bitacora.getEquipos().get(0).getEstado() %>"><%= bitacora.getEquipos().get(0).getEstado() %></option>
							<option value="ingreso">Ingreso</option>
							<option value="mantenimiento">En Mantenimiento</option>
							<option value="entregado">Entregado</option>
						</select>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Fecha de Entrega:
						<input name="fecha-entrega" type="date" class="form-control" value="<%= bitacora.getEquipos().get(0).getFechaEntrega() %>">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Costo:
						<div class="input-group">
							<div class="input-group-addon">$</div>
							<input name="costo" type="number" id="total" class="form-control">
						</div>
					</label>
				</div>
			</div>
			<div class="col-md-2 col-md-offset-3">
				<button type="submit" class="btn btn-primary" style="width:100%;">Guardar</button>
			</div>
		</div>
		<div class="row">
			<% 
			LinkedList<Servicio> list = bitacora.getServicios();
			for(int i=0;i<list.size();i++ ){%>
				<div class="col-md-2">
					<input type="checkbox" class="service" name="servicio" value="<%= list.get(i).getId() %>" data-costo="<%= list.get(i).getCosto() %>" disabled checked>
					<%= list.get(i).getNombre() %>
				</div>
			<% } %>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>