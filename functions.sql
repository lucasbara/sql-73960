CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;


DROP FUNCTION IF EXISTS score_nomada;

DELIMITER //
CREATE FUNCTION score_nomada(ciudadId INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_seguridad TINYINT;
    DECLARE v_internet INT;
    DECLARE v_costo DECIMAL(10,2);
    DECLARE v_score DECIMAL(5,2);

    DECLARE seg_max TINYINT DEFAULT 5;
    DECLARE net_ref INT DEFAULT 200;
    DECLARE cost_ref DECIMAL(10,2) DEFAULT 3000;

    SELECT seguridad, internet_mb, costo_vida
    INTO v_seguridad, v_internet, v_costo
    FROM ciudades
    WHERE id = ciudadId;

    SET v_score = (
        (v_seguridad / seg_max) * 0.4 +
        (LEAST(v_internet, net_ref) / net_ref) * 0.3 +
        (cost_ref / v_costo) * 0.3
    ) * 10;

    RETURN v_score;
END//
DELIMITER ;
