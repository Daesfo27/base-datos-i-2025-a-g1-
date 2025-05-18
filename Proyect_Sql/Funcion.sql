-- Funcion sql 

-- Función para calcular el tiempo en días que un libro ha estado prestado

DELIMITER $$

CREATE FUNCTION dias_prestamo(fecha_prestamo DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias INT;
    SET dias = DATEDIFF(CURDATE(), fecha_prestamo);
    RETURN dias;
END $$

DELIMITER ;

-- Para probarla:
SELECT
    l.id_loan,
    s.full_name AS estudiante,
    l.loan_date,
    dias_prestamo(l.loan_date) AS dias_prestados
FROM loan l
JOIN student s ON l.student_id = s.id_student;
