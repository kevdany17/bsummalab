package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Cliente;
import com.bsummalab.bean.Equipo;
import com.bsummalab.bean.Servicio;
import com.bsummalab.dao.DAOBitacora;
import com.bsummalab.datasource.DataSource;

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
		String pagina = "";
		DAOBitacora dao = new DAOBitacora(new DataSource());
		request.setAttribute("pagina","2");
		if(tipo.equals("select")){
			//Devuel Formulario de Busqueda
			request.setAttribute("lista", dao.consultarBitacoras());
			pagina = "consultaBitacora.jsp";
			request.getRequestDispatcher(pagina).forward(request, response);
		}else if(tipo.equals("edit")){
			//Devuelve los datos del Equipo y Servicios 
			Equipo equipo = new Equipo();
			equipo.setId(Integer.parseInt(request.getParameter("id")));
			Bitacora bitacora = dao.buscarBitacora(equipo);
			if(bitacora!=null){
				request.setAttribute("bitacora",bitacora);
				pagina = "bitacoraMostrar.jsp";
			}else{
				pagina = "error.jsp";
			}
			request.getRequestDispatcher(pagina).forward(request, response);
		}else if(tipo.equals("delete")){
			Equipo equipo = new Equipo();
			equipo.setId(Integer.parseInt(request.getParameter("id")));
			if(dao.eliminarServicio(equipo)==1){
				response.getWriter().write("200");
			}else{
				response.getWriter().append("500");
			}
		}
	}
	//Modifica el registro de la Bitacora Solicitado
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Equipo equipo =  new Equipo();
		equipo.setId(Integer.parseInt(request.getParameter("id")));
		equipo.setEstado(request.getParameter("estado"));
		equipo.setFechaEntrega(request.getParameter("fecha-entrega"));
		equipo.setObservaciones(request.getParameter("observaciones"));
		DAOBitacora dao =  new DAOBitacora(new DataSource());
		System.out.println(equipo.getFechaEntrega());
		System.out.println(equipo.getEstado());
		if(dao.actualizarBitacora(equipo)==true){
			//request.setAttribute("estado",1);
			//request.getRequestDispatcher("mensaje.jsp").forward(request, response);
			response.sendRedirect("ConsultarBitacora?tipo=select");
		}else{
			request.setAttribute("estado",0);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
	}

}
