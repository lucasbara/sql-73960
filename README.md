# Preentrega 2 SQL - Coderhouse

## Curso: SQL  
**Comisión:** 73960  
**Alumno:** Lucas Barallobre

---

### 🗂 Descripción

Este proyecto corresponde a la **preentrega del curso de SQL** dictado por Coderhouse.  
Se desarrolló un modelo de base de datos relacional para una aplicación inspirada en plataformas como *Nomads*, pensada para nómades digitales que buscan explorar y calificar ciudades del mundo según criterios como costo de vida, calidad de internet, seguridad, etc.

---

### 📦 Estructura del proyecto

La entrega se encuentra modularizada en distintos archivos SQL:

#### `schema.sql`
Contiene toda la definición de la base de datos:
- Creación de la base de datos `hi_nomad`
- Definición de las tablas (`usuarios`, `paises`, `ciudades`, `reviews`, etc.)
- Relaciones mediante claves primarias y foráneas
- Tipos de datos correctamente especificados

#### `seed.sql`
Incluye los `INSERT INTO` necesarios para poblar la base de datos con datos de prueba:
- 5 registros por cada tabla
- Datos realistas

#### `views.sql`
Contiene vistas creadas para facilitar consultas frecuentes:
- `ciudades_con_playa`: muestra las ciudades que poseen el tag *playa*.  
- `top_ciudades_populares`: ranking de ciudades según rating, visitas y favoritos.  

#### `triggers.sql`
Incluye los triggers que automatizan la lógica de negocio:.  
- Normalizar y validar monedas (ISO en mayúsculas y valor > 0).  

#### `procedures.sql`
Almacena los stored procedures del proyecto:
- `toggle_wishlist`: agrega o elimina una ciudad de la wishlist de un usuario, devolviendo la acción realizada.  

#### `functions.sql`
Contiene funciones definidas por el usuario (UDF):
- `score_nomada`: calcula un puntaje ponderado para cada ciudad en base a seguridad, internet y costo de vida.  

---

### ✨ Créditos

Construido con ❤️ por [@lucasbara](https://github.com/lucasbara)  
