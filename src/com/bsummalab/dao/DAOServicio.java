package com.bsummalab.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.bsummalab.bean.Servicio;
import com.bsummalab.datasource.DataSource;

public class DAOServicio {
	private DataSource ds;
	private ResultSet resultado;

	public DAOServicio(DataSource dataSource){
		this.ds = dataSource;
	}
	public LinkedList<Servicio> obtenerServicios(){
		String sql = "SELECT * FROM servicios";
		LinkedList<Servicio> lista = new LinkedList<Servicio>();
		try {
			this.resultado = this.ds.query(sql);
			while(this.resultado.next()){
				Servicio servicio = new Servicio();
				servicio.setId(Integer.parseInt(this.resultado.getString("id")));
				servicio.setNombre(this.resultado.getString("nombre"));
				servicio.setCosto(this.resultado.getInt("costo"));
				servicio.setDescripcion(this.resultado.getString("detalles"));
				lista.add(servicio);
				}
				
		} catch (SQLException e) {
			e.printStackTrace();
			//return null;
		}
		return lista;
	}
	public Servicio buscarServicio(Servicio service){
		String sql = "SELECT * FROM servicios WHERE id = "+service.getId()+";";
		this.resultado = this.ds.query(sql);
		Servicio servicio =  new Servicio();
		try {
			if(this.resultado.first()){
				servicio.setId(this.resultado.getInt("id"));
				servicio.setNombre(this.resultado.getString("nombre"));
				servicio.setCosto(this.resultado.getInt("costo"));
				servicio.setDescripcion(this.resultado.getString("detalles"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return servicio;
	}
	public int modificarServicio(Servicio service){
		String sql = "UPDATE servicios SET nombre='"+service.getNombre() +"', costo='"+service.getCosto()+"',detalles='"+service.getDescripcion()+"' "
				+ "WHERE id="+service.getId()+";";
		return this.ds.update(sql);
	}
	public int eliminarServicio(Servicio service){
		String sql = "DELETE FROM servicios WHERE id="+service.getId()+";";
		return this.ds.update(sql);
		
	}
}
