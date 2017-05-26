package com.bsummalab.bean;

import java.util.LinkedList;

public class Bitacora {
	private Cliente cliente;
	private LinkedList<Servicio> servicios;
	private LinkedList<Equipo> equipos;
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public LinkedList<Servicio> getServicios() {
		return servicios;
	}
	public void setServicios(LinkedList<Servicio> servicios) {
		this.servicios = servicios;
	}
	public LinkedList<Equipo> getEquipos() {
		return equipos;
	}
	public void setEquipos(LinkedList<Equipo> equipos) {
		this.equipos = equipos;
	}
}
