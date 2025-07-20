# Preentrega SQL - Coderhouse

## Curso: SQL  
**Comisión:** 73960  
**Alumno:** Lucas Barallobre

---

### 🗂 Descripción

Este proyecto corresponde a la **preentrega del curso de SQL** dictado por Coderhouse. Se desarrolló un modelo de base de datos relacional para una aplicación inspirada en plataformas como *Nomads*, pensada para nómades digitales que buscan explorar y calificar ciudades del mundo según criterios como costo de vida, calidad de internet, seguridad, etc.

---

### 📦 Estructura del proyecto

La entrega se encuentra **modularizada en dos archivos SQL**:

#### `schema.sql`
Contiene toda la definición de la base de datos:
- Creación de la base de datos `hi_nomad_`
- Definición de las tablas (`usuarios`, `paises`, `ciudades`, `reviews`, etc.)
- Relación de claves primarias y foráneas
- Tipos de datos correctamente especificados

#### `seed.sql`
Incluye los `INSERT INTO` necesarios para poblar la base de datos con datos de prueba:
- 5 registros por cada tabla
- Datos realistas
