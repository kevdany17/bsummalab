package com.bsummalab.dao;
import com.bsummalab.datasource.*;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

import com.bsummalab.bean.*;
public class DAOUsuario {
	private DataSource ds;
	private ResultSet resultado;
	public DAOUsuario(DataSource dataSource){
		this.ds = dataSource;
	}
	public Usuario iniciarSesion(Usuario user){
		String sql = "SELECT * FROM usuarios WHERE usuario='"+user.getUsuario()+"' AND contrasena='"+DigestUtils.md5Hex(user.getContrasena())+"';";
		try {
			this.resultado = this.ds.query(sql);
			if(this.resultado.first()){
				user.setCorreo(this.resultado.getString("correo"));
				user.setId(this.resultado.getString("id"));
				user.setNombre(this.resultado.getString("nombre"));
				user.setPerfil(this.resultado.getString("perfil"));
				user.setContrasena(this.resultado.getString("contrasena"));
				user.setTelefono(this.resultado.getString("telefono"));
				return user;
			}else{
				user = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
