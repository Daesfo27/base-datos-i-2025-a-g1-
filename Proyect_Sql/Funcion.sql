
-- Funcion sql 

-- Calcular días de atraso de un préstamo
 DELIMITER //
CREATE FUNCTION calcular_dias_atraso(fecha_devolucion DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias_atraso INT;
    
    IF CURRENT_DATE > fecha_devolucion THEN
        SET dias_atraso = DATEDIFF(CURRENT_DATE, fecha_devolucion);
    ELSE
        SET dias_atraso = 0;
    END IF;

    RETURN dias_atraso;
END;
//
DELIMITER ;

SELECT id_loan, calcular_dias_atraso(return_date) AS dias_atraso
FROM loan
WHERE returned = FALSE;