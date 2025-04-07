
CLIENTE

-- Cliente con nombre y su ciudad  de a dos para completar 10 o mas-
SELECT p.nombre, d.ciudad
FROM cliente c
INNER JOIN persona p ON c.persona_id = p.id
INNER JOIN direccion d ON c.direccion_id = d.id;

-- Cliente y los vehículos que compró
SELECT p.nombre, v.marca, v.modelo
FROM cliente c
INNER JOIN persona p ON c.persona_id = p.id
INNER JOIN factura f ON f.cliente_id = c.id
INNER JOIN detalle_factura df ON df.factura_id = f.id
INNER JOIN vehiculo v ON v.id = df.vehiculo_id;

EMPLEADO

-- Empleado y su salario con nombre completo
SELECT p.nombre, p.apellido, e.salario
FROM empleado e
INNER JOIN persona p ON e.persona_id = p.id;

-- Empleado y las facturas que ha generado
SELECT p.nombre AS empleado, f.codigo AS factura
FROM empleado e
INNER JOIN persona p ON e.persona_id = p.id
INNER JOIN factura f ON f.empleado_id = e.id;

-- Vehículo y su categoría
SELECT v.marca, v.modelo, c.nombre AS categoria
FROM vehiculo v
INNER JOIN categoria c ON v.categoria_id = c.id;

VEHICULO

-- Vehículo vendido y el cliente que lo compró
SELECT v.marca, v.modelo, p.nombre
FROM vehiculo v
INNER JOIN detalle_factura df ON v.id = df.vehiculo_id
INNER JOIN factura f ON f.id = df.factura_id
INNER JOIN cliente c ON c.id = f.cliente_id
INNER JOIN persona p ON c.persona_id = p.id;

FACTURA

-- Factura con cliente y total
SELECT f.codigo, p.nombre, f.total
FROM factura f
INNER JOIN cliente c ON f.cliente_id = c.id
INNER JOIN persona p ON c.persona_id = p.id;

-- Factura y su método de pago
SELECT f.codigo, mp.tipo AS metodo_pago
FROM factura f
INNER JOIN metodo_pago mp ON f.metodo_pago_id = mp.id;

DETALLE_FACTURA

-- Detalle de factura con información del vehículo
SELECT df.factura_id, v.marca, v.modelo, df.precio_unitario
FROM detalle_factura df
INNER JOIN vehiculo v ON df.vehiculo_id = v.id;

-- Detalle de factura con cliente asociado
SELECT df.id, p.nombre, v.modelo
FROM detalle_factura df
INNER JOIN factura f ON df.factura_id = f.id
INNER JOIN cliente c ON f.cliente_id = c.id
INNER JOIN persona p ON c.persona_id = p.id
INNER JOIN vehiculo v ON df.vehiculo_id = v.id;

PRODUCTO

-- Producto y su categoría
SELECT p.nombre, c.nombre AS categoria
FROM producto p
INNER JOIN categoria c ON p.categoria_id = c.id;

-- Productos facturados por cliente
SELECT pr.nombre AS producto, per.nombre AS cliente
FROM detalle_factura df
INNER JOIN producto pr ON df.producto_id = pr.id
INNER JOIN factura f ON df.factura_id = f.id
INNER JOIN cliente c ON f.cliente_id = c.id
INNER JOIN persona per ON c.persona_id = per.id;

INVENTARIO

-- Vehículo con cantidad en inventario
SELECT v.marca, v.modelo, i.cantidad
FROM inventario i
INNER JOIN vehiculo v ON i.vehiculo_id = v.id;

-- Empleado responsable del inventario (si aplica)
SELECT p.nombre, i.cantidad
FROM inventario i
INNER JOIN empleado e ON i.empleado_id = e.id
INNER JOIN persona p ON e.persona_id = p.id;

METODO PAGO

-- Método de pago utilizado en cada factura
SELECT f.codigo, mp.tipo
FROM factura f
INNER JOIN metodo_pago mp ON f.metodo_pago_id = mp.id;

-- Facturas por método de pago y cliente
SELECT mp.tipo, per.nombre, f.codigo
FROM metodo_pago mp
INNER JOIN factura f ON f.metodo_pago_id = mp.id
INNER JOIN cliente c ON f.cliente_id = c.id
INNER JOIN persona per ON c.persona_id = per.id;

PERSONA

-- Persona que es cliente
SELECT p.nombre, p.apellido
FROM persona p
INNER JOIN cliente c ON c.persona_id = p.id;

-- Persona que es empleado
SELECT p.nombre, e.salario
FROM persona p
INNER JOIN empleado e ON e.persona_id = p.id;

CATEGORIA

-- Vehículos por categoría
SELECT c.nombre AS categoria, v.marca, v.modelo
FROM categoria c
INNER JOIN vehiculo v ON v.categoria_id = c.id;

-- Productos por categoría
SELECT c.nombre AS categoria, p.nombre AS producto
FROM categoria c
INNER JOIN producto p ON p.categoria_id = c.id;