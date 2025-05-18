-- Consultas sql 10 


-- Muestra todos los préstamos con el nombre completo del estudiante que realizó cada préstamo

SELECT p.id_loan, e.full_name AS estudiante, p.loan_date, p.return_date
FROM loan p
JOIN student e ON p.student_id = e.id_student;

 -- Muestra los detalles de cada préstamo con el título del libro y la cantidad disponible

SELECT p.id_loan, b.title AS libro, b.cantidad_disponible
FROM loan p
JOIN book b ON p.book_id = b.id_book;

 -- Lista los libros prestados junto con sus categorías


SELECT b.title AS libro, c.name AS categoria
FROM loan p
JOIN book b ON p.book_id = b.id_book
JOIN book_category bc ON b.id_book = bc.book_id
JOIN category c ON bc.category_id = c.id_category;

-- Muestra la información de todas las notificaciones enviadas con el nombre del estudiante

SELECT n.id_notification, e.full_name AS estudiante, n.message, n.date
FROM notification n
JOIN student e ON n.student_id = e.id_student;

-- Muestra el historial de préstamos con el estado y la fecha del estado para cada préstamo

SELECT hp.loan_id, hp.status, hp.status_date
FROM loan_history hp;

 -- Compara para cada libro la cantidad disponible y la cantidad prestada (cantidad de préstamos activos)

SELECT b.title AS libro,
       b.cantidad_disponible,
       COUNT(p.id_loan) AS cantidad_prestada
FROM book b
LEFT JOIN loan p ON b.id_book = p.book_id
GROUP BY b.title, b.cantidad_disponible;

-- Muestra la configuración actual del sistema

SELECT nombre_parametro, valor_parametro
FROM system_configuration;

 -- Lista todos los estudiantes junto con el número de préstamos activos que tienen

SELECT e.full_name AS estudiante, COUNT(p.id_loan) AS prestamos_activos
FROM student e
LEFT JOIN loan p ON e.id_student = p.student_id
GROUP BY e.full_name;

-- Muestra todos los libros junto con sus categorías (lista todos, aunque no tengan categoría asignada)

SELECT b.title AS libro, c.name AS categoria
FROM book b
LEFT JOIN book_category bc ON b.id_book = bc.book_id
LEFT JOIN category c ON bc.category_id = c.id_category;

 -- Muestra los libros más prestados (los que tienen más registros en préstamos)
 
SELECT b.title AS libro, COUNT(p.id_loan) AS total_prestamos
FROM book b
JOIN loan p ON b.id_book = p.book_id
GROUP BY b.title
ORDER BY total_prestamos DESC
LIMIT 10;