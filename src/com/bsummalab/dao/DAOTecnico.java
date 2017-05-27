package com.bsummalab.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Servicio;
import com.bsummalab.datasource.*;
public class DAOTecnico {
	private DataSource ds;
	private ResultSet resultado;
	public DAOTecnico(DataSource dataSource){
		this.ds = dataSource;
	}
	public boolean insertarDatos(Bitacora bitacora){
		String sql = "INSERT INTO clientes (id,nombre,telefono,correo)VALUES ('"+bitacora.getCliente().getId()+"','"
				+ bitacora.getCliente().getNombre()+"','"+bitacora.getCliente().getTelefono()+"','"+bitacora.getCliente().getCorreo()+"');";
		String sql2 = "INSERT INTO equipos VALUES(); ";
		return true;
	}
	public LinkedList<Servicio> obetenerServicios(){
		String sql = "SELECT * FROM servicios";
		this.resultado = this.ds.query(sql);
		LinkedList<Servicio> servicios = new LinkedList<Servicio>();
		try {
			while(this.resultado.next()){
				Servicio sc = new Servicio();
				sc.setId(this.resultado.getInt("id"));
				sc.setNombre(this.resultado.getString("nombre"));
				sc.setDescripcion(this.resultado.getString("detalles"));
				sc.setCosto(this.resultado.getInt("costo"));
				servicios.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return servicios;
	}
	
}
