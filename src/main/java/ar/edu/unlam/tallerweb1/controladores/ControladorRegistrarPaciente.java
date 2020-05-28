package ar.edu.unlam.tallerweb1.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioRegistro;

@Controller
public class ControladorRegistrarPaciente {

	@Autowired
	ServicioRegistro servicioRegistro;

	@RequestMapping("/registroPaciente")
	public ModelAndView registrarPaciente(

			@RequestParam(value = "nombre", required = false) String nombre,
			@RequestParam(value = "apellido", required = false) String apellido,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "password", required = false) String password

	) {

		Paciente paciente = new Paciente();

		paciente.setNombre(nombre);
		paciente.setApellido(apellido);
		paciente.setEmail(email);
		paciente.setPassword(password);

		try {
			servicioRegistro.registrarPaciente(paciente);
		} catch (Exception e) {

			e.printStackTrace();
		}

		String message = "El nombre del paciente es: " + nombre;
		String message2 = "El apellido del paciente es: " + apellido;
		String message3 = "El email ingresado es: " + email;

		ModelMap model = new ModelMap();
		model.put("msg", message);
		model.put("msg2", message2);
		model.put("msg3", message3);

		return new ModelAndView("registroPaciente", model);

	}

}