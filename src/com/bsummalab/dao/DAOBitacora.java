package com.bsummalab.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Cliente;
import com.bsummalab.bean.Equipo;
import com.bsummalab.bean.Servicio;
import com.bsummalab.datasource.DataSource;

public class DAOBitacora {
	private DataSource ds;
	private ResultSet resultado;
	private int fila;
	
	//Constructor con Inyección de Dependencia
	public DAOBitacora(DataSource dataSource){
		this.ds = dataSource;
	}
	//Consultar Lista de Equipos en la Bitacora
	public LinkedList<Bitacora> consultarBitacoras(){
		String sql = "SELECT clientes.nombre,clientes.telefono,equipos.id,equipos.tipo,equipos.marca,equipos.fecha_ingreso,servicios.nombre "
				+ "FROM equipos LEFT JOIN clientes ON clientes.id = equipos.id_cliente LEFT JOIN servicios_equipos "
				+ "ON servicios_equipos.id_equipo = equipos.id LEFT JOIN servicios ON servicios.id = servicios_equipos.id_servicios;";
		this.resultado =  this.ds.query(sql);
		LinkedList<Bitacora> lista =  new LinkedList<Bitacora>();
		
		try {
			while(this.resultado.next()){
				Servicio servicio = new Servicio();
				Equipo equipo = new Equipo();
				Cliente cliente =  new Cliente();
				Bitacora bitacora = new Bitacora();
				cliente.setNombre(this.resultado.getString("clientes.nombre"));
				cliente.setTelefono(this.resultado.getString("telefono"));
				equipo.setId(this.resultado.getInt("id"));
				equipo.setTipo(this.resultado.getString("tipo"));
				equipo.setMarca(this.resultado.getString("marca"));
				equipo.setFechaIngreso(this.resultado.getString("fecha_ingreso"));
				servicio.setNombre(this.resultado.getString("servicios.nombre"));
				bitacora.setCliente(cliente);
				bitacora.setEquipos(equipo);
				bitacora.setServicios(servicio);
				lista.add(bitacora);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
		
	}
	//Busca la Bitacora por ID
	public Bitacora buscarBitacora(Equipo eq){
		String sql = "SELECT * FROM equipos	LEFT JOIN clientes "
					+ "ON clientes.id = equipos.id_cliente "
					+ "LEFT JOIN servicios_equipos "
					+ "ON servicios_equipos.id_equipo = equipos.id "
					+ "LEFT JOIN servicios "
					+ "ON servicios.id = servicios_equipos.id_servicios "
					+ "WHERE equipos.id = "+eq.getId()+";";
		Bitacora bit = new Bitacora();
		try {
			this.resultado = this.ds.query(sql);
			Cliente client = new Cliente();
			Servicio servicio = new Servicio();
			Equipo equipo = new Equipo();
			while(this.resultado.next()){
				client.setNombre(this.resultado.getString("clientes.nombre"));
				client.setTelefono(this.resultado.getString("telefono"));
				client.setCorreo(this.resultado.getString("correo"));
				client.setId(this.resultado.getString("id_cliente"));
				equipo.setId(this.resultado.getInt("equipos.id"));
				equipo.setFechaIngreso(this.resultado.getString("fecha_ingreso"));
				equipo.setMarca(this.resultado.getString("marca"));
				equipo.setModelo(this.resultado.getString("modelo"));
				equipo.setTipo(this.resultado.getString("tipo"));
				equipo.setSistema(this.resultado.getString("sistema"));
				equipo.setRam(this.resultado.getString("ram"));
				equipo.setHdd(this.resultado.getString("hdd"));
				equipo.setLicencia(this.resultado.getString("licencia"));
				equipo.setDiagnostico(this.resultado.getString("diagnostico"));
				equipo.setObservaciones(this.resultado.getString("observaciones"));
				equipo.setEstado(this.resultado.getString("estado"));
				equipo.setFechaEntrega(this.resultado.getString("fecha_entrega"));
				servicio.setId(Integer.parseInt(this.resultado.getString("id_servicios")));
				servicio.setNombre(this.resultado.getString("servicios.nombre"));
				servicio.setCosto(this.resultado.getInt("costo"));
				servicio.setDescripcion(this.resultado.getString("detalles"));
				}
				bit.setCliente(client);
				bit.setEquipos(equipo);
				bit.setServicios(servicio);
				return bit;
		} catch (SQLException e) {
			e.printStackTrace();
			//return null;
		}
		return null;
	}
	//Actualiza solo algunos datos de la Bitacora por Proteción
	public boolean actualizarBitacora(Equipo equipo){
		String sql = "UPDATE equipos set estado='"+equipo.getEstado()+"' where id='"+equipo.getId()+"';";
		String sql0 = "UPDATE equipos set fecha_entrega='"+equipo.getFechaEntrega()+"' where id='"+equipo.getId()+"'; ";
		String sql1 ="UPDATE equipos set observaciones='"+equipo.getObservaciones()+"' where id='"+equipo.getId()+"';";;
		this.fila = this.ds.update(sql);
		this.fila = this.ds.update(sql0);
		this.fila = this.ds.update(sql1);
		if(this.fila==1){
			return true;
		}else{
			return false;
		}
		
	}
	public int eliminarServicio(Equipo equipo){
		String sql = "DELETE FROM equipos WHERE id="+equipo.getId()+";";
		String sql2 = "DELETE FROM servicios_equipos WHERE id_equipo="+equipo.getId()+";";
		int stado = this.ds.update(sql2);
		stado += this.ds.update(sql);
		return stado>=1?1:0;
	}
}
