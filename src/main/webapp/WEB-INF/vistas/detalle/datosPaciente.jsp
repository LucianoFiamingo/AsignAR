
        
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">


            <div class="container">
            
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h4 class="h4">Mis Datos</h4>
            </div>

                <div>

				<h6>Nombre del Paciente: ${paciente.getApellido()}, ${paciente.getNombre()}</h6>
			
				<h6 class="">Documento: ${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().name()})</h6>
			
				<h6 class="">Correo electr�nico: ${paciente.getEmail()}</h6>

                    <br>

                   

                  

                    <a href="consultarPaciente" class="btn btn-sm btn-outline-secondary">Volver atr�s</a>
                    
                    <a href="bienvenido" class="btn btn-sm btn-outline-secondary">Inicio</a>

                </div>


                <div class="form-group">

                   

            </div>
    </div>


    </main>
    
