package com.bsummalab.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.bsummalab.bean.Bitacora;
import com.bsummalab.bean.Cliente;
import com.bsummalab.datasource.DataSource;

public class DAOBitacora {
	private DataSource ds;
	private ResultSet resultado;
	private int fila;
	
	//Constructor con Inyección de Dependencia
	public DAOBitacora(DataSource dataSource){
		this.ds = dataSource;
	}
	@SuppressWarnings("finally")
	public Bitacora consultarBitacora(Cliente cliente){
		String sql = "SELECT * FROM equipos	LEFT JOIN clientes "
					+ "ON clientes.id = equipos.id_cliente "
					+ "LEFT JOIN servicios_equipos "
					+ "ON servicios_equipos.id_equipo = equipos.id"
					+ "LEFT JOIN servicios "
					+ "ON servicios.id = servicios_equipos.id_servicios "
					+ "where clientes.nombre like '%"+cliente.getNombre()+"%'";
		Bitacora bit = new Bitacora();
		try {
			this.resultado = this.ds.query(sql);
			while(this.resultado.next()){
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			return bit;
		}
	}
}
