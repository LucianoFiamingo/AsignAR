package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Zona;

import java.util.List;


public interface RepositorioInstitucion {

    Institucion consultarInstitucionPorCuit(String numeroCuit);

    List<Institucion> obtenerListaInstituciones();

	Institucion obtenerInstitucionPorId(Long id);

    void actualizarInstitucion(Institucion institucion);

//    List<Institucion> listarInstitucionesPorZona(Zona zona);
}
