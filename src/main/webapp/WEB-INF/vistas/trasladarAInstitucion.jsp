<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Trasladar Paciente</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Trasladar Paciente</h2>

	</div>
		<h6 class="mb-5">Realice la solicitud del traslado del paciente a continuaci�n</h6>
	
	
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom w-25 ">
		<h5 class="">Paciente</h2>
		
	</div>
		<p class="mt-2">Datos del paciente a trasladar</p>
	
  	<div class="">
		
		<form action="enviarSolicitud" method="GET" role="form"
			class="contactForm">

			<div class="form-row d-flex justify-content-between flex-md-nowrap align-items-center pb-2 mb-4">

				<div class="col-lg-1 col-md-2 col-sm-4">								
					
					<label for="" class=""> <svg width="100%"
							height="100%" viewBox="0 0 16 16" class="bi bi-person-circle"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  					  <path
								d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z" />
						  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						  <path fill-rule="evenodd"
								d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z" />
						</svg>
					</label>
				</div>

			<div class="col">

				<div class="">
					<label for="" class="h6 font-weight-bold">${paciente.getApellido()}, ${paciente.getNombre()}</label> 
				</div>
				<div class="">
					<label for="" class="p ">${paciente.getTipoDocumento().name()}: ${paciente.getNumeroDocumento()}</label>
				</div>
				<div class="">
					<label for="" class="p ">${paciente.getEmail()}</label>
				</div>

			</div>
		</div>
		
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom w-25 ">
			<h5 class="">Requisitos</h2>
		</div>
		
		<p class="mt-2">Requisitos necesarios para realizar el traslado</p>
	
		<div class="mt-2">
			<label for="" class="p">Tipo de cama:</label> 
			<span class="p">${tipoCama.getDescripcion()}.</span>
		</div>		
		<div class="">		
			<label for="" class="p">Tipo de sala:</label> 
			<span class="p">${tipoSala.getDescripcion()}.</span>
		</div>		
		<div class="">
			<label for="" class="p">Motivo del traslado:</label> 
			<span class="p">${motivoTraslado.getDescripcion()}.</span>
		</div>		
		<div class="mb-4">
			<label for="" class="p">Urgencia:</label> 
			<span class="p">${urgencia}.</span>
		</div>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom">
		<h5 class="">Lista de Instituciones</h5>
				       
	</div>
		<p class="mt-2 mb-4">Datos de la instituciones para solicitar el traslado</p>

		  <div class="table-responsive">
		    <table id="myTable" class="table table-bordered table-hover responsive nowrap text-center">
		        <tr class="una bg-white">

		            <th style="vertical-align: middle; width: 16%" class="border border-secondary"
		            onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">NOMBRE 
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
					</th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">TIPO 
		             			            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
						</th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">UBICACI�N
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
		            </th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">DISTANCIA
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
		            </th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">DISPONIBILIDAD <br>DE CAMAS
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
		            
		            </th>
		            <th style="vertical-align: middle; width: 20%" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';"> 
		            ACCI�N</th>
		        </tr>
		        
		        <c:forEach items="${listaInstituciones}" var="institucion">
		           
		            <tr 							               		
	               		<c:if test="${institucion.getCamaRequerida() != true || 
	               		institucion.getSalaRequerida() != true }">
		            		class="table-danger"
		               	</c:if>
		            >
		            
		            
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getNombre()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getTipo().getDescripcion()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${Math.round(institucion.getDistancia())} Km"/></td>
		                
		                <td style="vertical-align: middle; text-align:left; width:25%;" class="mx-auto">
			              
			               <div class="d-flex justify-content-center">
			               
			               <div>
			                
			               <c:forEach items="${institucion.getListaSala()}" var="lista" varStatus="loop">
	               			
	               				<c:if test="${institucion.getCamaRequerida()  == true && institucion.getSalaRequerida()  == true
	               				&& lista.getSala().getTipoSala() == tipoSala}">				               				               		
				               		<ul class="my-2 pl-3">
					               		<li
					               		<c:if test="${lista.getCantidad() >= 5}">
					               		class="text-success"
					               		</c:if>
					               		<c:if test="${lista.getCantidad() < 5}">
					               		class="text-danger"
					               		</c:if>
					               		>
						               		<c:out value="${lista.getCantidad()}"/> de
						               		<c:out value="${lista.getSala().getTipoSala().getDescripcion()}"/>.
	
						               		<c:forEach items="${lista.getListaCama()}" var="listaCamas">
							               		<ul class="my-2 pl-3">
							               		
							               		<c:if test="${listaCamas.getCama().tipoCama != tipoCama}">
							               		<li class="p text-dark">
							               		</c:if>
							               		<c:if test="${listaCamas.getCama().tipoCama == tipoCama}">
							               		<li class="p text-dark font-weight-bold">
							               		</c:if>
							               		
								               		${listaCamas.getCama().getTipoCama().getDescripcion()}: ${listaCamas.getCount()}.
							               		</li>
							               		</ul>
					      					</c:forEach>
					      					</li>
									</ul>

				               	</c:if>
							
			      			</c:forEach>

			      			</div>
			      			
			      			</div>
			      			 	
			      			 <p  id="noTiene${institucion.getInstitucion().getId()}"
			               		 class="text-center my-0" style="font-size: 12px;">	
		               		
		               		<c:if test="${institucion.getCamaRequerida() != true && 
		               		institucion.getSalaRequerida() != true }">
			               		
	               					Esta instituci�n <abbr class="font-weight-bold">NO TIENE</abbr> una sala de <abbr class="font-weight-bold">${tipoSala.getDescripcion()}</abbr> 
	               					ni una cama <abbr class="font-weight-bold">${tipoCama.getDescripcion()}</abbr> disponibles.				               	
				               	
				               	</c:if>
		               		<c:if test="${institucion.getCamaRequerida() == true && 
		               		institucion.getSalaRequerida() != true }">

	               					Esta instituci�n <abbr class="font-weight-bold">NO TIENE</abbr> una sala de <abbr class="font-weight-bold">${tipoSala.getDescripcion()}</abbr>
	               					disponible con una cama <abbr class="font-weight-bold">${tipoCama.getDescripcion()}</abbr>.
               					
			               	</c:if>
			               	<c:if test="${institucion.getCamaRequerida() != true && 
               				institucion.getSalaRequerida() == true }">	

				               		Esta instituci�n <abbr class="font-weight-bold">NO TIENE</abbr> una cama <abbr class="font-weight-bold">${tipoCama.getDescripcion()}</abbr> 
				               		disponible en una sala de <abbr class="font-weight-bold">${tipoSala.getDescripcion()}</abbr>.
			             
			               	</c:if>
			               	</p>
			               	
			               	<c:if test="${institucion.getCamaRequerida() != true || 
		               		institucion.getSalaRequerida() != true }">
			               	<div class="d-flex justify-content-center">
			               		 
			               		 <div  id="mostrarInfo${institucion.getInstitucion().getId()}" hidden>
			               		 
			               		 <c:forEach items="${institucion.getListaSala()}" var="lista" varStatus="loop">
	               						               				               		
				               			<ul class="my-2 pl-3">
						               		<li
						               		<c:if test="${lista.getCantidad() >= 5}">
						               		class="text-success"
						               		</c:if>
						               		<c:if test="${lista.getCantidad() < 5}">
						               		class="text-danger"
						               		</c:if>
						               		>
						               		<c:out value="${lista.getCantidad()}"/> de
						               		<c:out value="${lista.getSala().getTipoSala().getDescripcion()}"/>.
	
						               		<c:forEach items="${lista.getListaCama()}" var="listaCamas">
							               		<ul class="my-2 pl-3">
							               		
							               		<c:if test="${listaCamas.getCama().tipoCama != tipoCama}">
							               		<li class="p text-dark">
							               		</c:if>
							               		<c:if test="${listaCamas.getCama().tipoCama == tipoCama}">
							               		<li class="p text-dark font-weight-bold">
							               		</c:if>
							               		
								               	${listaCamas.getCama().getTipoCama().getDescripcion()}: ${listaCamas.getCount()}. 

													<span class="mt-2">
													  <input type="radio" name="opcionCama${institucion.getInstitucion().getId()}" id="activarBotones${institucion.getInstitucion().getId()}" value="${listaCamas.getCama().getId()}"
													  onclick="javascript:activarBotones(this, 'botonAccionUno${institucion.getInstitucion().getId()}', 'botonAccionDos${institucion.getInstitucion().getId()}')">
													</span>
												
							               		</li>
							               		</ul>
					      					</c:forEach>
					      					
					      					</li>
										</ul>
										
			      				</c:forEach>
			      				
			      				</div>
			      				
			               	</div>
			               	
			               	<div class="d-flex justify-content-center">
								<div class="custom-control custom-switch mt-2">
								  <input type="checkbox" class="custom-control-input" id="activarInfo${institucion.getInstitucion().getId()}" 
								  onclick="javascript:mostrarInfo(this, 'noTiene${institucion.getInstitucion().getId()}', 'mostrarInfo${institucion.getInstitucion().getId()}')">
								  <label class="custom-control-label" for="activarInfo${institucion.getInstitucion().getId()}" >Mostrar informaci�n</label>
								</div>
							</div>
							
			      			</c:if>
							
		                </td>
		               
		                <td style="vertical-align: middle;">
						
						<c:if test="${institucion.getCamaRequerida() == true && 
	               		institucion.getSalaRequerida() == true }">
		                
			                <!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#modalSolicitud${institucion.getInstitucion().getId()}">
							  Solicitar Traslado
							</button>
							
							<button type="button" class="btn btn-outline-primary mt-3" data-toggle="modal" data-target="#modalDetalle${institucion.getInstitucion().getId()}">
							  Ver Detalle Instituci�n
							</button>
						
		               	</c:if>	
		               	
		               	<c:if test="${institucion.getCamaRequerida() != true || 
	               		institucion.getSalaRequerida() != true }">
	               			
					  <button id="botonAccionUno${institucion.getInstitucion().getId()}" class="btn btn-outline-secondary" type="button" 
					  data-toggle="modal" data-target="#modalSolicitud${institucion.getInstitucion().getId()}" disabled>
					   Solicitar Traslado</button>
						
					 <button id="botonAccionDos${institucion.getInstitucion().getId()}" class="btn btn-outline-secondary mt-3" type="button" 
					 data-toggle="modal" data-target="#modalDetalle${institucion.getInstitucion().getId()}"disabled>
					  Ver Detalle Instituci�n</button>
					  		
<!-- 							 <div class="d-flex justify-content-center"> -->
<!-- 								<div class="custom-control custom-switch mt-2"> -->
<%-- 								  <input type="checkbox" class="custom-control-input" id="activarBotones${institucion.getInstitucion().getId()}"  --%>
<%-- 								  onclick="javascript:activarBotones(this, 'botonAccionUno${institucion.getInstitucion().getId()}', 'botonAccionDos${institucion.getInstitucion().getId()}')"> --%>
								  
<%-- 								  <label class="custom-control-label" for="activarBotones${institucion.getInstitucion().getId()}" >Activar botones</label> --%>
<!-- 								</div> -->
<!-- 							</div> -->
							
	               		</c:if>	
						
						<!-- Start Modal -->
						<div class="modal fade" id="modalSolicitud${institucion.getInstitucion().getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						    <div class="modal-content  px-3">
						      <div class="modal-header pb-2">
						        <h5 class="modal-title" id="exampleModalLongTitleUno">Solicitud de traslado</h5		>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span class="bg-white" aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body text-left">
						        
						        <p class="p mt-2 mb-4" >
							        Se enviar� la solicitud de traslado del paciente 
						        	<span class="font-weight-bold"> ${paciente.getNombre()} ${paciente.getApellido()} 
						        	(${paciente.getTipoDocumento().getDescripcion()}: ${paciente.getNumeroDocumento()}) </span> 
							        en una cama <span class="font-weight-bold text-lowercase">${tipoCama.getDescripcion()}</span> 
							        en una sala de <span class="font-weight-bold text-lowercase">${tipoSala.getDescripcion()}</span>
							        de la instituci�n 
							        <span class="font-weight-bold">"${institucion.getInstitucion().getNombre()}"</span>
							        ubicada en la localidad de ${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()} 
							        a ${Math.round(institucion.getDistancia())} km de distancia.
							    </p>   

						        <p class="mb-0 font-weight-lighter">Una vez autorizada la solicitud enviada, podr� realizar el traslado.</p>
						      </div>
						      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Volver</button>
						        <button type="submit" class="btn btn-outline-success">Enviar Solicitud</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- End Modal -->
						
						</td>

		            </tr>
		        </c:forEach>
		        
		</form>
		
		    </table>
		</div>

		<div class="col-xl-3 col-lg-5 col-md-8 col-sm-12">	
			
			<div class="row d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
				
				<div class="mr-4">
	
					<div class="">
					<a href="trasladar?idPaciente=${paciente.getId()}">
						<button type="button" class="btn btn-outline-primary">
						Volver atr�s</button>
					</a>
					</div>
	
				</div>
				
				<div class="">
				
				<a href="">
					<button type="button" class="btn btn-outline-danger">
					Cancelar</button>
				</a>
					
				</div>
			
			</div>
		</div>
	
		<div class="form-group my-2">
				<c:if test="${not empty error}">
					<h6>
						<span>${error}</span>
					</h6>
					<br>
			</div>
			</c:if>


	</div>
</div>


</main>


</div>
</div>

<script>
	window.jQuery
			|| document
					.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
</script>

<script src="js/funciones.js"></script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>