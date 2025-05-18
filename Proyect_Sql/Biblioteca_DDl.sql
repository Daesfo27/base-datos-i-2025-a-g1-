DROP DATABASE IF EXISTS biblioteca_db;
CREATE DATABASE biblioteca_db;
USE biblioteca_db;

-- Seguridad y usuarios
CREATE TABLE person (
    id_person INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    person_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES person(id_person)
);

CREATE TABLE role (
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE role_user (
    id_role_user INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id_user),
    FOREIGN KEY (role_id) REFERENCES role(id_role)
);

CREATE TABLE module (
    id_module INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE module_role (
    id_module_role INT PRIMARY KEY AUTO_INCREMENT,
    module_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (module_id) REFERENCES module(id_module),
    FOREIGN KEY (role_id) REFERENCES role(id_role)
);

CREATE TABLE form (
    id_form INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL
);

CREATE TABLE form_module (
    id_form_module INT PRIMARY KEY AUTO_INCREMENT,
    form_id INT NOT NULL,
    module_id INT NOT NULL,
    FOREIGN KEY (form_id) REFERENCES form(id_form),
    FOREIGN KEY (module_id) REFERENCES module(id_module)
);

-- Entidades de biblioteca
CREATE TABLE student (
    id_student INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    grade VARCHAR(10),
    enrollment_code VARCHAR(20),
    FOREIGN KEY (person_id) REFERENCES person(id_person)
);

CREATE TABLE book (
    id_book INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    author VARCHAR(100),
    publication_year INT,
    available_quantity INT,
    isbn VARCHAR(20),
    status VARCHAR(20) -- Disponible, Prestado, Atrasado
);

CREATE TABLE category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    description TEXT
);

CREATE TABLE book_category (
    id_book_category INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book(id_book),
    FOREIGN KEY (category_id) REFERENCES category(id_category)
);

CREATE TABLE loan (
    id_loan INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    student_id INT NOT NULL,
    loan_date DATE,
    return_date DATE,
    returned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (book_id) REFERENCES book(id_book),
    FOREIGN KEY (student_id) REFERENCES student(id_student)
);

CREATE TABLE loan_history (
    id_history INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(50),
    FOREIGN KEY (loan_id) REFERENCES loan(id_loan)
);

CREATE TABLE notification (
    id_notification INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    message TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(id_student)
);

CREATE TABLE system_config (
    id_config INT PRIMARY KEY AUTO_INCREMENT,
    config_key VARCHAR(50),
    config_value TEXT,
    description TEXT
);