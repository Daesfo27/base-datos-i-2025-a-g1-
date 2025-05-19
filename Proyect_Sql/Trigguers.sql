Después de insertar un préstamo, registrar en el historial

DELIMITER //
CREATE TRIGGER after_insert_loan
AFTER INSERT ON loan
FOR EACH ROW
BEGIN
    INSERT INTO loan_history (loan_id, action)
    VALUES (NEW.id_loan, 'Préstamo registrado');
END;
//
DELIMITER ;

-- Después de actualizar un préstamo como devuelto, registrar en el historial

DELIMITER //
CREATE TRIGGER after_update_loan_returned
AFTER UPDATE ON loan
FOR EACH ROW
BEGIN
    IF NEW.returned = TRUE AND OLD.returned = FALSE THEN
        INSERT INTO loan_history (loan_id, action)
        VALUES (NEW.id_loan, 'Libro devuelto');
    END IF;
END;
//
DELIMITER ;
