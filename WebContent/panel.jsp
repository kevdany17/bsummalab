<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="java.util.Date" %>
<%@page import="com.bsummalab.bean.Servicio" %>
<%@page import="java.util.LinkedList" %>
<link href="style/css/panel.css" rel="stylesheet"/>
<div class="container-fluid">
	<form action="IngresarBitacora" method="post">
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Nombre del Cliente:
						<input name="nombre-cliente" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Tel&eacute;fono:
						<input name="telefono" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Correo:
						<input name="correo" type="email" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Fecha de Ingreso:
						<input name="fecha-ingreso" type="date" class="form-control">
					</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Marca:
						<input name="marca" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Modelo:
						<input name="modelo" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Tipo:
						<select name="tipo" class="form-control">
							<option value="N/A">No Aplica</option>
							<option value="Windows XP">Windows XP</option>
							<option value="Windows Vista 32bits">Windows Vista 32bits</option>
							<option value="Windows Vista 64bits">Windows Vista 64bits</option>
							<option value="Windows Starter 32bits">Windows Starter 32bits</option>
							<option value="Windows Starter 64bits">Windows Starter 64bits</option>
							<option value="Windows 7 32bits">Windows 7 32bits</option>
							<option value="Windows 7 64bits">Windows 7 64bits</option>
							<option value="Windows 8 32bits">Windows 8 32bits</option>
							<option value="Windows 8 64bits">Windows 8 64bits</option>
							<option value="Windows 10 32bits">Windows 10 32bits</option>
							<option value="Windows 10 64bits">Windows 10 64bits</option>
							<option value="MAC OS">MAC OS</option>
							<option value="GNU/Linux">GNU/Linux</option>
						</select>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Sistema:
						<select name="sistema" class="form-control">
							<option value="Laptop">Laptop</option>
							<option value="C.Escritorio">C.Escritorio</option>
							<option value="USB">USB</option>
							<option value="iMAC">iMAC</option>
							<option value="MAC-book">MAC-book</option>
						</select>
					</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label>
						RAM:
						<input name="ram" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						HDD:
						<input name="hdd" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Licencia:
						<input name="licencia" type="text" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Diagnostico:
						<select class="form-control" name="diagnostico">
							<option value="rapido">Diagnostico R&aacute;pido</option>
							<option value="profundo">Diagnostico Profundo</option>
						</select>
					</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label>
						Observaciones:<br>
						<textarea cols="57" rows="8" ></textarea>
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Estado:
						<select class="form-control" name="estado">
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
						<input name="fecha-entrega" type="date" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>
						Costo:
						<input name="costo" type="number" class="form-control">
					</label>
				</div>
			</div>
			<div class="col-md-3" style="margin-top:20px;">
				<button type="submit" class="btn btn-primary">Guardar</button>
			</div>
		</div>
	</form>
	<div class="row">
	<% 
	LinkedList<Servicio> list = (LinkedList<Servicio>)request.getAttribute("Lista");
	for(int i=0;i<list.size();i++ ){%>
		<div class="col-md-2">
			<input type="radio" value="<%= list.get(i).getCosto() %>"><%= list.get(i).getNombre() %>
		</div>
	<% } %>
	</div>
</div>
</body>