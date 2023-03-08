#Vista de productos disponibles con su cantidad en stock y precio:

CREATE VIEW productos_disponibles AS
SELECT id, nombre, descripcion, precio, stock
FROM Productos
WHERE stock > 0;

SELECT * FROM productos_disponibles;

#Vista de pedidos con el nombre y apellido del cliente que los realizó:

CREATE VIEW pedidos_con_cliente AS
SELECT Pedidos.id, Pedidos.fecha, Pedidos.total, Clientes.nombre, Clientes.apellido
FROM Pedidos
INNER JOIN Clientes ON Pedidos.id_cliente = Clientes.id;

SELECT * FROM pedidos_con_cliente;


#Vista de proveedores y los productos que les compran:

CREATE VIEW proveedores_y_productos AS
SELECT Proveedores.nombre AS proveedor, Productos.nombre AS producto
FROM Proveedores
INNER JOIN Productos_Proveedores ON Proveedores.id = Productos_Proveedores.id_proveedor
INNER JOIN Productos ON Productos_Proveedores.id_producto = Productos.id;

SELECT * FROM proveedores_y_productos;

#Vista de empleados con sus pedidos realizados:

CREATE VIEW empleados_con_pedidos AS
SELECT Empleados.id, Empleados.nombre, Empleados.apellido, Pedidos.id AS id_pedido, Pedidos.fecha, Pedidos.total
FROM Empleados
INNER JOIN Empleados_Pedidos ON Empleados.id = Empleados_Pedidos.id_empleado
INNER JOIN Pedidos ON Empleados_Pedidos.id_pedido = Pedidos.id;

SELECT * FROM empleados_con_pedidos;

#Vista de los productos que se han comprado en cada pedido:

CREATE VIEW productos_por_pedido AS
SELECT Pedidos.id AS id_pedido, Productos_Pedidos.id_producto, Productos.nombre AS nombre_producto, Productos_Pedidos.cantidad
FROM Pedidos
INNER JOIN Productos_Pedidos ON Pedidos.id = Productos_Pedidos.id_pedido
INNER JOIN Productos ON Productos_Pedidos.id_producto = Productos.id;


SELECT * FROM productos_por_pedido;
