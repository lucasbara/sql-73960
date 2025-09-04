CREATE DATABASE IF NOT EXISTS hi_nomad;
USE hi_nomad;

DROP PROCEDURE IF EXISTS toggle_wishlist;
DROP PROCEDURE IF EXISTS add_review;

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
END;
//

CREATE PROCEDURE add_review(
  IN p_usuario_id INT,
  IN p_ciudad_id INT,
  IN p_rating TINYINT,
  IN p_rating_seguridad TINYINT,
  IN p_rating_costo TINYINT,
  IN p_rating_wifi TINYINT,
  IN p_comentario TEXT
)
BEGIN
  IF p_rating < 1 OR p_rating > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El rating general debe estar entre 1 y 10';
  END IF;

  IF p_rating_seguridad < 1 OR p_rating_seguridad > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El rating de seguridad debe estar entre 1 y 10';
  END IF;

  IF p_rating_costo < 1 OR p_rating_costo > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El rating de costo debe estar entre 1 y 10';
  END IF;

  IF p_rating_wifi < 1 OR p_rating_wifi > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El rating de wifi debe estar entre 1 y 10';
  END IF;

  IF EXISTS (
    SELECT 1 FROM reviews
    WHERE usuario_id = p_usuario_id
      AND ciudad_id = p_ciudad_id
      AND DATE(fecha) = CURDATE()
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Ya existe una review de hoy';
  END IF;

  INSERT INTO reviews (
    usuario_id, ciudad_id, fecha,
    rating, rating_seguridad, rating_costo, rating_wifi, comentario
  ) VALUES (
    p_usuario_id, p_ciudad_id, NOW(),
    p_rating, p_rating_seguridad, p_rating_costo, p_rating_wifi, p_comentario
  );
END;
//

DELIMITER ;
