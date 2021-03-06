package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;

public class AsignacionDoble {
	
	private Asignacion asignacionActual;
	private Asignacion asignacionReservada;
	private Double distancia;
	private List<String> enfermedades;
	
	public AsignacionDoble(Asignacion asignacionActual, Asignacion asignacionReservada) {
		this.asignacionActual = asignacionActual;
		this.asignacionReservada = asignacionReservada;
	}
	
	public AsignacionDoble(Asignacion asignacionActual) {
		this.asignacionActual = asignacionActual;
	}

	public AsignacionDoble() {
	}

	public Asignacion getAsignacionActual() {
		return asignacionActual;
	}
	public void setAsignacionActual(Asignacion asignacionActual) {
		this.asignacionActual = asignacionActual;
	}
	public Asignacion getAsignacionReservada() {
		return asignacionReservada;
	}
	public void setAsignacionReservada(Asignacion asignacionReservada) {
		this.asignacionReservada = asignacionReservada;
	}

	public Double getDistancia() {
		return distancia;
	}

	public void setDistancia(Double distancia) {
		this.distancia = distancia;
	}

	public List<String> getEnfermedades() {
		return enfermedades;
	}

	public void setEnferemedades(List<String> enfermedades) {
		this.enfermedades = enfermedades;
	}

}
