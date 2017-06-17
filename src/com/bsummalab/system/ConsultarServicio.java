package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsummalab.bean.Servicio;
import com.bsummalab.dao.DAOServicio;
import com.bsummalab.datasource.DataSource;

/**
 * Servlet implementation class ConsultarServicio
 */
@WebServlet("/ConsultarServicio")
public class ConsultarServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultarServicio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("tipo");
		String pagina = "";
		DAOServicio dao = new DAOServicio(new DataSource());
		request.setAttribute("pagina","4");
		if(tipo.equals("select")){
			//Devuelve La tabla de todos los servicios
			request.setAttribute("servicios", dao.obtenerServicios());
			pagina = "consultaServicio.jsp";
			request.getRequestDispatcher(pagina).forward(request, response);
		}else if(tipo.equals("edit")){
			//Devuelve los datos del Equipo y Servicios 
			Servicio servicio = new Servicio();
			servicio.setId(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("servicio", dao.buscarServicio(servicio));
			pagina = "editServicio.jsp";
			request.getRequestDispatcher(pagina).forward(request, response);
		}else if(tipo.equals("delete")){
			Servicio servicio = new Servicio();
			servicio.setId(Integer.parseInt(request.getParameter("id")));
			if(dao.eliminarServicio(servicio)==1){
				response.getWriter().write("200");
			}else{
				response.getWriter().append("500");
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOServicio dao =  new DAOServicio(new DataSource());
		Servicio service = new Servicio();
		service.setId(Integer.parseInt(request.getParameter("id")));
		service.setNombre(request.getParameter("nombre"));
		service.setCosto(Integer.parseInt(request.getParameter("costo")));
		service.setDescripcion(request.getParameter("detalles"));
		if(dao.modificarServicio(service)==1){
			response.sendRedirect("ConsultarServicio?tipo=select");
		}else{
			request.setAttribute("estado",0);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}		
	}

}
