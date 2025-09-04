CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;

CREATE OR REPLACE VIEW ciudades_con_playa AS
SELECT
    c.id,
    c.nombre,
    c.habitantes,
    c.rating
FROM ciudades c
INNER JOIN ciudad_tags tc ON c.id = tc.ciudad_id
INNER JOIN tags t ON t.id = tc.tag_id
WHERE t.nombre = 'playa';

CREATE OR REPLACE VIEW top_ciudades_populares AS
SELECT
    c.id,
    c.nombre,
    c.pais,
    c.rating,
    w.total_favoritos,
    v.total_visitas
FROM ciudades c
INNER JOIN (
    SELECT ciudad_id, COUNT(*) AS total_favoritos
    FROM usuarios_wishlist
    GROUP BY ciudad_id
    HAVING COUNT(*) > 0
) w ON w.ciudad_id = c.id
INNER JOIN (
    SELECT ciudad_id, COUNT(*) AS total_visitas
    FROM ciudades_visitadas
    GROUP BY ciudad_id
    HAVING COUNT(*) > 0
) v ON v.ciudad_id = c.id
ORDER BY
    c.rating DESC,
    v.total_visitas DESC,
    w.total_favoritos DESC;

CREATE OR REPLACE VIEW ciudades_con_vida_nocturna AS
SELECT
    c.id,
    c.nombre,
    c.habitantes,
    c.rating
FROM ciudades c
INNER JOIN ciudad_tags tc ON c.id = tc.ciudad_id
INNER JOIN tags t ON t.id = tc.tag_id
WHERE t.nombre = 'vida nocturna';

CREATE OR REPLACE VIEW ciudades_mas_visitadas AS
SELECT
    c.id,
    c.nombre,
    p.nombre AS pais,
    COUNT(cv.id) AS veces_visitada
FROM ciudades c
JOIN paises p ON c.pais = p.id
JOIN ciudades_visitadas cv ON cv.ciudad_id = c.id
GROUP BY c.id, c.nombre, p.nombre
ORDER BY veces_visitada DESC;

CREATE OR REPLACE VIEW ciudades_caribe AS
SELECT
    c.id,
    c.nombre AS ciudad,
    p.nombre AS pais,
    ct.nombre AS continente,
    c.habitantes,
    c.rating,
    c.seguridad,
    c.internet_mb,
    c.temperatura
FROM ciudades c
JOIN paises p ON c.pais = p.id
JOIN continentes ct ON p.continente = ct.id
WHERE p.nombre IN ('Cuba', 'República Dominicana', 'Jamaica', 'Haití', 'Bahamas');
