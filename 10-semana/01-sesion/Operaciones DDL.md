

1–10: Tabla persona
-- INSERT
INSERT INTO persona (id, nombre, apellido, correo, telefono) VALUES (1, 'Carlos', 'Ramírez', 'carlos@gmail.com', '3214567890');
INSERT INTO persona (id, nombre, apellido, correo, telefono) VALUES (2, 'Laura', 'Gómez', 'laura@gmail.com', '3107894561');
-- UPDATE
UPDATE persona SET correo = 'carlos.ramirez@gmail.com' WHERE id = 1;
UPDATE persona SET telefono = '3119998877' WHERE id = 2;
-- DELETE
DELETE FROM persona WHERE id = 2;

-- INSERT (3 personas más)
INSERT INTO persona (id, nombre, apellido, correo, telefono) VALUES (3, 'Ana', 'Morales', 'ana@hotmail.com', '3201234567');
INSERT INTO persona (id, nombre, apellido, correo, telefono) VALUES (4, 'Jorge', 'Pérez', 'jorge@outlook.com', '3001112223');
INSERT INTO persona (id, nombre, apellido, correo, telefono) VALUES (5, 'Diana', 'Salas', 'diana@correo.com', '3154443322');

-- UPDATE
UPDATE persona SET nombre = 'Ana María' WHERE id = 3;
-- DELETE
DELETE FROM persona WHERE id = 5;


---

## 11–20: Tabla cliente
-- INSERT
INSERT INTO cliente (id, persona_id, codigo, direccion_id) VALUES (1, 1, 1001, 1);
INSERT INTO cliente (id, persona_id, codigo, direccion_id) VALUES (2, 3, 1002, 2);
-- UPDATE
UPDATE cliente SET codigo = 1010 WHERE id = 1;
UPDATE cliente SET direccion_id = 3 WHERE id = 2;
-- DELETE
DELETE FROM cliente WHERE id = 2;

-- INSERT (3 clientes más)
INSERT INTO cliente (id, persona_id, codigo, direccion_id) VALUES (3, 4, 1003, 3);
INSERT INTO cliente (id, persona_id, codigo, direccion_id) VALUES (4, 5, 1004, 4);
INSERT INTO cliente (id, persona_id, codigo, direccion_id) VALUES (5, 2, 1005, 5);

-- UPDATE
UPDATE cliente SET codigo = 2001 WHERE id = 3;
-- DELETE
DELETE FROM cliente WHERE id = 5;


---

## 21–30: Tabla empleado
-- INSERT
INSERT INTO empleado (id, persona_id, salario, tipo_contrato) VALUES (1, 1, 3200, 'fijo');
INSERT INTO empleado (id, persona_id, salario, tipo_contrato) VALUES (2, 4, 2800, 'temporal');
-- UPDATE
UPDATE empleado SET salario = 3500 WHERE id = 1;
UPDATE empleado SET tipo_contrato = 'indefinido' WHERE id = 2;
-- DELETE
DELETE FROM empleado WHERE id = 2;

-- INSERT (3 empleados más)
INSERT INTO empleado (id, persona_id, salario, tipo_contrato) VALUES (3, 3, 3100, 'fijo');
INSERT INTO empleado (id, persona_id, salario, tipo_contrato) VALUES (4, 5, 2700, 'temporal');
INSERT INTO empleado (id, persona_id, salario, tipo_contrato) VALUES (5, 2, 2900, 'fijo');

-- UPDATE
UPDATE empleado SET salario = salario + 500 WHERE tipo_contrato = 'fijo';
-- DELETE
DELETE FROM empleado WHERE salario < 2900;


---

## 31–40: Tabla vehiculo
-- INSERT
INSERT INTO vehiculo (id, marca, modelo, precio, stock, categoria_id, fecha_fabricacion) VALUES (1, 'Toyota', 'Corolla', 15000, 5, 1, '2022-05-01');
INSERT INTO vehiculo (id, marca, modelo, precio, stock, categoria_id, fecha_fabricacion) VALUES (2, 'Tesla', 'Model 3', 35000, 2, 2, '2023-03-10');
-- UPDATE
UPDATE vehiculo SET precio = 16000 WHERE id = 1;
UPDATE vehiculo SET stock = stock + 3 WHERE id = 2;
-- DELETE
DELETE FROM vehiculo WHERE stock = 0;

-- INSERT (3 vehículos más)
INSERT INTO vehiculo (id, marca, modelo, precio, stock, categoria_id, fecha_fabricacion) VALUES (3, 'Ford', 'Focus', 18000, 6, 1, '2021-10-15');
INSERT INTO vehiculo (id, marca, modelo, precio, stock, categoria_id, fecha_fabricacion) VALUES (4, 'BMW', 'X3', 40000, 1, 3, '2024-01-20');
INSERT INTO vehiculo (id, marca, modelo, precio, stock, categoria_id, fecha_fabricacion) VALUES (5, 'Hyundai', 'Kona', 20000, 4, 2, '2023-06-30');

-- UPDATE
UPDATE vehiculo SET precio = precio * 0.95 WHERE categoria_id = 2;
-- DELETE
DELETE FROM vehiculo WHERE precio > 50000;


---

## 41–50: Tabla factura y detalle_factura
-- INSERT Factura
INSERT INTO factura (id, codigo, fecha, cliente_id, empleado_id, total, valor_descuento, metodo_pago_id) VALUES (1, 'F001', '2025-04-01', 1, 1, 15000, 500, 1);
INSERT INTO factura (id, codigo, fecha, cliente_id, empleado_id, total, valor_descuento, metodo_pago_id) VALUES (2, 'F002', '2025-04-02', 3, 3, 20000, 0, 2);
-- UPDATE
UPDATE factura SET valor_descuento = 1000 WHERE id = 1;
UPDATE factura SET total = total - 1000 WHERE id = 2;
-- DELETE
DELETE FROM factura WHERE id = 2;

-- INSERT Detalle_Factura
INSERT INTO detalle_factura (id, factura_id, vehiculo_id, cantidad, descuento) VALUES (1, 1, 1, 1, 500);
INSERT INTO detalle_factura (id, factura_id, vehiculo_id, cantidad, descuento) VALUES (2, 1, 3, 1, 0);
-- UPDATE
UPDATE detalle_factura SET descuento = 100 WHERE id = 2;
-- DELETE
DELETE FROM detalle_factura WHERE id = 2;
-- INSERT adicional
INSERT INTO detalle_factura (id, factura_id, vehiculo_id, cantidad, descuento) VALUES (3, 1, 4, 2, 1000);

