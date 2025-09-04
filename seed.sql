CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;

INSERT INTO continentes (nombre) VALUES
('África'),
('América'),
('Asia'),
('Europa'),
('Oceanía');

INSERT INTO monedas (nombre, codigo_iso, valor_usd, simbolo) VALUES
('Dólar estadounidense', 'USD', 1.0000, '$'),
('Euro', 'EUR', 1.0800, '€'),
('Peso argentino', 'ARS', 0.0010, '$'),
('Real brasileño', 'BRL', 0.2000, '$'),
('Yen japonés', 'JPY', 0.0070, '¥');

INSERT INTO paises (continente, moneda, nombre) VALUES
(1, 1, 'Estados Unidos'),
(2, 2, 'España'),
(3, 3, 'Argentina'),
(4, 4, 'Brasil'),
(5, 5, 'Japón');

INSERT INTO usuarios (nombre, apellido, email, nacionalidad, fecha_nacimiento, bio, profesion) VALUES
('Michael', 'Smith', 'michael.smith@gmail.com', 1, '1989-06-25', 'Apasionado por los viajes y las nuevas culturas.', 'Ingeniero de Software'),
('Laura', 'Garcia', 'laura.garcia@hotmail.com', 2, '1992-11-03', 'Diseñadora freelance viviendo la vida remota.', 'Diseñadora Gráfica'),
('Carlos', 'Perez', 'carlos.perez@live.com.ar', 3, '1985-03-18', 'Siempre en movimiento, fanático del café.', 'Especialista en Marketing Digital'),
('Emma', 'Lee', 'emma.lee@gmail.com', 4, '1990-09-12', 'Escritora a medio tiempo, exploradora a tiempo completo.', 'Redactora de Contenidos'),
('Yuki', 'Tanaka', 'yuki.tanaka@outlook.com', 5, '1994-01-07', 'Amante del sushi, los atardeceres y los espacios de coworking.', 'Investigadora UX'),
('Ana', 'Martinez', 'ana.martinez@gmail.com', 1, '1991-05-14', 'Digital nomad, amante del café.', 'Consultora'),
('Luis', 'Rodriguez', 'luis.rodriguez@yahoo.com', 2, '1987-09-22', 'Fotógrafo y viajero.', 'Fotógrafo'),
('Sofia', 'Gomez', 'sofia.gomez@gmail.com', 3, '1993-12-03', 'Fan del coworking y coworking spaces.', 'Community Manager'),
('Tom', 'Harris', 'tom.harris@gmail.com', 1, '1985-01-11', 'Programador remoto.', 'Desarrollador Fullstack'),
('Mia', 'Suzuki', 'mia.suzuki@gmail.com', 5, '1990-06-18', 'Apasionada por la cultura japonesa.', 'Traductora'),
('Daniel', 'Lopez', 'daniel.lopez@gmail.com', 4, '1988-04-05', 'Fan de playas y vida nocturna.', 'Marketing Manager'),
('Isabella', 'Martins', 'isabella.martins@gmail.com', 4, '1992-02-14', 'Amante de Brasil y su cultura.', 'Arquitecta'),
('Hiro', 'Kobayashi', 'hiro.kobayashi@gmail.com', 5, '1991-07-12', 'Fan del trabajo remoto y sushi.', 'Ingeniero de Datos'),
('Olivia', 'Fernandez', 'olivia.fernandez@gmail.com', 2, '1995-03-30', 'Exploradora urbana.', 'Diseñadora UX'),
('Mateo', 'Gomez', 'mateo.gomez@gmail.com', 3, '1989-10-20', 'Amante del café y coworking.', 'Product Manager'),
('Lucas', 'Barallobre', 'lucas.barallobre@gmail.com', 3, '1990-12-05', 'Fanático de la tecnología y viajes.', 'Analista de Datos'),
('Chloe', 'Smith', 'chloe.smith@gmail.com', 1, '1992-08-19', 'Digital nomad y fotógrafa.', 'Fotógrafa'),
('Tommy', 'Brown', 'tommy.brown@gmail.com', 1, '1987-11-11', 'Programador y gamer.', 'Desarrollador'),
('Emma', 'Wilson', 'emma.wilson@gmail.com', 2, '1993-01-15', 'Amante del coworking y cafés.', 'Diseñadora Gráfica'),
('Leo', 'Tanaka', 'leo.tanaka@gmail.com', 5, '1994-09-25', 'Apasionado por la tecnología y el anime.', 'Desarrollador Frontend');

INSERT INTO ciudades (pais, nombre, habitantes, rating, visa_required, seguridad, internet_mb, temperatura) VALUES
(1, 'Nueva York', 8500000, 9, true, 8, 300, 12),
(1, 'Los Ángeles', 4000000, 8, true, 7, 280, 20),
(1, 'San Francisco', 870000, 9, true, 9, 320, 16),
(1, 'Chicago', 2700000, 7, true, 6, 250, 10),
(1, 'Miami', 470000, 8, true, 6, 220, 25),
(2, 'Barcelona', 5500000, 8, false, 7, 250, 18),
(2, 'Madrid', 3300000, 8, false, 8, 280, 17),
(2, 'Valencia', 800000, 7, false, 7, 220, 19),
(2, 'Sevilla', 700000, 6, false, 6, 210, 21),
(2, 'Bilbao', 350000, 6, false, 7, 200, 15),
(3, 'Buenos Aires', 3000000, 7, false, 5, 200, 20),
(3, 'Córdoba', 1500000, 6, false, 6, 180, 22),
(3, 'Rosario', 1000000, 6, false, 5, 190, 21),
(3, 'Mendoza', 900000, 5, false, 7, 170, 18),
(3, 'La Plata', 800000, 5, false, 6, 160, 19),
(4, 'Río de Janeiro', 6500000, 8, false, 6, 180, 26),
(4, 'São Paulo', 12000000, 7, false, 7, 220, 23),
(4, 'Salvador', 2900000, 6, false, 5, 200, 28),
(4, 'Brasília', 3000000, 8, false, 8, 250, 22),
(4, 'Recife', 1600000, 6, false, 6, 210, 27),
(5, 'Tokio', 14000000, 9, true, 9, 350, 15),
(5, 'Osaka', 2700000, 8, true, 8, 300, 17),
(5, 'Kyoto', 1500000, 8, true, 7, 280, 16),
(5, 'Sapporo', 1900000, 7, true, 7, 250, 12),
(5, 'Fukuoka', 1600000, 7, true, 6, 220, 20);

INSERT INTO costos_ciudad (ciudad_id, alojamiento_mensual, comida, transporte, ocio, last_updated) VALUES
(1, 1200, 400, 150, 300, NOW()),
(2, 1300, 420, 160, 315, NOW()),
(3, 1400, 440, 170, 330, NOW()),
(4, 1100, 380, 140, 310, NOW()),
(5, 1250, 410, 155, 320, NOW()),
(6, 1200, 400, 150, 300, NOW()),
(7, 1150, 390, 140, 305, NOW()),
(8, 1100, 380, 135, 300, NOW()),
(9, 1000, 350, 130, 290, NOW()),
(10, 1050, 360, 140, 295, NOW()),
(11, 900, 300, 120, 280, NOW()),
(12, 850, 280, 110, 270, NOW()),
(13, 800, 260, 100, 260, NOW()),
(14, 950, 290, 115, 275, NOW()),
(15, 900, 280, 110, 265, NOW()),
(16, 1000, 320, 130, 280, NOW()),
(17, 1100, 340, 140, 290, NOW()),
(18, 1050, 330, 135, 285, NOW()),
(19, 1200, 360, 145, 295, NOW()),
(20, 950, 310, 125, 270, NOW());

INSERT INTO reviews (usuario_id, ciudad_id, fecha, rating, rating_seguridad, rating_costo, rating_wifi, comentario) VALUES
(1, 1, CURDATE(), 9, 8, 7, 9, 'Ciudad increíble para trabajar en remoto.'),
(2, 2, CURDATE(), 8, 7, 8, 8, 'Calles hermosas y buen wifi.'),
(3, 3, CURDATE(), 7, 5, 9, 7, 'Económica pero caótica.'),
(4, 4, CURDATE(), 8, 6, 6, 6, 'Divertida aunque no muy segura de noche.'),
(5, 5, CURDATE(), 9, 9, 5, 10, 'Muy conectada y organizada. Perfecta para nómades.');

INSERT INTO usuarios_wishlist (usuario_id, ciudad_id, fecha_agregado) VALUES
(1, 5, NOW()),
(2, 4, NOW()),
(3, 3, NOW()),
(4, 2, NOW()),
(5, 1, NOW());

INSERT INTO ciudades_visitadas (usuario_id, ciudad_id, fecha_visitada) VALUES
(1, 1, '2021-08-15'),
(2, 2, '2022-06-20'),
(3, 3, '2023-03-05'),
(4, 4, '
