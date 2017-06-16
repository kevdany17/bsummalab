package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsummalab.bean.Usuario;
import com.bsummalab.dao.DAOUsuario;
import com.bsummalab.datasource.DataSource;

/**
 * Servlet implementation class AgregarColaborador
 */
@WebServlet("/AgregarColaborador")
public class AgregarColaborador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarColaborador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("addColaborador.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario user = new Usuario();
		user.setUsuario(request.getParameter("usuario"));
		user.setNombre(request.getParameter("nombre"));
		user.setContrasena(request.getParameter("contrasena"));
		user.setCorreo(request.getParameter("correo"));
		user.setPerfil(request.getParameter("perfil"));
		user.setTelefono(request.getParameter("telefono"));
		DAOUsuario dao = new DAOUsuario(new DataSource());
		if(dao.agregarUsuario(user)){
			request.setAttribute("estado",1);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}else{
			request.setAttribute("estado",0);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
	}

}
