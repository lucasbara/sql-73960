CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;


DROP PROCEDURE IF EXISTS toggle_wishlist;

DELIMITER //
CREATE PROCEDURE toggle_wishlist(
  IN  p_usuario_id INT,
  IN  p_ciudad_id  INT,
  OUT p_accion     VARCHAR(10)
)
BEGIN
  DECLARE v_exists INT;

  SELECT COUNT(*) INTO v_exists
  FROM usuarios_wishlist
  WHERE usuario_id = p_usuario_id AND ciudad_id = p_ciudad_id;

  IF v_exists = 0 THEN
    INSERT INTO usuarios_wishlist (usuario_id, ciudad_id, fecha_agregado)
    VALUES (p_usuario_id, p_ciudad_id, NOW());
    SET p_accion = 'added';
  ELSE
    DELETE FROM usuarios_wishlist
    WHERE usuario_id = p_usuario_id AND ciudad_id = p_ciudad_id;
    SET p_accion = 'removed';
  END IF;
END//
DELIMITER ;
