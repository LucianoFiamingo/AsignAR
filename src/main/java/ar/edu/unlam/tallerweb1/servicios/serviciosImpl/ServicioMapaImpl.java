package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;

@Service("servicioMapa")
@Transactional
public class ServicioMapaImpl implements ServicioMapa {

	@Autowired
	ServicioInstitucion servicioInstitucion;

	@Override
	public Double calcularDistanciaEntreDosPuntos(Double latitud1, Double longitud1, Double latitud2,
			Double longitud2) {

		double radioTierra = 6371;// en kilómetros
		double dLat = Math.toRadians(latitud2 - latitud1);
		double dLng = Math.toRadians(longitud2 - longitud1);
		double sindLat = Math.sin(dLat / 2);
		double sindLng = Math.sin(dLng / 2);
		double va1 = Math.pow(sindLat, 2)
				+ Math.pow(sindLng, 2) * Math.cos(Math.toRadians(latitud1)) * Math.cos(Math.toRadians(latitud2));
		double va2 = 2 * Math.atan2(Math.sqrt(va1), Math.sqrt(1 - va1));
		double distancia = radioTierra * va2;

		return distancia;
	}

	@Override
	public Institucion calcularInstitucionMasCercana(Paciente paciente) {

		return null;
	}

}
