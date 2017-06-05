package com.bsummalab.bean;
//Bean
public class Usuario {
	private int id;
	private String usuario;
	private String contrasena;
	private String perfil;
	private String nombre;
	private String correo;
	private String telefono;
	public Usuario(){
		
	}
	public Usuario(String user,String password){
		this.usuario = user;
		this.contrasena = password;
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public String getNombre() {
		return this.nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
