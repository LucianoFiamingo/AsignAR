package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public interface RepositorioSector {

	void registrarSector(Sector sector);

	void actualizarSector(Sector sector);

	Sector buscarSectorPorId(Long id);

	List<Sector> consultarSectoresPorPiso(Piso piso);
	
	

}
