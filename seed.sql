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
('Yuki', 'Tanaka', 'yuki.tanaka@outlook.com', 5, '1994-01-07', 'Amante del sushi, los atardeceres y los espacios de coworking.', 'Investigadora UX');

INSERT INTO ciudades (pais, nombre, habitantes, rating, visa_required, seguridad, internet_mb, temperatura) VALUES
(1, 'Nueva York', 8500000, 9, true, 8, 300, 12),
(2, 'Barcelona', 5500000, 8, false, 7, 250, 18),
(3, 'Buenos Aires', 3000000, 7, false, 5, 200, 20),
(4, 'Río de Janeiro', 6500000, 8, false, 6, 180, 26),
(5, 'Tokio', 14000000, 9, true, 9, 350, 15);

INSERT INTO costos_ciudad (ciudad_id, alojamiento_mensual, comida, transporte, ocio, last_updated) VALUES
(1, 1200, 400, 150, 300, NOW()),
(2, 1300, 420, 160, 315, NOW()),
(3, 1400, 440, 170, 330, NOW()),
(4, 1500, 460, 180, 345, NOW()),
(5, 1600, 480, 190, 360, NOW());

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
(4, 4, '2022-12-01'),
(5, 5, '2021-11-10');

INSERT INTO tags (nombre) VALUES
('playa'),
('segura'),
('coworking'),
('vida nocturna'),
('naturaleza');

INSERT INTO ciudad_tags (ciudad_id, tag_id) VALUES
(1, 3),
(2, 2),
(3, 4),
(4, 1),
(5, 5);
