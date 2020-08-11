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
		
		<form action="" method="GET" role="form"
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

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom">
		<h5 class="">Lista de Instituciones</h5>
				       
	</div>
		<p class="mt-2 mb-4">Datos de la instituciones para solicitar el traslado</p>

		  <div class="table-responsive">
		    <table id="myTable" class="table table-bordered table-hover responsive nowrap text-center">
		        <tr class="bg-white">
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
		            <th style="vertical-align: middle; width: 25%" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';"> 
		            ACCI�N</th>
		        </tr>
		        <c:forEach items="${listaInstituciones}" var="institucion">
		            <tr>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getNombre()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getTipo().getDescripcion()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${Math.round(institucion.getDistancia())} Km"/></td>
		                
		                <td style="vertical-align: middle; text-align:left;">
			                <c:forEach items="${institucion.getListaSala()}" var="lista">
			               		<ul class="my-2">
				               		<c:if test="${lista.getCantidad() >= 5}">
				               		<li class="text-success">
				               		</c:if>
				               		<c:if test="${lista.getCantidad() < 5}">
				               		<li class="text-danger">
				               		</c:if>
					               		<c:out value="${lista.getCantidad()}"/> de
					               		<c:out value="${lista.getSala().getTipoSala().getDescripcion()}"/>.
				               		</li>
							</ul>
			      			</c:forEach>
		                </td>
		               
		                <td style="vertical-align: middle;">

						<!--  <div class="custom-control custom-radio">
						  <input type="radio" id="customRadio${institucion.getInstitucion().getId()}" name="customRadio" class="custom-control-input">
						  <label class="custom-control-label"  for="customRadio${institucion.getInstitucion().getId()}"></label>
						</div>  -->
						
		                <!-- Button trigger modal -->
						<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalCenter${institucion.getInstitucion().getId()}">
						  Solicitar Traslado
						</button>
						
						<button type="button" class="btn btn-outline-primary mt-3">
						  Ver Detalle Instituci�n
						</button>
						
						<!-- Start Modal -->
						<div class="modal fade" id="exampleModalCenter${institucion.getInstitucion().getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle">Solicitud de traslado</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span class="bg-white" aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body text-left">
						        <h6>Se enviar� la solicitud de traslado de la paciente <span class="font-weight-bold"> ${paciente.getNombre()} ${paciente.getApellido()} </span>
						        de documento <span class="font-weight-bold"> ${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().getDescripcion()}) </span>a la siguiente instituci�n:
							    </h6>   
							     
							    <ul class="pl-3 mb-0">
								    <li class="mb-1">Nombre: ${institucion.getInstitucion().getNombre()}.</li>
		               				<li class="mb-1">Disponibilidad de camas: 
							    </ul>
							    
						        <ul class="mb-0">
						        		<c:forEach items="${institucion.getListaSala()}" var="lista">
							               		<c:if test="${lista.getCantidad() >= 5}">
							               		<li class="text-success">
							               		</c:if>
							               		<c:if test="${lista.getCantidad() < 5}">
							               		<li class="text-danger">
							               		</c:if>
								               		${lista.getCantidad()} camas disponibles de
								               		${lista.getSala().getTipoSala().getDescripcion()}
							               		</li>
						      			</c:forEach>
						        </ul>
						        
						        <ul class="pl-3">
								    <li class="mt-1 mb-1">Localidad: ${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()}.</li>
		               				<li class="mb-1">Distancia del traslado: ${Math.round(institucion.getDistancia())} Km.</li>						    
							    </ul>
						        
						        <p>Al apretar el bot�n "Enviar Solicitud" se realizar� el env�o de la solicitud a la instituci�n indicada.</p>
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
		    </table>
		</div>

		<div class="mt-2">
			<button type="" class="btn btn-outline-danger">Cancelar</button>
		</div>
	
		<div class="form-group my-2">
				<c:if test="${not empty error}">
					<h6>
						<span>${error}</span>
					</h6>
					<br>
			</div>
			</c:if>
			

		</form>

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

<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>