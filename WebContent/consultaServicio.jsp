<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<%@page import="java.util.Date" %>
<%@page import="com.bsummalab.bean.Servicio" %>
<%@page import="java.util.LinkedList" %>
<link href="style/css/panel.css" rel="stylesheet"/>

<div class="container-fluid">
		<form action="agregarServicio" method="post">
			<div class="row">
			<div class="col-md-3">
					<div class="form-group">
			Codigo del producto:<input type=”text” name=”codigo” maxlength=”4?>
					</div>
				</div>
				
				<div class="col-md-2" style="margin-top:20px;">
					<button type="submit" class="btn btn-primary" style="width: 100%;">Consultar</button>
				</div>
		</div>
	</form>
</div>
				
<jsp:include page="footer.jsp"></jsp:include>