-- TRIGGERS DISIPADORES 

DELIMITER //

CREATE TRIGGER trg_after_insert_loan
AFTER INSERT ON loan
FOR EACH ROW
BEGIN
    -- Actualiza la cantidad disponible del libro restando 1
    UPDATE book
    SET cantidad_disponible = cantidad_disponible - 1
    WHERE id_book = NEW.book_id;
END ;

DELIMITER ;

INSERT INTO loan (student_id, book_id, loan_date, return_date)
VALUES (1, 2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY));

-- LUEGO SE CONSULTA  LA CANTIDAD DE LIBRO DISPONIBLES 
SELECT title, cantidad_disponible
FROM book
WHERE id_book = 2;

DELIMITER //

CREATE TRIGGER trg_after_update_loan_return
AFTER UPDATE ON loan
FOR EACH ROW
BEGIN
    -- Si se actualiza la fecha de devolución (return_date), aumenta la cantidad disponible
    IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL THEN
        UPDATE book
        SET cantidad_disponible = cantidad_disponible + 1
        WHERE id_book = NEW.book_id;
    END IF;
END ;

DELIMITER ;

UPDATE loan
SET return_date = CURDATE()
WHERE id_loan = 5;

SELECT title, cantidad_disponible
FROM book
WHERE id_book = (SELECT book_id FROM loan WHERE id_loan = 5);
