package com.bsummalab.datasource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DataSource {
	private String server = "127.0.0.1";
	private String port = "3306";
	private String dataBase = "bsumma";
	private String user = "admon";
	private String password = "d3s4rr0ll0";
	private String url = "jdbc:mysql://"+this.server+":"+this.port+"/"+this.dataBase;
	private String driver = "com.mysql.jdbc.Driver";
	private Connection conexion = null;
	private ResultSet result = null;
	private int rows = 0;
	//Created Conection
	public DataSource(){
		try {
			Class.forName(this.driver);
			this.conexion =  DriverManager.getConnection(this.url,this.user,this.password);
			//System.out.println("Conexion Realizada");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//SELECT
	public ResultSet query(String sql){
		try {
			PreparedStatement st = this.conexion.prepareStatement(sql);
			this.result = st.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return this.result;
	}
	//INSERT,UPDATE,DELETE
	public int update(String sql){
		try {
			PreparedStatement st = this.conexion.prepareStatement(sql);
			this.rows = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return this.rows;
	}
}
