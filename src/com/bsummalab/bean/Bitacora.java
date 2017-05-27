package com.bsummalab.bean;

import java.util.LinkedList;

public class Bitacora {
	private Cliente cliente;
	private LinkedList<Servicio> servicios;
	private LinkedList<Equipo> equipos;
	public Bitacora(){
		this.equipos = new LinkedList<Equipo>();
		this.servicios = new LinkedList<Servicio>();
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public LinkedList<Servicio> getServicios() {
		return servicios;
	}
	public void setServicios(Servicio service) {
		this.servicios.add(service);
	}
	public LinkedList<Equipo> getEquipos() {
		return equipos;
	}
	public void setEquipos(Equipo equipo) {
		this.equipos.add(equipo);
	}
}
