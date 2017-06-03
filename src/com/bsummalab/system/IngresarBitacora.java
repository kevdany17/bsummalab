package com.bsummalab.system;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Cliente;
import com.bsummalab.bean.Equipo;
import com.bsummalab.bean.Servicio;
import com.bsummalab.dao.DAOTecnico;
import com.bsummalab.datasource.DataSource;

/**
 * Servlet implementation class IngresarBitacora
 */
@WebServlet("/IngresarBitacora")
public class IngresarBitacora extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IngresarBitacora() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOTecnico tc = new DAOTecnico(new DataSource());
		Bitacora bitacora = new Bitacora();
		Cliente client = new Cliente();
		Equipo equipo = new Equipo();
		client.setId(DigestUtils.md5Hex(request.getParameter("nombre-cliente")));
		client.setNombre(request.getParameter("nombre-cliente"));
		client.setTelefono(request.getParameter("telefono"));
		client.setCorreo(request.getParameter("correo"));
		equipo.setId(new Date().hashCode());
		equipo.setFechaIngreso(request.getParameter("fecha-ingreso"));
		equipo.setMarca(request.getParameter("marca"));
		equipo.setModelo(request.getParameter("modelo"));
		equipo.setTipo(request.getParameter("tipo"));
		equipo.setSistema(request.getParameter("sistema"));
		equipo.setRam(request.getParameter("ram"));
		equipo.setHdd(request.getParameter("hdd"));
		equipo.setLicencia(request.getParameter("licencia"));
		equipo.setDiagnostico(request.getParameter("diagnostico"));
		equipo.setObservaciones(request.getParameter("observaciones"));
		equipo.setFechaEntrega(request.getParameter("fecha-entrega"));
		equipo.setEstado(request.getParameter("esatdo"));
		String [] servicios = request.getParameterValues("servicio");
		for(String i:servicios){
			Servicio service = new Servicio();
			service.setId(Integer.parseInt(i));
			bitacora.setServicios(service);
		}
		bitacora.setEquipos(equipo);
		bitacora.setCliente(client);
		if(tc.insertarDatos(bitacora)){
			request.setAttribute("estado",1);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}else{
			request.setAttribute("estado",0);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}		
		
	}

}
