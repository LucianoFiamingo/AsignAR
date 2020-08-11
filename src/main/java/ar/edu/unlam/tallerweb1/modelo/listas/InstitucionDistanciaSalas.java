package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;

public class InstitucionDistanciaSalas {

	private Institucion institucion;
	private Double distancia;
	private List<SalaCantidad> listaSala;
	
	public InstitucionDistanciaSalas(Institucion institucion, Double distancia, List<SalaCantidad> listaSala) {
		this.institucion = institucion;
		this.distancia = distancia;
		this.listaSala = listaSala;
	}

	public Institucion getInstitucion() {
		return institucion;
	}

	public void setInstitucion(Institucion institucion) {
		this.institucion = institucion;
	}

	public Double getDistancia() {
		return distancia;
	}

	public void setDistancia(Double distancia) {
		this.distancia = distancia;
	}

	public List<SalaCantidad> getListaSala() {
		return listaSala;
	}

	public void setListaSala(List<SalaCantidad> listaSala) {
		this.listaSala = listaSala;
	}
}
