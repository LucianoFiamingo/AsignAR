package ar.edu.unlam.tallerweb1.controladores;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Domicilio;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Localidad;
import ar.edu.unlam.tallerweb1.modelo.Notificacion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Partido;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.TipoDocumento;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionPaciente;
import ar.edu.unlam.tallerweb1.modelo.listas.UsuarioDistancia;
import ar.edu.unlam.tallerweb1.servicios.ServicioAsignacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioDomicilio;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioLocalidad;
import ar.edu.unlam.tallerweb1.servicios.ServicioMail;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioPartido;
import ar.edu.unlam.tallerweb1.servicios.ServicioPiso;
import ar.edu.unlam.tallerweb1.servicios.ServicioTest;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

@Controller
public class ControladorPaciente {

	@Autowired
	ServicioMail servicioMail;
	@Autowired
	ServicioPaciente servicioPaciente;
	@Autowired
	ServicioCama servicioCama;
	@Autowired
	ServicioAtajo servicioAtajo;
	@Autowired
	ServicioUsuario servicioUsuario;
	@Autowired
	ServicioDomicilio servicioDomicilio;
	@Autowired
	ServicioLocalidad servicioLocalidad;
	@Autowired
	ServicioPartido servicioPartido;
	@Autowired
	ServicioTest servicioTest;
	@Autowired
	ServicioInstitucion servicioInstitucion;
	@Autowired
	ServicioMapa servicioMapa;
	@Autowired
	ServicioAsignacion servicioAsignacion;
	@Autowired
	ServicioPiso servicioPiso;

	/* Pantalla de bienvenido al paciente cuando inicia sesi�n */
	@RequestMapping("bienvenidoPaciente")
	public ModelAndView irAbienvenido(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (Long) request.getSession().getAttribute("ID");
		if (servicioPaciente.consultarPacientePorId(id) == null) {
			return new ModelAndView("redirect:/login");
		}
		Paciente paciente = servicioPaciente.consultarPacientePorId(id);
		String nombre = paciente.getNombre();
		Long idPaciente = paciente.getId();

		model.put("nombre", nombre);

		if (request.getSession().getAttribute("ID") != null) {
			model.put("idPaciente", idPaciente);
		} else {
			model.put("idPaciente", -1);
		}

		return new ModelAndView("bienvenidoPaciente", model);
	}

	@RequestMapping("/registrarPaciente")
	public ModelAndView registrarPaciente(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("registrarPaciente", model);
	}

	@RequestMapping("/detalleRegistroPaciente")
	public ModelAndView validarRegistroPaciente(

			@ModelAttribute("paciente") Paciente paciente, HttpServletRequest request) {

		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		if (paciente == null) {
			return new ModelAndView("redirect:/denied");
		}

		if (servicioUsuario.consultarUsuarioPorEmail(paciente.getEmail()) == null && servicioPaciente
				.consultarPacientePorDoc(paciente.getNumeroDocumento(), paciente.getTipoDocumento()) == null) {

			paciente.setPosibleInfectado(true);
			paciente.setRol(Rol.PACIENTE);

			servicioPaciente.registrarPaciente(paciente);

			String nombre = paciente.getNombre();
			String documento = paciente.getNumeroDocumento();
			String email = paciente.getEmail();
			TipoDocumento tipoDocumento = paciente.getTipoDocumento();

			Paciente pacienteBuscado = servicioPaciente.consultarPacientePorDoc(documento, tipoDocumento);

			request.getSession().setAttribute("ID_PACIENTE", pacienteBuscado.getId());

			model.put("nombre", nombre);
			model.put("documento", documento);
			model.put("tipoDocumento", tipoDocumento);
			model.put("email", email);

			String path = "http://localhost:" + request.getLocalPort();
			servicioMail.SendEmail(paciente.getEmail(), "Confirmacion de registro: asignar: " + paciente.getNombre(),
					path, pacienteBuscado);

			return new ModelAndView("enfermedades", model);
		} else {

			model.put("error", "Ya existe un usuario registrado con su mail o documento");

			return new ModelAndView("registrarPaciente", model);
		}
	}

	@RequestMapping("/registrarPacienteEnfermedades")
	public ModelAndView registrarPacienteEnfermedades(

			@ModelAttribute("paciente") Paciente paciente, HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		if (paciente == null) {
			return new ModelAndView("redirect:/denied");
		}

		if (servicioUsuario.consultarUsuarioPorEmail(paciente.getEmail()) != null && servicioPaciente
				.consultarPacientePorDoc(paciente.getNumeroDocumento(), paciente.getTipoDocumento()) != null) {

			model.put("error", "Ya existe un usuario registrado con su mail o documento");

			return new ModelAndView("registrarPaciente", model);
		}

		paciente.setRol(Rol.PACIENTE);
		servicioPaciente.registrarPaciente(paciente);

		Paciente pacienteBuscado = servicioPaciente.consultarPacientePorId(paciente.getId());

		model.put("paciente", paciente);

		String path = "http://localhost:" + request.getLocalPort();
		servicioMail.SendEmail(paciente.getEmail(), "Confirmación de registro: AsignAr: " + paciente.getNombre(), path,
				pacienteBuscado);

		return new ModelAndView("registrarPacienteEnfermedades", model);
	}

	/* Consultar paciente por Nro y Tipo de Documento */
	@RequestMapping("/consultarPaciente")
	public ModelAndView consultarPaciente(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Paciente paciente = new Paciente();
		
		
		model.put("paciente", paciente);

		return new ModelAndView("consultarPaciente", model);
	}

	
	@RequestMapping(path = "/detalle", method = RequestMethod.GET)
	public ModelAndView validarConsulta(

			@RequestParam (value="id") Long id, HttpServletRequest request,
			@RequestParam (value="reservaBool", required=false)Boolean reservaBool) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Paciente paciente = servicioPaciente.consultarPacientePorId(id);
		
		Asignacion reserva=servicioAsignacion.consultarReservaAsignacionPaciente(paciente);
		Asignacion asignacionActual=servicioAsignacion.consultarAsignacionPacienteInternado(paciente);
		
		Long idInstitucion = (Long)request.getSession().getAttribute("ID");
		Institucion i= servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		model.put("paciente", paciente);
		List<String> listaEnfermedades = servicioPaciente.obtenerListaDeEnfermedadesDeUnPaciente(paciente);
		model.put("listaEnfermedades", listaEnfermedades);
		model.put("reserva" ,reserva);
		model.put("asignacion" ,asignacionActual);
		
		if (reserva != null) {
			if (reserva.getCama().getSala().getSector().getPiso().getInstitucion() != i) {
				model.put("detalleVista", "detallePaciente");
//				model.put("error", "No existe el usuario buscado");
				return new ModelAndView("detalle", model);
			}
		}
		
		if (asignacionActual != null) {
			if (asignacionActual.getCama().getSala().getSector().getPiso().getInstitucion() != i) {

				model.put("detalleVista", "detallePaciente");
//				model.put("error", "No existe el usuario buscado");

				return new ModelAndView("detalle", model);
			}
		}
		
		
		if(reservaBool==null) {
			if(asignacionActual==null && reserva==null) {
				
				
				model.put("detalleVista", "detallePaciente");
				model.put("error", "No existe el usuario buscado");

				return new ModelAndView("consultarPaciente", model);
			}
		}
		
		if (paciente != null) {

			model.put("paciente", paciente);
			model.put("detalleVista", "detallePaciente");
			model.put("reserva", reserva );
			model.put("asignacion",asignacionActual);

			return new ModelAndView("detalle", model);
		}

		model.put("error", "No existe el paciente");

		return new ModelAndView("consultarPaciente", model);
	}

	@RequestMapping("/listaPacientes")
	public ModelAndView pacientes(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> pacientes = servicioPaciente.pacientes();

		model.put("listaPacientes", pacientes);

		return new ModelAndView("listaPacientes", model);
	}

	@RequestMapping("/grafico-pacientes")
	public ModelAndView graficoPacientes(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Integer cantidadPacientes = servicioPaciente.pacientes().size();
		Integer cantidadPacientesInfectados = servicioPaciente.pacientesInfectados().size();
		Integer cantidadPacientesNoInfectados = cantidadPacientes - cantidadPacientesInfectados;

		model.put("cantidadPacientes", cantidadPacientes);
		model.put("cantidadPacientesInfectados", cantidadPacientesInfectados);
		model.put("cantidadPacientesNoInfectados", cantidadPacientesNoInfectados);

		Integer cantidadCamasReservadas = 0;
		Integer cantidadCamasOcupadas = 0;
		Integer cantidadCamasDisponibles = 0;
		
		if (rol == Rol.INSTITUCION) {

			Long id = (Long) request.getSession().getAttribute("ID");
			Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(id);
			List<Piso> pisosInstitucion = servicioPiso.listarPisosPorInstitucion(institucion);

			for (Piso piso : pisosInstitucion) {
				cantidadCamasReservadas += servicioCama.listarCamasReservadasPorPiso(piso).size();
				cantidadCamasDisponibles += servicioCama.listarCamasDisponiblesPorPiso(piso).size();
				cantidadCamasOcupadas += servicioCama.listarCamasOcupadasPorPiso(piso).size();
			}

		}

		if (rol == Rol.ADMIN) {
 
			cantidadCamasOcupadas = servicioCama.obtenerTotalDeCamasOcupadas().size();
			cantidadCamasDisponibles = servicioCama.obtenerTotalDeCamasDisponibles().size();
			Integer totalCamas = servicioCama.obtenerCamas().size();
			cantidadCamasReservadas = totalCamas - (cantidadCamasOcupadas + cantidadCamasDisponibles);

		}

		model.put("cantidadCamasOcupadas", cantidadCamasOcupadas);
		model.put("cantidadCamasDisponibles", cantidadCamasDisponibles);
		model.put("cantidadCamasReservadas", cantidadCamasReservadas);

		return new ModelAndView("grafico-pacientes", model);
	}

	@RequestMapping("/mapa-paciente")
	public ModelAndView mapaPaciente(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("detalleRegistroPaciente", model);
	}

	@RequestMapping("/posiblesinfectados")
	public ModelAndView posiblesinfectados(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> posiblesInfectados = servicioPaciente.posiblesInfectados();

		Boolean admin = false;
		if (request.getSession().getAttribute("ROL") == Rol.ADMIN) {
			admin = true;
		}
		
		List<AsignacionPaciente> listaPosiblesInfectadosConReserva = new ArrayList<AsignacionPaciente>();

		for (Paciente paciente : posiblesInfectados) {

			AsignacionPaciente asignacionPaciente = new AsignacionPaciente();
			
			asignacionPaciente.setEnfermedades(servicioPaciente.obtenerListaDeEnfermedadesDeUnPaciente(paciente));
			asignacionPaciente.setPaciente(paciente);
			
			Asignacion asignacionReservada = servicioAsignacion.consultarReservaAsignacionPaciente(paciente);
			if (asignacionReservada != null) {
				asignacionPaciente.setAsignacion(asignacionReservada);
			}

			listaPosiblesInfectadosConReserva.add(asignacionPaciente);
		}

		model.put("posiblesInfectados", listaPosiblesInfectadosConReserva);
		model.put("admin", admin);

		return new ModelAndView("posiblesinfectados", model);
	}

	@RequestMapping("/listaPacientesInfectados")
	public ModelAndView listaPacientesInfectados(

			HttpServletRequest request

	) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> listaPacientesInfectados = servicioPaciente.pacientesInfectados();

		model.put("listaPacientesInfectados", listaPacientesInfectados);

		return new ModelAndView("listaPacientesInfectados", model);
	}

	@RequestMapping("/listaPacientesInfectadosPasoDos")
	public ModelAndView listaPacientesInfectadosPasoDos(

			@RequestParam(value = "idCama") Long idCama, HttpServletRequest request

	) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Cama cama = servicioCama.consultarCamaPorId(idCama);
		List<Paciente> listaPacientesInfectados = servicioPaciente.pacientesInfectados();

		model.put("cama", cama);
		model.put("listaPacientesInfectados", listaPacientesInfectados);

		return new ModelAndView("listaPacientesInfectadosPasoDos", model);
	}

	@RequestMapping("/listaPacientesInternados")
	public ModelAndView listaPacientesInternados(

			HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> listaPacientesInternadosSinReserva = new ArrayList<Paciente>();

		if (request.getSession().getAttribute("ROL") == Rol.ADMIN) {
			listaPacientesInternadosSinReserva = servicioPaciente.pacientesInternados();
		}

		if (request.getSession().getAttribute("ROL") == Rol.INSTITUCION) {
			Long id = (long) request.getSession().getAttribute("ID");
			listaPacientesInternadosSinReserva = servicioPaciente.pacientesInternadosPorInstitucion(id);
		}

		Boolean admin = false;
		if (request.getSession().getAttribute("ROL") == Rol.ADMIN) {
			admin = true;
		}

		List<AsignacionDoble> listaPacientesInternadosConReserva = new ArrayList<AsignacionDoble>();

		for (Paciente paciente : listaPacientesInternadosSinReserva) {

			AsignacionDoble asignacionDoble = new AsignacionDoble();

			asignacionDoble.setAsignacionActual(servicioAsignacion.consultarAsignacionPacienteInternado(paciente));
			asignacionDoble.setEnferemedades(servicioPaciente.obtenerListaDeEnfermedadesDeUnPaciente(paciente));;
			
			Asignacion asignacionReservada = servicioAsignacion.consultarReservaAsignacionPaciente(paciente);
			if (asignacionReservada != null) {

				asignacionDoble.setAsignacionReservada(asignacionReservada);
			}

			listaPacientesInternadosConReserva.add(asignacionDoble);
		}

		model.put("admin", admin);
		model.put("listaPacientesInternados", listaPacientesInternadosConReserva);

		return new ModelAndView("listaPacientesInternados", model);
	}

	@RequestMapping("/listaPacientesInternadosDeInstitucion")
	public ModelAndView listaPacientesInternadosDeInstitucion(

			HttpServletRequest request, @RequestParam(value = "idInstitucion") Long idInstitucion) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> listaPacientesInternadosDeInstitucion = new ArrayList<Paciente>();

		listaPacientesInternadosDeInstitucion = servicioPaciente.pacientesInternadosPorInstitucion(idInstitucion);

		model.put("listaPacientesInternados", listaPacientesInternadosDeInstitucion);

		return new ModelAndView("listaPacientesInternadosDeInstitucion", model);
	}

	@RequestMapping("/listapacientes2")
	public ModelAndView listapacientes2(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> pacientes = servicioPaciente.pacientes();

		model.put("listaPacientes", pacientes);

		return new ModelAndView("listapacientes2", model);
	}

	@RequestMapping("/pacienteDistancia")
	public ModelAndView pacienteDistancia(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (long) request.getSession().getAttribute("ID");
		Usuario usuario = servicioUsuario.consultarUsuarioPorId(id);

		List<UsuarioDistancia> listaUsuarioDistancia = servicioMapa.calcularDistanciaDeUsuarioAInsituciones(usuario);

		model.put("listaInstituciones", listaUsuarioDistancia);

		return new ModelAndView("pacienteDistancia", model);
	}

	//////////////////////////////////////////
	// Acceder y Modificar Datos De Usuario
	//////////////////////////////////////////
	@RequestMapping("/MisDatos")
	public ModelAndView verMisDatos(HttpServletRequest request) {
		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (long) request.getSession().getAttribute("ID");

		Usuario usuario = servicioUsuario.consultarUsuarioPorId(id);
		model.put("usuario", usuario);

		return new ModelAndView("MisDatos", model);
	}

	@RequestMapping(path = "/guardarCambios")
	public ModelAndView guardarCambios(@RequestParam(value = "mail", required = false) String mail,
			@RequestParam(value = "contrasenia", required = false) String contrasenia,
			@RequestParam(value = "contraseniaNueva", required = false) String contraseniaNueva,
			@RequestParam(value = "contraseniaNuevaRepetida", required = false) String contraseniaNuevaRepetida,
			@RequestParam(value = "latitud", required = false) Double latitud,
			@RequestParam(value = "latitud", required = false) Double longitud,
			@RequestParam(value = "calle", required = false) String calle,
			@RequestParam(value = "numero", required = false) Integer numero,
			@RequestParam(value = "nombreLocalidad", required = false) String nombreLocalidad,
			@RequestParam(value = "nombrePartido", required = false) String nombrePartido, HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (long) request.getSession().getAttribute("ID");

		Usuario usuario = servicioUsuario.consultarUsuarioPorId(id);

		if (mail != null) {
			usuario.setEmail(mail);
		}

		if (contrasenia != null && contraseniaNueva != null && contraseniaNuevaRepetida != null) {

			if (contrasenia == usuario.getPassword() && contraseniaNueva == contraseniaNuevaRepetida) {
				usuario.setPassword(contraseniaNueva);
			}
		}

		if (latitud != null) {

			usuario.setLatitud(latitud);
			usuario.setLongitud(longitud);

			Partido partido = new Partido();

			if (servicioPartido.obtenerPartidoPorNombre(nombrePartido) != null) {
				partido = servicioPartido.obtenerPartidoPorNombre(nombrePartido);
			} else {
				partido.setNombrePartido(nombrePartido);
				servicioPartido.registrarPartido(partido);
			}

			Localidad localidad = new Localidad();

			if (servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad) != null) {
				localidad = servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad);
			} else {
				localidad.setNombreLocalidad(nombreLocalidad);
				localidad.setPartido(partido);
				servicioLocalidad.registrarLocalidad(localidad);
			}

			Domicilio domicilio = usuario.getDomicilio();

			domicilio.setCalle(calle);
			domicilio.setNumero(numero);
			domicilio.setLocalidad(localidad);

			servicioDomicilio.actualizarDomicilio(domicilio);

			usuario.setDomicilio(domicilio);

		}
		
		request.getSession().removeAttribute("MAIL");
		request.getSession().setAttribute("MAIL", usuario.getEmail());
		servicioUsuario.actualizarUsuario(usuario);

		return new ModelAndView("redirect:/MisDatos");
	}

	@RequestMapping("/fichaInstitucion")
	public ModelAndView fichaInstitucion(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("fichaInstitucion", model);
	}

	/* ----- Getters and Setters ----- */
	public ServicioPaciente getServicioPaciente() {
		return servicioPaciente;
	}

	public void setServicioPaciente(ServicioPaciente servicioPaciente) {
		this.servicioPaciente = servicioPaciente;
	}

	public ServicioCama getServicioCama() {
		return servicioCama;
	}

	public void setServicioCama(ServicioCama servicioCama) {
		this.servicioCama = servicioCama;
	}

	public ServicioLocalidad getServicioLocalidad() {
		return servicioLocalidad;
	}

	public void setServicioLocalidad(ServicioLocalidad servicioLocalidad) {
		this.servicioLocalidad = servicioLocalidad;
	}

	public ServicioMail getServicioMail() {
		return servicioMail;
	}

	public void setServicioMail(ServicioMail servicioMail) {
		this.servicioMail = servicioMail;
	}

	public ServicioAtajo getServicioAtajo() {
		return servicioAtajo;
	}

	public void setServicioAtajo(ServicioAtajo servicioAtajo) {
		this.servicioAtajo = servicioAtajo;
	}

	public ServicioUsuario getServicioUsuario() {
		return servicioUsuario;
	}

	public void setServicioUsuario(ServicioUsuario servicioUsuario) {
		this.servicioUsuario = servicioUsuario;
	}

	public ServicioDomicilio getServicioDomicilio() {
		return servicioDomicilio;
	}

	public void setServicioDomicilio(ServicioDomicilio servicioDomicilio) {
		this.servicioDomicilio = servicioDomicilio;
	}

	public ServicioPartido getServicioPartido() {
		return servicioPartido;
	}

	public void setServicioPartido(ServicioPartido servicioPartido) {
		this.servicioPartido = servicioPartido;
	}

	public ServicioTest getServicioTest() {
		return servicioTest;
	}

	public void setServicioTest(ServicioTest servicioTest) {
		this.servicioTest = servicioTest;
	}

	public ServicioInstitucion getServicioInstitucion() {
		return servicioInstitucion;
	}

	public void setServicioInstitucion(ServicioInstitucion servicioInstitucion) {
		this.servicioInstitucion = servicioInstitucion;
	}
}
