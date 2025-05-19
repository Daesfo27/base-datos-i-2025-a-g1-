-- procedures 

 -- Insertar un nuevo estudiante
 DELIMITER //
CREATE PROCEDURE insertar_estudiante(
    IN nombre_completo VARCHAR(100),
    IN email VARCHAR(100),
    IN telefono VARCHAR(20),
    IN grado VARCHAR(10)
)
BEGIN
    INSERT INTO person(full_name, email, phone) VALUES (nombre_completo, email, telefono);
    INSERT INTO student(person_id, grade)
    VALUES (LAST_INSERT_ID(), grado);
END //
DELIMITER ;

-- Actualizar datos de un libro
DELIMITER //
CREATE PROCEDURE actualizar_libro(
    IN libro_id INT,
    IN nuevo_titulo VARCHAR(150),
    IN nuevo_autor VARCHAR(100),
    IN nuevo_anio INT,
    IN nueva_cantidad INT,
    IN nuevo_isbn VARCHAR(20),
    IN nuevo_estado VARCHAR(20)
)
BEGIN
    UPDATE book
    SET title = nuevo_titulo,
        author = nuevo_autor,
        publication_year = nuevo_anio,
        available_quantity = nueva_cantidad,
        isbn = nuevo_isbn,
        status = nuevo_estado
    WHERE id_book = libro_id;
END //
DELIMITER ;

-- Eliminar un préstamo por ID
DELIMITER //
CREATE PROCEDURE eliminar_prestamo(
    IN prestamo_id INT
)
BEGIN
    DELETE FROM loan_history WHERE loan_id = prestamo_id;
    DELETE FROM loan WHERE id_loan = prestamo_id;
END //
DELIMITER ;

-- Obtener todos los estudiantes registrados
DELIMITER //
CREATE PROCEDURE obtener_estudiantes()
BEGIN
    SELECT s.id_student, p.full_name, p.email, s.grade
    FROM student s
    JOIN person p ON s.person_id = p.id_person;
END //
DELIMITER ;

-- Insertar nuevo libro
DELIMITER //
CREATE PROCEDURE insertar_libro(
    IN titulo VARCHAR(150),
    IN autor VARCHAR(100),
    IN anio_publicacion INT,
    IN cantidad INT,
    IN isbn_codigo VARCHAR(20),
    IN estado VARCHAR(20)
)
BEGIN
    INSERT INTO book(title, author, publication_year, available_quantity, isbn, status)
    VALUES (titulo, autor, anio_publicacion, cantidad, isbn_codigo, estado);
END //
DELIMITER ;

 -- Actualizar el estado de un préstamo (devuelto o no)
 DELIMITER //
CREATE PROCEDURE actualizar_estado_prestamo(
    IN id_prestamo INT,
    IN devuelto BOOLEAN
)
BEGIN
    UPDATE loan
    SET returned = devuelto
    WHERE id_loan = id_prestamo;
END //
DELIMITER ;

-- Eliminar una notificación por ID

DELIMITER //
CREATE PROCEDURE eliminar_notificacion(
    IN id_notificacion INT
)
BEGIN
    DELETE FROM notification WHERE id_notification = id_notificacion;
END //
DELIMITER ;

-- Seleccionar libros por categoría
DELIMITER //
CREATE PROCEDURE obtener_libros_por_categoria(
    IN nombre_categoria VARCHAR(50)
)
BEGIN
    SELECT b.title, b.author, b.status
    FROM book b
    JOIN book_category bc ON b.id_book = bc.book_id
    JOIN category c ON bc.category_id = c.id_category
    WHERE c.name = nombre_categoria;
END //
DELIMITER ;

-- Insertar nueva configuración del sistema
DELIMITER //
CREATE PROCEDURE insertar_configuracion(
    IN clave VARCHAR(50),
    IN valor TEXT,
    IN descripcion TEXT
)
BEGIN
    INSERT INTO system_config(config_key, config_value, description)
    VALUES (clave, valor, descripcion);
END //
DELIMITER ;

-- Seleccionar historial de un préstamo
DELIMITER //
CREATE PROCEDURE obtener_historial_prestamo(
    IN id_prestamo INT
)
BEGIN
    SELECT registered_at, action
    FROM loan_history
    WHERE loan_id = id_prestamo
    ORDER BY registered_at DESC;
END //
DELIMITER ;