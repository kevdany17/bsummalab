package com.bsummalab.dao;
import com.bsummalab.datasource.*;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

import com.bsummalab.bean.*;
public class DAOUsuario {
	private DataSource ds;
	private ResultSet resultado;
	private int insercion;
	
	//Constructor con Inyeción de Dependicias
	public DAOUsuario(DataSource dataSource){
		this.ds = dataSource;
	}
	
	//Logueo
	public Usuario iniciarSesion(Usuario user){
		String sql = "SELECT * FROM usuarios WHERE usuario='"+user.getUsuario()+"' AND contrasena='"+DigestUtils.md5Hex(user.getContrasena())+"';";
		try {
			this.resultado = this.ds.query(sql);
			if(this.resultado.first()){
				user.setCorreo(this.resultado.getString("correo"));
				user.setId(this.resultado.getInt("id"));
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
	//Agrega Nuevos Usuarios o Tecnicos
	public boolean agregarUsuario(Usuario user){
		String sql = "INSERT INTO usuarios () VALUES (0,'"+user.getUsuario()+"','"+DigestUtils.md5Hex(user.getContrasena())+"',"
				+ "'"+user.getPerfil()+"','"+user.getNombre()+"','"+user.getCorreo()+"','"+user.getTelefono()+"');";
		this.insercion = this.ds.update(sql);
		if(this.insercion==1){
			return true;
		}else{
			return false;
		}
	}
}
