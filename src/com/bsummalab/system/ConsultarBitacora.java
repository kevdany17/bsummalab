package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Cliente;
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
		if(tipo.equals("formulario")){
			//Devuel Formulario de Busqueda
			pagina = "bitacora.jsp";
		}else if(tipo.equals("consulta")){
			//Devuelve los datos del Equipo y Servicios 
			String nombre = request.getParameter("nombre");
			Cliente cliente = new Cliente();
			cliente.setNombre(nombre);
			DAOBitacora dao =  new DAOBitacora(new DataSource());
			Bitacora bitacora = dao.consultarBitacora(cliente);
			if(bitacora!=null){
				request.setAttribute("bitacora",bitacora);
				pagina = "bitacoraMostrar.jsp";
			}else{
				pagina = "error.jsp";
			}
			
		}
		request.getRequestDispatcher(pagina).forward(request, response);
	}
	//Modifica el registro de la Bitacora Solicitado
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
