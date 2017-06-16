<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<link href="style/css/panel.css" rel="stylesheet"/>
	<div class="container-fluid">
		<form action="AgregarServicio" method="post">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>
							Nombre:
							<input name="nombre" type="text" class="form-control">
						</label>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>
							Costo:
							<div class="input-group">
								<div class="input-group-addon">$</div>
								<input name="costo" type="text" class="form-control">
							</div>
						</label>
					</div>
				</div>
				<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>
							Descripcion:<br>
							<textarea cols="57" rows="8" name="descripcion" ></textarea>
						</label>
					</div>
				</div>
				<div class="col-md-2 col-md-offset-9" style="margin-top:20px;">	
				<button type="submit" class="btn btn-primary" style="width: 100%;">Guardar</button>						
				</div>
			</div>
		</div>
	</form>
</div>


<jsp:include page="footer.jsp"></jsp:include>
