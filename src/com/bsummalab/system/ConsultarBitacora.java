package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ConsultarBitacora
 */
@WebServlet("/ConsultarBitacora")
public class ConsultarBitacora extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConsultarBitacora() {
        super();
        // TODO Auto-generated constructor stub
    }

	//Devuelve la Vista dependiendo del Parametro Tipo
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("tipo");
		if(tipo.equals("formulario")){
			//Devuel Formulario de Busqueda
			request.getRequestDispatcher("bitacora.jsp").forward(request, response);
		}else if(tipo.equals("consulta")){
			//Devuelve los datos del Equipo y Servicios 
			//request.getRequestDispatcher("panel.jsp").forward(request, response);
		}
	}
	//Modifica el registro de la Bitacora Solicitado
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
