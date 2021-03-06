package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;

public interface RepositorioSala {

	void registrarSala(Sala sala);

	void actualizarSala(Sala sala);

	Sala buscarSalaPorId(Long id);

	List<Sala> listarSalasPorSector(Sector sector);

	List<SalaCantidad> obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(Institucion institucion);

	List<Sala> listarSalasPorPiso(Piso piso);

	List<Cama> listarCamasOcupadasPorSala(Sala sala);

	List<Cama> listarCamasReservadasPorSala(Sala sala);

	List<Cama> listarCamasDisponiblesPorSala(Sala sala);

}
