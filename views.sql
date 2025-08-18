CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;


CREATE OR REPLACE VIEW ciudades_con_playa AS
SELECT
  c.id,
  c.nombre,
  c.habitantes,
  c.rating
FROM ciudades AS c
INNER JOIN ciudad_tags AS tc
  ON c.id = tc.ciudad_id
INNER JOIN tags AS t
  ON t.id = tc.tag_id
WHERE t.nombre = 'playa';



CREATE OR REPLACE VIEW top_ciudades_populares AS
SELECT
  c.id,
  c.nombre,
  c.pais,
  c.rating,
  w.total_favoritos,
  v.total_visitas
FROM ciudades AS c
INNER JOIN (
  SELECT ciudad_id, COUNT(*) AS total_favoritos
  FROM usuarios_wishlist
  GROUP BY ciudad_id
  HAVING COUNT(*) > 0
) AS w
  ON w.ciudad_id = c.id
INNER JOIN (
  SELECT ciudad_id, COUNT(*) AS total_visitas
  FROM ciudades_visitadas
  GROUP BY ciudad_id
  HAVING COUNT(*) > 0
) AS v
  ON v.ciudad_id = c.id
ORDER BY
  c.rating DESC,
  v.total_visitas DESC,
  w.total_favoritos DESC;
