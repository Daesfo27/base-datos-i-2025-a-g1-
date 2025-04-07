 Tabla Persona
CREATE TABLE persona (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

-- Tabla Dirección
CREATE TABLE direccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT,
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

-- Tabla Cliente
CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT,
    direccion_id INT,
    codigo INT,
    FOREIGN KEY (persona_id) REFERENCES persona(id),
    FOREIGN KEY (direccion_id) REFERENCES direccion(id)
);

-- Tabla Empleado
CREATE TABLE empleado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT,
    codigo VARCHAR(10),
    tipo_contrato VARCHAR(20),
    salario DECIMAL(10,2),
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

-- Tabla Categoría (de vehículos y productos)
CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
);

-- Tabla Vehículo
CREATE TABLE vehiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    precio DECIMAL(10,2),
    fecha_fabricacion DATE,
    stock INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Tabla Producto (accesorios, repuestos, etc.)
CREATE TABLE producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Tabla Inventario (vehículos o productos)
CREATE TABLE inventario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT,
    producto_id INT,
    cantidad INT,
    empleado_id INT,
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id),
    FOREIGN KEY (producto_id) REFERENCES producto(id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id)
);

-- Tabla Método de Pago
CREATE TABLE metodo_pago (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50)
);

-- Tabla Factura
CREATE TABLE factura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    fecha DATE,
    cliente_id INT,
    empleado_id INT,
    metodo_pago_id INT,
    total DECIMAL(12,2),
    valor_descuento DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id),
    FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(id)
);

-- Tabla Detalle_Factura
CREATE TABLE detalle_factura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    factura_id INT,
    vehiculo_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    descuento DECIMAL(10,2),
    FOREIGN KEY (factura_id) REFERENCES factura(id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id),
    FOREIGN KEY (producto_id) REFERENCES producto(id)
);


