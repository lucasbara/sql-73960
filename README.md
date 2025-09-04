# Proyecto Final SQL - Coderhouse

## Curso
SQL

## Comisión
73960

## Alumno
Lucas Barallobre

---

## Descripción
Este proyecto corresponde a la entrega final del curso de SQL dictado por Coderhouse.  
Se desarrolló un modelo de base de datos relacional para una aplicación inspirada en plataformas como Nomads, pensada para nómades digitales que buscan explorar y calificar ciudades del mundo según criterios como costo de vida, calidad de internet, seguridad, etc.

---

## Estructura del proyecto

### schema.sql
Contiene toda la definición de la base de datos `hi_nomad`:

- Creación de la base de datos.
- Definición de tablas: `usuarios`, `paises`, `ciudades`, `reviews`, `costos_ciudad`, `tags`, `ciudad_tags`, `usuarios_wishlist`, `ciudades_visitadas`, `monedas`, `continentes`.
- Relaciones mediante claves primarias y foráneas.
- Tipos de datos correctamente especificados.

### seed.sql
Incluye los `INSERT INTO` necesarios para poblar la base de datos con datos de prueba:

- 5 o más registros por cada tabla.
- Datos realistas y variados.

### views.sql
Contiene vistas creadas para facilitar consultas frecuentes:

- `ciudades_con_playa`: muestra las ciudades que poseen el tag `playa`.
- `top_ciudades_populares`: ranking de ciudades según `rating`, visitas y favoritos.
- `ciudades_con_vida_nocturna`: muestra ciudades con tag `vida nocturna`.
- `ciudades_mas_visitadas`: ranking de ciudades más visitadas.
- `ciudades_caribe`: ciudades del Caribe con información detallada.

### triggers.sql
Incluye los triggers que automatizan la lógica de negocio:

- `trg_monedas`: normaliza el código ISO de monedas y valida que `valor_usd` sea mayor a 0.
- `trg_last_updated_costos`: actualiza el timestamp `last_updated` de `costos_ciudad` al cambiar alguno de sus valores.

### procedures.sql
Almacena los stored procedures del proyecto:

- `toggle_wishlist`: agrega o elimina una ciudad de la wishlist de un usuario y devuelve la acción realizada (`added` o `removed`).
- `add_review`: permite agregar reviews de usuarios para ciudades, validando rangos de 1 a 10 y evitando duplicados en el mismo día.

### functions.sql
Contiene funciones definidas por el usuario (UDF):

- `score_nomada`: calcula un puntaje ponderado para cada ciudad en base a seguridad, velocidad de internet y costo mensual en USD del último registro disponible. Normaliza cada variable contra valores de referencia, devolviendo un valor entre 0 y 1.
- `nivel_seguridad`: devuelve `'alta'`, `'media'` o `'baja'` según el valor de seguridad de la ciudad.

---

## Créditos
Construido con ❤️ por [@lucasbara](https://github.com/lucasbara)
