package com.bsummalab.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Servicio;
import com.bsummalab.bean.Usuario;
import com.bsummalab.datasource.*;
public class DAOTecnico {
	private DataSource ds;
	private ResultSet resultado;
	private int fila;
	//Constructor Con Inyección de Dependencias
	public DAOTecnico(DataSource dataSource){
		this.ds = dataSource;
	}
	//Agrega Al Nuevo Cliente, EL Equipo, y Los Servicios Solicitados al Equipo
	public boolean insertarDatos(Bitacora bitacora){
		String sql = "INSERT INTO clientes (id,nombre,telefono,correo) VALUES ('"+bitacora.getCliente().getId()+"','"
				+ bitacora.getCliente().getNombre()+"','"+bitacora.getCliente().getTelefono()+"','"+bitacora.getCliente().getCorreo()+"');";
		String sql2 = "INSERT INTO equipos () VALUES('"+bitacora.getEquipos().get(0).getFechaIngreso().hashCode()+"','"+bitacora.getCliente().getId()+"','"+bitacora.getEquipos().get(0).getFechaIngreso()+"','"
				+bitacora.getEquipos().get(0).getMarca()+ "','"+bitacora.getEquipos().get(0).getModelo()+"','"+bitacora.getEquipos().get(0).getTipo()+"','"+bitacora.getEquipos().get(0).getSistema()+
				"','"+bitacora.getEquipos().get(0).getRam()+"','"+bitacora.getEquipos().get(0).getHdd()+"','"+bitacora.getEquipos().get(0).getLicencia()+"','"+bitacora.getEquipos().get(0).getDiagnostico()+
				"','"+bitacora.getEquipos().get(0).getObservaciones()+"','"+bitacora.getEquipos().get(0).getEstado()+"','"+bitacora.getEquipos().get(0).getFechaEntrega()+"');";
		this.fila = ds.update(sql);
		this.fila = ds.update(sql2);
		String sql3 = "";
		for(Servicio i:bitacora.getServicios()){
			sql3 = "INSERT INTO servicios_equipos () VALUES('"+i.getId()+"','"+bitacora.getEquipos().get(0).getFechaIngreso().hashCode()+"');";
			this.fila = ds.update(sql3);
		}
		if(this.fila == 1){
			return true;
		}else{
			return false;
		}
	}
	
	//Obtiene la Lista de Servicios para Mostrar
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
	
	//Obtiene la Lista de Tecnicos para Mostrar en el Select
	public LinkedList<Usuario> obetenerTecnicos(){
		String sql = "SELECT * FROM usuarios";
		this.resultado = this.ds.query(sql);
		LinkedList<Usuario> usuarios= new LinkedList<Usuario>();
		try {
			while(this.resultado.next()){
				Usuario sc = new Usuario();
				sc.setId(this.resultado.getInt("id"));
				sc.setUsuario(this.resultado.getString("usuario"));
				sc.setNombre(this.resultado.getString("nombre"));
				sc.setPerfil(this.resultado.getString("perfil"));
				sc.setCorreo(this.resultado.getString("correo"));
				sc.setTelefono(this.resultado.getString("telefono"));
				usuarios.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return usuarios;
	}
	//Agrega un Nuevo Servicio
	public boolean agregarServicio (Servicio services){
		String sql = "INSERT INTO servicios () VALUES (0,'"
				+ services.getNombre()+"',"+services.getCosto()+",'"+services.getDescripcion()+"');";
		this.fila = ds.update(sql);
		if(this.fila == 1){
			return true;
		}else{
			return false;
		}
		
	}
	
}
