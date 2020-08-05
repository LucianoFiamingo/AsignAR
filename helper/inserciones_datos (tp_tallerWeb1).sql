/*------- ELIMINACION --------*/

SET sql_safe_updates=0;
DELETE FROM notificacion;
DELETE FROM asignacion;
DELETE FROM cama;
DELETE FROM sala;
DELETE FROM sector;
DELETE FROM piso;
DELETE FROM usuario;
DELETE FROM domicilio;
DELETE FROM localidad;
DELETE FROM partido;
DELETE FROM provincia;
DELETE FROM zona;

/*----- INSERCION-------*/

INSERT INTO provincia (id, nombreProvincia)
VALUES (1, "BUENOS_AIRES"),
	   (2, "CORDOBA"),
       (3, "SANTA_FE");

       INSERT INTO zona(id, nombre)
VALUES (1, "Zona norte"),
	   (2, "Zona oeste"),
       (3, "Zona sur");

INSERT INTO partido (id, nombrePartido ,provincia_id)
VALUES (1, "Vicente López", 1),
	   (2, "San Isidro", 1),
       (3, "San Fernando", 1),
       (4, "Tigre", 1),
       (5, "Morón", 1),
       (6, "Hurlingham", 1),
       (7, "Ituzaingó", 1),
       (8, "Moreno", 1),
       (9, "La Matanza", 1),
       (10, "Avellaneda", 1),
       (11, "Lomas de Zamora", 1),
       (12, "Ezeiza", 1),
       (13, "Florencio Varela", 1);

INSERT INTO localidad (id, nombreLocalidad, partido_id, zona_id)
VALUES (1,"Vicente López", 1, 1),
	   (2, "Villa Martelli", 1, 2),
	   (3, "Munro", 1, 3),
       (4, "Martínez", 2, 2),
       (5, "San Isidro", 2, 1),
       (6, "Beccar", 2, 1),
       (7, "Victoria", 3, 2),
       (8, "Tigre", 4, 1),
       (9, "General Pacheco", 4, 1),
       (10, "Don Torcuato", 4, 3),
       (11, "Villa Sarmiento", 5, 3),
       (12, "El Palomar", 5, 2),
       (13, "Haedo", 5, 2),
       (14, "Morón", 5, 2),
       (15, "Castelar", 5, 2),
       (16, "Hurlingham", 6, 3),
       (17, "William C. Morris", 6, 3),
       (18, "Ituzaingó", 7, 2),
       (19, "Udaondo", 7, 3),
       (20, "Trujui", 8, 3),
       (21, "Paso del Rey", 8, 2),
       (22, "Moreno", 8, 2),
       (23, "La Reja", 8, 2),
       (24, "Lomas del Mirador", 9, 2),
       (25, "La Tablada", 9, 2),
       (26, "Isidro Casanova", 9, 2),
       (27, "Gregorio de Laferrere", 9, 2),
       (28, "San Justo", 9, 2),
       (29, "Wilde", 10, 3),
       (30, "Valentín Alsina", 10, 3),
       (31, "Villa Fiorito", 11, 3),
       (32, "Banfield", 11, 3),
       (33, "José María Ezeiza", 12, 2),
       (34, "Canning", 12, 2),
       (35, "Carlos Spegazzini", 12, 3);

INSERT INTO domicilio(id, calle, numero, localidad_id)
VALUES (1, "Las Heras", 1200, 1),
	   (2, "Los Arcos", 3300, 1),
	   (3, "Peribebuy", 450, 6),
	   (4, "Ingeniero Huergo", 1550, 6),
       (5, "Hipólito Yrigoyen", 1650, 4),
       (6, "Pilar", 950, 6),
       (7, "Av. Rivadavia", 17961, 5),
       (8, "Solís", 463, 5);

/* ----- ADMIN ----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, email, password, numeroDocumento, tipoDocumento, cantidadCamas, domicilio_id)
VALUES ("ADMIN", "Institucion", 1, "Operadora Central 1", "admin@email.com", "1234", "20100041007", "CUIT", null, 1);

/* ----- HOSPITAL ----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, email, password, numeroDocumento, tipoDocumento, cantidadCamas, tipo, domicilio_id,latitud,longitud)
VALUES ("INSTITUCION", "Institucion", 2, "Fundación Favaloro", "favaloro@email.com", "1234","20200020007", "CUIT", 40, "HOSPITAL", 2,-34.70211051937402,-52.70211051937402),
       ("INSTITUCION", "Institucion", 3, "Hospital Italiano De Morón", "hospital_italiano_moron@email.com", "1234","20300030007", "CUIT", 65, "HOSPITAL", 7,-35.70211051937402,-54.70211051937402),
       ("INSTITUCION", "Institucion", 4, "Hospital Donación Francisco Santojanni", "santojanni@email.com", "1234","20400040007", "CUIT", 57, "HOSPITAL", 6,-33.70211051937402,-55.70211051937402),
       ("INSTITUCION", "Institucion", 5, "Hospital Profesor Doctor Ramón Carrillo", "carillo@email.com", "1234", "20500050007", "CUIT", 57, "HOSPITAL", 5,-36.70211051937402,-54.90211051937402);

/* ----- PACIENTE AUTOTEST POSITIVOS----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, apellido, email, password, numeroDocumento, tipoDocumento, domicilio_id, posibleInfectado, infectado, prioridad, edad, latitud, longitud)
VALUES("PACIENTE", "Paciente", 6, "Alejandro", "Rodriguez", "alejandro@email.com", "1234", "1", "DNI", 2, true, null, 1, 45, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 7, "Alejandra", "Rodriguez", "alejandra@email.com", "1234", "2", "DNI", 3, true, null, 2, 87, -34.72840647959868, -58.61369019379556),
	  ("PACIENTE", "Paciente", 8, "Alan", "Rodriguez", "alan@email.com", "1234", "3", "DNI", 4, true, null, 2, 54, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 9, "Ana", "Rodriguez", "ana@email.com", "1234", "4", "DNI", 3, true, null, 4, 64, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 10, "Carlos", "Gómez", "carlos@email.com", "1234", "32100100", "DNI", 3, true, null, 5, 54, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 11, "Carla", "Gómez", "carla@email.com", "1234", "32110100", "DNI", 3, true, null, 1, 88, -34.72840647959868, -58.61369019379556);
      
/* ----- PACIENTE INFECTADOS HISOPADO----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, apellido, email, password, numeroDocumento, tipoDocumento, domicilio_id, posibleInfectado, infectado, prioridad, edad, latitud, longitud)
VALUES("PACIENTE", "Paciente", 12, "Cristian", "Gómez", "cristian@email.com", "1234", "32120100", "DNI", 3, null, true, 4, 65, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 13, "Celeste", "Gómez", "celeste@email.com", "1234", "32130100", "DNI", 1, null, true, 3, 32, -34.72840647959868, -58.61369019379556),
	  ("PACIENTE", "Paciente", 14, "Dario", "García", "dario@email.com", "1234", "32140100", "DNI", 2, null, true, 2, 32, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 15, "Danila", "García", "danila@email.com", "1234", "32150100", "DNI", 3, null, true, 1, 65, -34.72840647959868, -58.61369019379556),
	  ("PACIENTE", "Paciente", 16, "Daniel", "García", "daniel@email.com", "1234", "32106100", "DNI", 4, null, false, 2, 97, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 17, "Daniela", "García", "daniela@email.com", "1234", "32160100", "DNI", 3, null, true, 3, 45, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 18, "Fabricio", "García", "fabricio@email.com", "1234", "32170100", "DNI", 1, null, true, 4, 64, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 19, "Fabián", "García", "fabian@email.com", "1234", "32108100", "PASAPORTE", 1, null, true, 5, 97, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 20, "Fabiana", "Garcia", "email12_pac@email.com", "1234", "16", "PASAPORTE", 3, null, true, 3, 45, -34.72840647959868, -58.61369019379556);

/* ----- PACIENTE PARA INTERNAR----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, apellido, email, password, numeroDocumento, tipoDocumento, domicilio_id, posibleInfectado, infectado, prioridad, edad, latitud, longitud)
VALUES("PACIENTE", "Paciente", 21, "Juan", "Gómez", "cristian@email.com", "1234", "42120100", "DNI", 3, null, null, 4, 45, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 22, "Juana", "Gómez", "celeste@email.com", "1234", "42130100", "DNI", 1, null, null, 3, 56, -34.72840647959868, -58.61369019379556),
	  ("PACIENTE", "Paciente", 23, "José", "García", "dario@email.com", "1234", "42140100", "DNI", 2, null, null, 2, 32, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 24, "Josefa", "García", "danila@email.com", "1234", "42150100", "DNI", 3, null, null, 1, 25, -34.72840647959868, -58.61369019379556),
	  ("PACIENTE", "Paciente", 25, "Julián", "García", "daniel@email.com", "1234", "42106100", "DNI", 4, null, null, 2, 36, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 26, "Juliana", "García", "daniela@email.com", "1234", "42160100", "DNI", 3, null, null, 3, 25, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 27, "Julieta", "García", "fabricio@email.com", "1234", "42170100", "DNI", 1, null, null, 4, 65, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 28, "Julia", "García", "julia@email.com", "1234", "42108100", "PASAPORTE", 1, null, null, 5, 78, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 29, "Julio", "Garcia", "julio@email.com", "1234", "46", "PASAPORTE", 3, null, null, 3, 56, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 30, "Julia", "García", "fabian@email.com", "1234", "52108100", "PASAPORTE", 1, null, null, 5, 69, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 31, "Lorenzo", "Horandle", "lorenzo@email.com", "1234", "56", "PASAPORTE", 3, null, null, 3, 32, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 32, "Laura", "Horandle", "laura@email.com", "1234", "42348100", "PASAPORTE", 1, null, null, 5, 78, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 33, "Lucia", "Iraola", "lucila@email.com", "1234", "64643", "PASAPORTE", 3, null, null, 3, 56, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 34, "Lucila", "Iraola", "lucila@email.com", "1234", "62122300", "PASAPORTE", 1, null, null, 5, 69, -34.72840647959868, -58.61369019379556),
      ("PACIENTE", "Paciente", 35, "Ludmila", "Imarriota", "ludmila@email.com", "1234", "435656", "PASAPORTE", 3, null, null, 3, 32, -34.72840647959868, -58.61369019379556),
	  ("PACIENTE", "Paciente", 36, "Alejandro", "Rodriguez", "alejandrito@email.com", "1234", "127854", "DNI", 2, null, null, 1, 45,-34.72840647959868,-58.61369019379556);

INSERT INTO piso(id, descripcion, tipoPiso, institucion_id)
		/*FAVALORO*/
VALUES (1, "SUBSUELO", NULL, 2),
	   (2, "PLANTA BAJA", NULL, 2),
       (3, "PISO 1", NULL, 2),
       (4, "PISO 2", NULL, 2),
       (5, "PISO 3", NULL, 2),
       
       /*MORON*/
       (6, "PLANTA BAJA", NULL, 3),
	   (7, "PISO 1", NULL, 3),
       (8, "PISO 2", NULL, 3),
       
       /*SANTOJJIANI*/
      (9, "PLANTA BAJA", NULL, 4),
	   (10, "PISO 1", NULL, 4),
       (11, "PISO 2", NULL, 4),
       (12, "PISO 3", NULL, 4),
       
       /*CARRILLO*/
       (13, "PLANTA BAJA", NULL, 5),
	   (14, "PISO 1", NULL, 5),
       (15, "PISO 2", NULL, 5);
       
INSERT INTO sector(id, descripcion, tipoSector, piso_id)
		/*FAVALORO*/
VALUES (1, "Cirujia", NULL, 2),
	   (2, "Internación", NULL, 2),
       (3, "Radiografías", NULL, 3),
       (4, "Quemaduras", NULL, 4),
       /*MORON*/
       (5, "Cirujia", NULL, 6),
	   (6, "Internación", NULL, 6),
       (7, "Radiografías", NULL, 7),
       (8, "Quemaduras", NULL, 8),
       /*SANTOJANNI*/
       (9, "Cirujia", NULL, 9),
	   (10, "Internación", NULL, 10),
       (11, "Radiografías", NULL, 11),
       (12, "Quemaduras", NULL, 12),
       /*CARRILLO*/
       (13, "Cirujia", NULL, 13),
	   (14, "Internación", NULL, 14),
       (15, "Radiografías", NULL, 14),
       (16, "Quemaduras", NULL, 15);
       
INSERT INTO sala(id, descripcion, tipoSala, sector_id)
		/*FAVALORO*/
VALUES (1, "SALA 1", NULL, 2),
	   (2, "SALA 2", NULL, 2),
       (3, "SALA 3", NULL, 3),
       (4, "SALA 4", NULL, 4),
       /*MORON*/
       (5, "SALA 1", NULL, 5),
	   (6, "SALA 2", NULL, 6),
       (7, "SALA 3", NULL, 7),
       (8, "SALA 4", NULL, 8),
       /*SANTOJANNI*/
       (9, "SALA 1", NULL, 9),
	   (10, "SALA 2", NULL, 10),
       (11, "SALA 3", NULL, 11),
       (12, "SALA 4", NULL, 12),
       /*CARRILLO*/
       (13, "SALA 1", NULL, 13),
	   (14, "SALA 2", NULL, 14),
       (15, "SALA 3", NULL, 15),
       (16, "SALA 4", NULL, 16);
       
INSERT INTO cama(id, descripcion, tipoCama, sala_id)
		/*FAVALORO*/
VALUES (1, "101", "FIJA", 1),
	   (2, "102", "FIJA", 1),
       (3, "103", "FIJA", 1),
       (4, "104", "FIJA", 1),
	   (5, "105", "FIJA", 2),
       (6, "106", "FIJA", 2),
       (7, "107", "FIJA", 2),
	   (8, "108", "FIJA", 2),
       (9, "109", "FIJA", 3),
       (10, "110", "FIJA", 3),
	   (11, "111", "FIJA", 3),
       (12, "112", "FIJA", 4),
       (13, "113", "FIJA", 4),
	   (14, "114", "FIJA", 4),
       (15, "115", "FIJA", 4),
       /*MORON*/
       (16, "116", "FIJA", 5),
	   (17, "117", "FIJA", 5),
       (18, "118", "FIJA", 6),
       (19, "119", "FIJA", 6),
	   (20, "120", "FIJA", 7),
       (21, "121", "FIJA", 8),
       /*SANTOJANNI*/
       (22, "122", "FIJA", 9),
	   (23, "123", "FIJA", 9),
       (24, "124", "FIJA", 9),
       (25, "125", "FIJA", 10),
	   (26, "126", "FIJA", 11),
       (27, "127", "FIJA", 11),
       (28, "128", "FIJA", 11),
	   (29, "129", "FIJA", 12),
       (30, "130", "FIJA", 12),
       (31, "131", "FIJA", 12),
       /*CARRILLO*/
	   (32, "132", "FIJA", 13),
       (33, "134", "FIJA", 13),
       (34, "135", "FIJA", 13),
	   (35, "136", "FIJA", 14),
       (36, "137", "FIJA", 14),
       (37, "138", "FIJA", 14),
	   (38, "139", "FIJA", 15),
       (39, "140", "FIJA", 15),
       (40, "141", "FIJA", 15),
	   (41, "142", "FIJA", 15),
       (42, "143", "FIJA", 15),
       (43, "144", "FIJA", 15),
	   (44, "145", "FIJA", 15),
       (45, "146", "FIJA", 15),
       (46, "147", "FIJA", 16),
	   (47, "148", "FIJA", 16),
       (48, "149", "FIJA", 16);

/* ----- INTERNACION ----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (1, '2020-01-01 01:00:00.000000', null, null, 1, 21),
	   (2, '2020-02-01 01:00:00.000000', null, null, 2, 22),
       (3, '2020-03-01 01:00:00.000000', null, null, 3, 23),
	   (4, '2020-04-01 01:00:00.000000', null, null, 4, 24);

/* ----- EGRESO ----- */
UPDATE asignacion a
SET a.horaEgreso = '2020-02-01 01:00:00.000000',
	a.motivoEgreso = "CURADO"
WHERE a.cama_id IN(1,2,3);

/* ----- INGRESO Y EGRESO A LA VEZ (SON EGRESOS EN DEFINITVA)----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (5, '2020-01-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "CURADO", 10, 25),
	   (6, '2020-02-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "CURADO", 11, 26),
       (7, '2020-03-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "FALLECIDO", 12, 27),
	   (8, '2020-04-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "TRASLADADO", 13, 28);

/* ----- INTERNACION 2 (rehusando 2 camas liberadas)----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (9, '2020-01-01 01:00:00.000000', null, null, 10, 25),
	   (10, '2020-02-01 01:00:00.000000', null, null, 11, 26),
       (11, '2020-02-01 01:00:00.000000', null, null, 12, 27);
       
/* ----- INTERNACION ----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (12, '2020-01-01 01:00:00.000000', null, null, 40, 28),
	   (13, '2020-02-01 01:00:00.000000', null, null, 41, 29),
       (14, '2020-03-01 01:00:00.000000', null, null, 42, 30),
	   (15, '2020-04-01 01:00:00.000000', null, null, 43, 31);
       
/* ----- NOTIFICACIONES----- */
INSERT INTO notificacion(asunto, fechaHora, msg, destinatario_id, remitente_id)
VALUES ("Bienvenido", '2020-04-01 01:00:00.000000', "Bienvenido  a nuestro sistema de asignación de camas.", 6, 2),
	   ("Bienvenido", '2020-04-01 01:00:00.000000', "Bienvenido  a nuestro sistema de asignación de camas.", 7, 2),
	   ("Recordatorio", '2020-04-02 01:00:00.000000', "Se le recuerda que ...", 6, 2);