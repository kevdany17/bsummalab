package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Cliente;
import com.bsummalab.bean.Equipo;
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
		bitacora.setCliente(client);
		
		
	}

}
