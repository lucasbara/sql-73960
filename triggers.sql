CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;


DROP TRIGGER IF EXISTS trg_monedas

DELIMITER //
CREATE TRIGGER trg_monedas
BEFORE INSERT ON monedas
FOR EACH ROW
BEGIN
  SET NEW.codigo_iso = UPPER(TRIM(NEW.codigo_iso));
  IF NEW.valor_usd IS NULL OR NEW.valor_usd <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'valor_usd debe ser > 0';
  END IF;
END//
DELIMITER ;