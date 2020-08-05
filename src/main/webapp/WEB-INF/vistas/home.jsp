<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>AsignAR</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<h2 class="text-center p-2 mb-4 mt-5 h1">
	<strong>Generar un permiso de circulaci�n</strong>
</h2>

<div class="text-center mt-5 mb-4">
	<img src="img/permit.png" class="rounded" alt="no-virus" width="200"
		height="200">
</div>

<div class="container my-3">
	<div class="form-group">
		<ul class="list-group border border-dark">
			<li
				class="list-group-item list-group-item-warning text-center active"><h4
					class="text-center">�C�mo genero un permiso de circulaci�n?</h4></li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center my-2">
				<h6>Hacer click en el bot�n "Realizar test", ubicado en la
					barra de navegaci�n de esta p�gina.</h6> <span
				class="badge badge-primary badge-pill">1</span>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center my-2">
				<h6>El test debe dar un resultado negativo. De lo contrario, no
					se podr� gestionar un permiso.</h6> <span
				class="badge badge-primary badge-pill">2</span>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center mt-2">
				<h6>Por �ltimo, debe hacer click en el bot�n "Generar permiso",
					ubicado en la barra de navegaci�n de la parte superior de dicha
					p�gina.</h6> <span class="badge badge-primary badge-pill">3</span>
			</li>
		</ul>

	</div>
</div>


<h2 class="text-center p-2 mb-4 mt-5 h1 border-top">
	<strong>Consejos para prevenir el Coronavirus</strong>
</h2>

<div class="container mb-5">
	<div class="row">
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/handwash1.png" width="100"
							height="100" alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">Lavarse las manos con jab�n regularmente
							al menos por 20 segundos</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/nottouch.png" width="100"
							height="100" alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">No llevarse las manos a los ojos y la
							nariz</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/window.png" width="100"
							height="100" alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">Ventilar los ambientes</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/clean.png" width="100" height="100"
							alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">Desinfectar los objetos que se usan con
							frecuencia</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/bat.png" width="100" height="100"
							alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">No comer sopita de murci�lago y/o
							derivados</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/stayhome.png" width="100"
							height="100" alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">Permanecer en su hogar el mayor tiempo
							posible. Salir en casos extremos</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/physical.png" width="100"
							height="100" alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">Mantener distancia de otras personas
							fueras de su hogar</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="container mt-5">
				<div class="row">
					<div class="col-xl-3 col-sm-12">
						<img class="d-inline" src="img/medical-mask.png" width="100"
							height="100" alt="Generic placeholder image">
					</div>
					<div class="col-xl-9 col-sm-12">
						<h4 class="d-inline">Cubrirse la boca y la nariz con barbijo
							o tapaboca al estar rodeado de personas</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<h2 class="text-center p-2 mb-3 mt-5 h1 border-top">
	<strong>El operativo DetectAR presente en los barrios
		bonaerenses</strong>
</h2>


<div class="container-fluid w-50 my-5">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/carrousel1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="img/carrousel2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="img/carrousel3.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="img/carrousel4.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="img/carrousel5.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>

<div class="container-fluid my-5 text-justify">
	<div class="row">
		<div class=col-3></div>
		<div class=col-6>
			<h2 class="text-justify mb-4 mt-4 h4">
				A medida que los casos crecen, extendemos el DetectAR por todo el
				territorio. El objetivo del operativo, es identificar a los <strong>contactos
					estrechos convivientes</strong> de las personas recientemente <strong>confirmadas
					con COVID-19</strong>, hacer un seguimiento sostenido, para distanciarlos
				tempranamente si presentan s�ntomas y de esta forma mitigar la
				contagiosidad del virus.
			</h2>

			<h2 class="text-center my-5 h4">La iniciativa incluye
				hisopadores, y un equipo de salud que lleva adelante una estrategia
				de puerta a puerta en duplas. La b�squeda activa, y la detecci�n
				temprana de persona con s�ntomas es la que m�s ha resultado en el
				mundo junto con el distanciamiento f�sico en pos de la contenci�n de
				la transmisi�n del virus.</h2>

			<h2 class="text-center my-5 h4">
				El <strong>operativo DetectAR</strong> funciona en diferentes
				barrios de la provincia de Buenos Aires, donde est� demostrando
				buenos resultados. En esta nueva etapa se estender� a otros barrios,
				y continuar� seg�n la cantidad de casos registrada.
			</h2>
		</div>
		<div class=col-3></div>
	</div>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!-- Footer -->
<footer
	class="page-footer font-small mdb-color pt-4 bg-whiteborder border-top">

	<!-- Footer Links -->
	<div class="container text-center text-md-left">

		<!-- Footer links -->
		<div class="row text-center text-md-left mt-3 pb-3">

			<!-- Grid column -->
			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3 text-left">
				<h6 class="text-uppercase mb-4 font-weight-bold">asignAR</h6>
				<img src="img/share2.png" width="50" height="50"
					class="d-inline-block align-top" alt="">
			</div>
			<!-- Grid column -->

			<hr class="w-100 clearfix d-md-none">

			<!-- Grid column -->
			<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
				<h6 class="text-uppercase mb-4 font-weight-bold">ENLACES �TILES</h6>
				<p>
					<a href="https://www.argentina.gob.ar/salud/coronavirus-COVID-19">Ministerio
						de Salud</a>
				</p>
				<p>
					<a href="#!">Hospitales y establecimientos de salud</a>
				</p>
			</div>

			<!-- Grid column -->
			<hr class="w-100 clearfix d-md-none">

			<!-- Grid column -->
			<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
				<h6 class="text-uppercase mb-4 font-weight-bold">Tel�fono</h6>
				<p>
					<i class="fas fa-home"></i> Llam� al <strong>120</strong>, es
					gratuito desde cualquier lugar del pa�s y te atienden las 24 horas.
				</p>
				<hr>
				<h6 class="text-uppercase mb-4 font-weight-bold">Whatsapp</h6>
				<i class="fas fa-home"></i> Escrib� "Hola" al <strong>+54 9
					11 2256-0566</strong> para que encuentres respuestas a las preguntas m�s
				frecuentes y recibas consejos de prevenci�n.
				</p>


			</div>
			<!-- Grid column -->

		</div>
		<!-- Footer links -->

		<hr>

		<!-- Grid row -->
		<div class="row d-flex align-items-center">

			<!-- Grid column -->
			<div class="col-md-7 col-lg-8">

				<!--Copyright-->
				<p class="text-center text-md-left">
					� 2020 Copyright: <strong>ASIGNAR</strong>

				</p>

			</div>
			<!-- Grid column -->

			<!-- Grid column -->
			<div class="col-md-5 col-lg-4 ml-lg-0">

				<!-- Social buttons -->
				<div class="text-center text-md-right">
					<ul class="list-unstyled list-inline">
						<li class="list-inline-item"><a
							class="btn-floating btn-sm rgba-white-slight mx-1"> <i
								class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn-floating btn-sm rgba-white-slight mx-1"> <i
								class="fab fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn-floating btn-sm rgba-white-slight mx-1"> <i
								class="fab fa-google-plus-g"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn-floating btn-sm rgba-white-slight mx-1"> <i
								class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>

			</div>
			<!-- Grid column -->

		</div>
		<!-- Grid row -->

	</div>
	<!-- Footer Links -->

</footer>
<!-- Footer -->
</body>

</html>