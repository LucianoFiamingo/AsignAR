package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Notificacion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioNotificacion;

@Repository("repositorioNotificacion")
@Transactional
public class RepositorioNotificacionImpl implements RepositorioNotificacion {

	@Inject
	private SessionFactory session;
	
	
	@Override
	public void registrarNotificacion(Notificacion notificacion) {
		session.getCurrentSession().save(notificacion);
	}

    @SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Notificacion> buscarNotificacionPorId(Usuario usuario) {	
		return session.getCurrentSession().createCriteria(Notificacion.class)
				.add(Restrictions.eq("destinatario", usuario))
				.list();
	}

	@Override
	public Notificacion buscarNotificacionPorSuId(Long id) {
		
		return (Notificacion) session.getCurrentSession().createCriteria(Notificacion.class)
                .add(Restrictions.eq("id", id))
                .uniqueResult();
	}

	@Override
	public List<Notificacion> buscarNotificacionesEnviadasPorUsuario(Usuario usuario) {
		
		return session.getCurrentSession().createCriteria(Notificacion.class)
				.add(Restrictions.eq("remitente", usuario))
				.list();
	}

}
