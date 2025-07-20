CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;

CREATE TABLE continentes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50)
);

CREATE TABLE monedas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30),
  codigo_iso VARCHAR(3),
  valor_usd DECIMAL(10,4),
  simbolo VARCHAR(1)
);

CREATE TABLE paises (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  continente INT,
  moneda INT,
  FOREIGN KEY (continente) REFERENCES continentes(id),
  FOREIGN KEY (moneda) REFERENCES monedas(id)
);

CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30),
  apellido VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  nacionalidad INT,
  fecha_nacimiento DATE,
  bio TEXT,
  profesion VARCHAR(50),
  FOREIGN KEY (nacionalidad) REFERENCES paises(id)
);

CREATE TABLE ciudades (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pais INT,
  nombre VARCHAR(50),
  habitantes INT,
  rating TINYINT,
  visa_required BOOLEAN,
  seguridad TINYINT,
  internet_mb INT,
  temperatura TINYINT,
  FOREIGN KEY (pais) REFERENCES paises(id)
);

CREATE TABLE costos_ciudad (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ciudad_id INT,
  alojamiento_mensual INT,
  comida INT,
  transporte INT,
  ocio INT,
  last_updated TIMESTAMP,
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
);

CREATE TABLE reviews (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  ciudad_id INT,
  fecha DATE,
  rating TINYINT,
  rating_seguridad TINYINT,
  rating_costo TINYINT,
  rating_wifi TINYINT,
  comentario TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
);

CREATE TABLE usuarios_wishlist (
  usuario_id INT,
  ciudad_id INT,
  fecha_agregado TIMESTAMP,
  PRIMARY KEY (usuario_id, ciudad_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
);

CREATE TABLE ciudades_visitadas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  ciudad_id INT,
  fecha_visitada DATE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
);

CREATE TABLE tags (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50)
);

CREATE TABLE ciudad_tags (
  ciudad_id INT,
  tag_id INT,
  PRIMARY KEY (ciudad_id, tag_id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);
