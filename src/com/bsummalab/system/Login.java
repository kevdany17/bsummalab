package com.bsummalab.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.bsummalab.bean.*;
import com.bsummalab.datasource.*;
import com.bsummalab.dao.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOTecnico tc = new DAOTecnico(new DataSource());
		request.setAttribute("tecnicos",tc.obetenerTecnicos());
		request.setAttribute("Lista",tc.obetenerServicios());
		request.getRequestDispatcher("panel.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario user = new Usuario(request.getParameter("user"),request.getParameter("password"));
		DAOUsuario dao = new DAOUsuario(new DataSource());
		if(dao.iniciarSesion(user) instanceof Usuario){
			DAOTecnico tc = new DAOTecnico(new DataSource());
			HttpSession session=request.getSession();
			session.setMaxInactiveInterval(3600);
			request.setAttribute("tecnicos",tc.obetenerTecnicos());
			request.setAttribute("Lista",tc.obetenerServicios());
			session.setAttribute("User", user);
			request.getRequestDispatcher("panel.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "Usuario o Contrase&ntilde;a Incorrectos");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
