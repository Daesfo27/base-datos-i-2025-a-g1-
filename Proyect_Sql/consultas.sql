-- Consultas sql 10 

-- Listar todos los libros disponibles con sus cantidades:

SELECT title, author, available_quantity
FROM book
WHERE status = 'Disponible';

-- Obtener el historial de préstamos de un estudiante específico (por su ID):

SELECT lh.registered_at, lh.action, b.title
FROM loan_history lh
JOIN loan l ON lh.loan_id = l.id_loan
JOIN book b ON l.book_id = b.id_book
WHERE l.student_id = 1
ORDER BY lh.registered_at DESC;

-- Mostrar los préstamos activos (no devueltos) con nombre del estudiante y título del libro:

SELECT p.full_name, b.title, l.loan_date, l.return_date
FROM loan l
JOIN student s ON l.student_id = s.id_student
JOIN person p ON s.person_id = p.id_person
JOIN book b ON l.book_id = b.id_book
WHERE l.returned = FALSE;

-- Listar estudiantes con notificaciones recientes:
SELECT p.full_name, n.message, n.sent_at
FROM notification n
JOIN student s ON n.student_id = s.id_student
JOIN person p ON s.person_id = p.id_person
ORDER BY n.sent_at DESC;

-- Obtener la cantidad total de libros por categoría:
SELECT c.name AS category, COUNT(bc.book_id) AS total_books
FROM category c
JOIN book_category bc ON c.id_category = bc.category_id
GROUP BY c.name;

-- Cantidad de préstamos realizados por cada estudiante:
SELECT p.full_name, COUNT(l.id_loan) AS total_loans
FROM loan l
JOIN student s ON l.student_id = s.id_student
JOIN person p ON s.person_id = p.id_person
GROUP BY p.full_name
ORDER BY total_loans DESC;

-- Libros más prestados:
SELECT b.title, COUNT(l.id_loan) AS times_loaned
FROM loan l
JOIN book b ON l.book_id = b.id_book
GROUP BY b.title
ORDER BY times_loaned DESC
LIMIT 5;

-- Listar todas las configuraciones del sistema:
SELECT config_key, config_value, description
FROM system_config;

-- Mostrar los módulos disponibles y qué roles tienen acceso a ellos:
SELECT m.name AS module, r.name AS role
FROM module_role mr
JOIN module m ON mr.module_id = m.id_module
JOIN role r ON mr.role_id = r.id_role;

-- Listar usuarios, sus roles y datos personales:
SELECT u.username, r.name AS role, p.full_name, p.email
FROM user u
JOIN role_user ru ON u.id_user = ru.user_id
JOIN role r ON ru.role_id = r.id_role
JOIN person p ON u.person_id = p.id_person;