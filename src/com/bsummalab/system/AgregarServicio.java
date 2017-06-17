package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsummalab.bean.Servicio;
import com.bsummalab.dao.DAOTecnico;
import com.bsummalab.datasource.DataSource;

/**
 * Servlet implementation class AgregarServicio
 */
@WebServlet("/AgregarServicio")
public class AgregarServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AgregarServicio() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pagina","4");
		request.getRequestDispatcher("agregarServicio.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DAOTecnico tc = new DAOTecnico(new DataSource());
		Servicio service = new Servicio();
		//service.setId(request.getParameter("id"));
		service.setNombre(request.getParameter("nombre"));
		service.setCosto(Integer.parseInt(request.getParameter("costo")));
		service.setDescripcion(request.getParameter("descripcion"));
		if(tc.agregarServicio(service)){
			request.setAttribute("estado",1);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}else{
			request.setAttribute("estado",0);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}		
		
				
	}

}
