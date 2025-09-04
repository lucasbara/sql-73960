CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;

DROP FUNCTION IF EXISTS score_nomada;
DROP FUNCTION IF EXISTS nivel_seguridad;

DELIMITER //
CREATE FUNCTION score_nomada(ciudadId INT)
RETURNS DECIMAL(5,4)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_seguridad TINYINT;
    DECLARE v_internet INT;
    DECLARE v_costo DECIMAL(10,2);
    DECLARE v_score DECIMAL(5,4);

    DECLARE seg_max TINYINT DEFAULT 10;
    DECLARE net_ref INT DEFAULT 200;
    DECLARE cost_ref DECIMAL(10,2) DEFAULT 3000;
    DECLARE max_score DECIMAL(5,4) DEFAULT 1;

    SELECT c.seguridad, c.internet_mb,
           (cc.alojamiento_mensual + cc.comida + cc.transporte + cc.ocio) AS costo_total
    INTO v_seguridad, v_internet, v_costo
    FROM ciudades c
    JOIN costos_ciudad cc ON cc.ciudad_id = c.id
    WHERE c.id = ciudadId
    ORDER BY cc.last_updated DESC
    LIMIT 1;

    SET v_score = 
        (v_seguridad / seg_max) * 0.4
      + (LEAST(v_internet, net_ref) / net_ref) * 0.3
      + LEAST(cost_ref / v_costo, max_score) * 0.3;

    RETURN v_score;
END//
DELIMITER ;

DELIMITER //
CREATE FUNCTION nivel_seguridad(ciudadId INT)
RETURNS VARCHAR(10)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE s TINYINT;

    SELECT seguridad
    INTO s
    FROM ciudades
    WHERE id = ciudadId;

    RETURN CASE
        WHEN s >= 8 THEN 'alta'
        WHEN s >= 5 THEN 'media'
        ELSE 'baja'
    END;
END//
DELIMITER ;
