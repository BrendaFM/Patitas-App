USE patitasapp;

-- PERSONAS
INSERT INTO personas (apellidos, nombres, tipodoc, numdoc, direccion, telefono, logeado) VALUES 	
			('Boada Ramos','Luis Anderson', 'D', 12345678, 'Av España 123', 987654321,"S"),
			('Belleza Torres','Anderson David', 'D', 37194023, 'Jr 28 De Julio 123', 972648117, "S"),
			('Francia Minaya','Brenda Andrea', 'D', 74720939, 'Av Artemio Molina 454', 964918123, "S"),
			('Francia Minaya', 'Jhon Edward', 'D', 22244400, 'Chincha Alta', 999000333, "S"),
			('Roberto Carlos', 'Rey Sanches', 'D', 39581934, 'Jr 28 De Julio 18', 978195723, "N"),
			('Juan Fernando', 'Quispe Guerra', 'C', 81571482, 'Los Cedros 134', 961841923, "N"),
			('Adriana Carolina', 'De la Cruz', 'D', 28195012, 'Leoncio Prado 186', 946172931, "N"),
			('Efraín Marcelo', 'Gonzales Perez', 'C', 12481593, 'Av. Salaverry 359', 989548933, "N"),
			('Jesus Antonio', 'Navarro Hernandez', 'D', 61306814, 'Jr Bolivar 115', 917246237, "N"),
			('Flavio', 'Torres Boada', 'C', 12121233, 'San Antonio de Salas - Chincha Baja', 975542123, "N"),
			('Junior', 'Roque Montes', 'D', 33212121, 'San Antonio de Salas - Chincha Baja', 945454578, "N"),
			('Nestor', 'Tasayco Torres', 'C', 44221133, 'Chincha Alta', 955575321, "N"),
			('Niurka', 'Castilla', 'C', 55778899, 'Santa Luisa - Chincha Baja', 964522145, "N"),
			('Maryory', 'Mendoza Matias', 'D', 22145533, 'Lomo Largo - Sunampe', 957575753, "N");
SELECT * FROM personas;

-- USUARIOS
INSERT INTO usuarios (idpersona, nombreusuario, clave, fechaalta, fechabaja, estado, nivelacceso) VALUES 	
			(1, 'Luis','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'A', 'C'),
			(2, 'Anderson','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'A', 'C'),
			(3, 'Brenda','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'A', 'C'),
			(4, 'Jhon','$2y$10$dvgzm2Jmh0u98DerZSGkX.QH5rVqqD/ctSC3UCgYNj4jFh0CgR5mi', CURDATE(), NULL, 'A', 'U');
SELECT * FROM usuarios;

-- ANIMALES
INSERT INTO animales (animal) VALUES 	
			('Perro'),
			('Gato');
SELECT * FROM animales;

-- RAZAS
INSERT INTO razas (raza, idanimal) VALUES 
			('Perro mestizo', 1),	
			('Bull terrier', 1 ),
			('Bulldog americano', 1),
			('Bulldog frances', 1),
			('Bulldog inglés', 1),
			('Chihuahua', 1),
			('Cocker', 1),
			('Dalmata', 1),
			('Dóberman', 1),
			('Dogo argentino', 1),
			('Dogo de burdeos', 1),
			('Fox terrier', 1),
			('French poodle', 1),
			('Gran dánes', 1),
			('Husky siberiano', 1),
			('Labrador retriever', 1),
			('Mastín español', 1),
			('Mastín inglés', 1),
			('Mastín tibetano', 1),
			('Paston alemán', 1),
			('Pekinés', 1),
			('Perro salchicha', 1),
			('Pinscher', 1),
			('Rottweiler', 1),
			('Schipperke', 1),
			('Schnauzer', 1),
			('Shar pei', 1),
			('Terrier alemán', 1),
			('Shiba inu', 1),
			('Shih tzu', 1),
			('Gato Mestizo',2),
			('Americano de pelo corto',2),
			('Angora turco',2),
			('Azul ruso',2),
			('Balinés',2),
			('Bengala',2),
			('Birmano',2),
			('Bombay',2),
			('Bosque de Noruega',2),
			('Británico de pelo largo',2),
			('British Shorthair',2),
			('Burmés',2),
			('Chartreux',2),
			('Curl americano',2),
			('Don Sphynx',2),
			('Esfinge',2),
			('Europeo de pelo corto',2),
			('Exótico',2),
			('Fold escocés',2),
			('Habana brown',2),
			('Himalayoo',2),
			('Kinkalow',2),
			('Maine Coon',2),
			('Manx',2),
			('Munchkin',2),
			('Oriental',2),
			('Persa',2),
			('Ragamuffin',2),
			('Savannah',2),
			('Siames',2);
SELECT * FROM razas;

-- MASCOTAS
INSERT INTO mascotas (idusuario, idraza, nombremascota, genero, fechanacimiento, observaciones, esterilizacion, estado, vive, apadrinado) VALUES 		
			(1, 1, 'Nacho', 'M', '2016-04-12', 'descripcion', 'S', 'A', 'S', 'N'), -- adoptado
			(1, 31, 'Alex', 'M', '2016-08-17', 'descripcion', 'N', 'R', 'S', 'N'), -- refugiado
			(2, 31, 'Danna', 'H', '2017-12-21', 'descripcion', 'N', 'R', 'S', 'S'), -- refugiado
			(1, 6, 'Copita', 'H', '2017-07-03', 'descripcion', 'N', 'A', 'S', 'N'), -- adoptado
			(2, 8, 'Bronko', 'M', '2017-04-12', 'descripcion', 'S', 'A', 'S', 'S'), -- adoptado
			(3, 31, 'Charlie', 'M', '2018-04-12', 'descripcion', 'S', 'R', 'S', 'S'), -- refugiado
			(2, 1, 'Rocky', 'M', '2018-04-12', 'descripcion', 'S', 'R', 'S', 'N'), -- refugiado
			(3, 34, 'Bella', 'H', '2019-04-12', 'descripcion', 'N', 'R', 'S', 'S'), -- refugiado
			(3, 1, 'Lola', 'H', '2019-04-12', 'descripcion', 'S', 'R', 'S', 'N'), -- refugiado
			(2, 1, 'Blanca', 'H', '2020-04-12', 'descripcion', 'N', 'R', 'S', 'S'), -- refugiado
			(1, 31, 'Mia', 'H', '2020-04-12', 'descripcion', 'S', 'A', 'S', 'N'), -- adoptado
			(3, 1, 'Balto', 'M', '2020-04-12', 'descripcion', 'S', 'R', 'S', 'S'), -- refugiado
			(1, 1, 'Peluchin', 'M', '2020-08-17', 'descripcion', 'N', 'R', 'S', 'S'), -- refugiado
			(2, 31, 'Lisa', 'H', '2020-12-21', 'descripcion', 'N', 'R', 'S', 'N'), -- refugiado
			(1, 1, 'Any', 'H', '2020-07-03', 'descripcion', 'N', 'A', 'S', 'S'), -- adoptado
			(3, 60, 'Cosmo', 'M', '2021-04-12', 'descripcion', 'S', 'R', 'S', 'N'), -- refugiado
			(3, 1, 'Mané', 'M', '2021-04-12', 'descripcion', 'S', 'R', 'S', 'N'), -- refugiado
			(2, 60, 'Max', 'M', '2021-04-12', 'descripcion', 'S', 'R', 'S', 'N'), -- refugiado
			(3, 31, 'Misha', 'H', '2022-01-10', 'descripcion', 'N', 'R', 'S', 'N'), -- refugiado
			(1, 8, 'Polita', 'H', '2022-01-11', 'descripcion', 'S', 'A', 'S', 'S'), -- adoptado
			(2, 31, 'Frida', 'H', '2022-02-02', 'descripcion', 'N', 'R', 'S', 'N'), -- refugiado
			(2, 1, 'Nina', 'H', '2022-02-10', 'descripcion', 'S', 'A', 'S','N'); -- adoptado
SELECT * FROM mascotas;
SELECT * FROM adopciones;
-- ADOPCIONES
INSERT INTO adopciones (idpersona, idmascota, fechaadopcion, fecharetorno) VALUES 	
			(3, 1, '2016-05-10', NULL),
			(5, 4, '2018-04-01', NULL),
			(5, 5, '2019-08-15', NULL),
			(1, 11, '2021-07-10', NULL),
			(10, 15, '2021-05-15', NULL),
			(8, 20, '2022-03-01', NULL),
			(6, 22, '2022-03-27', NULL);				
SELECT * FROM adopciones;

-- TIPOS DE EVENTOS
INSERT INTO tipoeventos (tipoevento) VALUES 	
			('Vacunacion'),
			('Chequeo de rutina'),
			('Desparasitación'),
			('Intervencion'),
			('Otros');
SELECT * FROM tipoeventos;

-- EVENTOS
INSERT INTO eventos (idmascota, idtipoevento, fechahora, informacion) VALUES 	
			(1, 4, '2016-01-15', 'Operación'),
			(2, 1, '2017-01-15', 'Contra la Rabia'),
			(2, 2, '2018-01-15', 'Visita al veterinario'),
			(5, 1, '2017-01-15', 'Vacuna por resfrío'),
			(9, 4, '2019-01-15', 'Operación'),
			(9, 3, '2020-01-15', 'Medicacion para la desparasitacion'),
			(11, 4, '2020-01-15', 'Operación'),
			(12, 1, '2020-01-15', 'Vacuna Polivalente');
SELECT * FROM eventos;

-- PADRINOS
INSERT INTO padrinos (idpersona, idmascota, fecha) VALUES 	
			(5, 6, '2017-02-02'),
			(8, 3, '2018-01-19'),
			(14, 13, '2018-02-12'),
			(14, 8, '2019-01-10'),
			(6, 12, '2019-01-11'),
			(8, 20, '2020-03-17'),
			(10, 10, '2021-02-14'),
			(11, 15, '2021-03-14'),
			(5, 5, '2022-03-12');
SELECT * FROM padrinos;

-- VOLUNTARIOS
INSERT INTO voluntarios (idpersona, fechahora, descripcionvol) VALUES 	
			(6, '2017-11-23', 'Ayudo con la limpieza'),
			(9, '2018-04-17', 'Cambio de cama de mascotas'),
			(12, '2018-09-12', 'Construir casa para las mascotas'),
			(6, '2019-05-09', 'Baños a las mascotas'),
			(7, '2020-03-15', 'Cambio de cama de mascotas'),
			(11, '2020-08-19', 'Ayudo con la limpieza'),
			(13, '2011-04-05', 'Construir casa para las mascotas'),
			(6, '2021-12-16', 'Baños a las mascotas'),
			(13, '2022-08-29', 'Ayudo con la limpieza'),
			(9, '2022-10-30', 'Construir casa para las mascotas');
SELECT * FROM voluntarios;

-- TIPO DE APOYOS
INSERT INTO tipoapoyos (tipoapoyo) VALUES 	
			('Comida'),
			('Monetario'),
			('Otros');
SELECT * FROM tipoapoyos;

-- APOYO
INSERT INTO apoyo (idpersona, idtipoapoyo, fechaapoyo, cantidad, descripcion) VALUES 	
			(10, 1 , '2017-09-12', 250 , 'Comida para perros del albergue / ONGVIDA'),
			(5, 2, '2017-09-29', 100, 'apoyo de dinero'),
			(5, 3, '2018-01-12' , NULL , 'Medicamentos para perros'),
			(3, 2, '2018-06-01' , 300 , 'Apoyo económico'),
			(7, 3, '2018-11-11', NULL, 'medicinas para las mascotas'),
			(13, 1, '2019-06-12', 30, 'apoyo de comida'),
			(11, 3, '2019-10-30', NULL, 'abrigos para las mascotas'),
			(13, 1, '2020-08-30' , 100 , 'Comida para gatos - Niurka Castilla'),
			(5, 3, '2020-10-18' , NULL , 'Ayudar en campaña para Esterilizar perros - Veterinario'),
			(7, 2, '2020-04-26', 150, 'apoyo de dinero'),
			(5, 2, '2021-12-12' , 500 , 'Apoyo Económico'),
			(9, 3, '2022-01-05', NULL, 'colaboracion de veterinario para tratamiendo de las macotas');
SELECT * FROM apoyo;