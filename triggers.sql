CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;

DROP TRIGGER IF EXISTS trg_monedas;
DROP TRIGGER IF EXISTS trg_last_updated_costos;

DELIMITER //
CREATE TRIGGER trg_monedas
BEFORE INSERT ON monedas
FOR EACH ROW
BEGIN
  SET NEW.codigo_iso = UPPER(TRIM(NEW.codigo_iso));
  IF NEW.valor_usd IS NULL OR NEW.valor_usd <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'valor_usd debe ser mayor a 0';
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_last_updated_costos
BEFORE UPDATE ON costos_ciudad
FOR EACH ROW
BEGIN
  IF NEW.alojamiento_mensual <> OLD.alojamiento_mensual OR
     NEW.comida <> OLD.comida OR
     NEW.transporte <> OLD.transporte OR
     NEW.ocio <> OLD.ocio THEN
    SET NEW.last_updated = NOW();
  END IF;
END;
//
DELIMITER ;
