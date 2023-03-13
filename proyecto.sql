#CREAR SCHERMA

CREATE SCHEMA `elrincondeldeporte` ;

# SELECCIONAR SCHERMA

USE elrincondeldeporte;


# CREACION DE TABLAS

CREATE TABLE Productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL
);

CREATE TABLE Clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  id_cliente INT NOT NULL,

  FOREIGN KEY (id_cliente) REFERENCES Clientes(id)

);

CREATE TABLE Empleados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  cargo VARCHAR(255) NOT NULL,
  salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Proveedores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  direccion VARCHAR(255) NOT NULL,
  telefono VARCHAR(255) NOT NULL,
  correo VARCHAR(255) NOT NULL
);

CREATE TABLE Productos_Pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  id_pedido INT NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES Productos(id),
  FOREIGN KEY (id_pedido) REFERENCES Pedidos(id)
);

CREATE TABLE Empleados_Pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  id_pedido INT NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES Empleados(id),
  FOREIGN KEY (id_pedido) REFERENCES Pedidos(id)
);

CREATE TABLE Productos_Proveedores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  id_proveedor INT NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES Productos(id),
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id)
);



# INSERTAR DATOS


#EMPLEADOS
INSERT INTO Empleados (nombre, apellido, cargo, salario)
VALUES
("Pedro", "duboy", "CO", 9800.00),
  ("Carlos", "Gomez", "Gerente", 9000.00),
  ("María", "Hernández", "Asistente", 2200.00),
  ("Luis", "Sánchez", "Cajero", 1900.00),
  ("Ana", "Ramírez", "Vendedor", 2500.00),
  ("Pedro", "Martínez", "Almacenero", 1800.00);


#PROVEEDORES
INSERT INTO Proveedores (nombre, direccion, telefono, correo)
VALUES
  ("Distribuidora Ropa S.A.", "Calle 123, Ciudad", "555-1234", "info@distribuidoraropa.com"),
  ("Fabricante Modas S.A.", "Avenida 456, Pueblo", "555-5678", "ventas@fabricantemodas.com"),
  ("Importadora Textiles S.A.", "Boulevard 789, Villa", "555-9012", "info@importadoratextiles.com"),
  ("Mayorista Ropa y Accesorios S.A.", "Carrera 1011, Poblado", "555-3456", "ventas@mayoristaropayaccesorios.com"),
  ("Tienda de Ropa Local S.A.", "Callejón 1213, Paraje", "555-7890", "info@tiendaderopalocal.com");


#CLIENTES
INSERT INTO Clientes (nombre, apellido, email, direccion)
VALUES
  ("Ana", "García", "ana.garcia@email.com", "Calle 123, Ciudad"),
  ("Juan", "Pérez", "juan.perez@email.com", "Avenida 456, Pueblo"),
  ("María", "López", "maria.lopez@email.com", "Boulevard 789, Villa"),
  ("Pedro", "González", "pedro.gonzalez@email.com", "Carrera 1011, Poblado"),
  ("Laura", "Martínez", "laura.martinez@email.com", "Callejón 1213, Paraje"),
  ("Miguel", "Fernández", "miguel.fernandez@email.com", "Avenida 1415, Colonia"),
  ("Paola", "Gutiérrez", "paola.gutierrez@email.com", "Boulevard 1617, Urbanización"),
  ("Andrés", "Vargas", "andres.vargas@email.com", "Calle 1819, Comunidad"),
  ("Carla", "Sánchez", "carla.sanchez@email.com", "Carrera 2021, Zona"),
  ("Santiago", "Hernández", "santiago.hernandez@email.com", "Calle 2223, Residencia"),
  ("Alejandra", "Romero", "alejandra.romero@email.com", "Avenida 2425, Conjunto"),
  ("Roberto", "Díaz", "roberto.diaz@email.com", "Boulevard 2627, Edificio"),
  ("Estefanía", "Pérez", "estefania.perez@email.com", "Calle 2829, Ranchería"),
  ("Fabiola", "Ruiz", "fabiola.ruiz@email.com", "Avenida 3031, Sector"),
  ("Gabriel", "Sosa", "gabriel.sosa@email.com", "Carrera 3233, Conjunto"),
  ("Lucía", "González", "lucia.gonzalez@email.com", "Boulevard 3435, Condominio"),
  ("Javier", "Castillo", "javier.castillo@email.com", "Calle 3637, Localidad"),
  ("Cristina", "Díaz", "cristina.diaz@email.com", "Avenida 3839, Barrio"),
  ("Eduardo", "García", "eduardo.garcia@email.com", "Carrera 4041, Ranchería"),
  ("Marisol", "Torres", "marisol.torres@email.com", "Boulevard 4243, Conjunto");

#PRODUCTOS
INSERT INTO Productos (nombre, descripcion, precio, stock) VALUES
('Camiseta básica blanca', 'Camiseta de algodón básica blanca de manga corta', 12.99, 50),
('Jeans ajustados negros', 'Jeans ajustados negros de tiro medio', 39.99, 30),
('Chaqueta de cuero marrón', 'Chaqueta de cuero marrón de corte ajustado', 149.99, 10),
('Zapatillas deportivas blancas', 'Zapatillas deportivas blancas de cuero y tela', 49.99, 25),
('Suéter de lana gris', 'Suéter de lana gris con cuello redondo', 59.99, 20),
('Vestido maxi floral', 'Vestido maxi floral de manga corta', 89.99, 15),
('Pantalones cortos de mezclilla', 'Pantalones cortos de mezclilla azul oscuro con bordado', 29.99, 35),
('Camisa de vestir blanca', 'Camisa de vestir blanca de algodón con cuello italiano', 79.99, 12),
('Botines de cuero negro', 'Botines de cuero negro con tacón bajo', 119.99, 8),
('Falda midi plisada', 'Falda midi plisada de satén rosa pálido', 69.99, 18),
('Chaqueta de mezclilla negra', 'Chaqueta de mezclilla negra con bordados florales', 99.99, 7),
('Camiseta gráfica', 'Camiseta de algodón con estampado gráfico y cuello redondo', 19.99, 40),
('Leggings negros', 'Leggings negros de compresión', 29.99, 30),
('Jersey de cuello alto', 'Jersey de lana de cuello alto gris', 79.99, 12),
('Pantalones de chándal', 'Pantalones de chándal de algodón gris', 39.99, 25),
('Abrigo de lana gris', 'Abrigo de lana gris con cinturón', 129.99, 8),
('Top sin mangas', 'Top sin mangas de seda rojo oscuro', 49.99, 20),
('Camiseta de rayas', 'Camiseta de algodón con rayas azul y blanca', 24.99, 35),
('Blusa de seda', 'Blusa de seda blanca con cuello alto', 89.99, 15),
('Chaqueta de bombardero', 'Chaqueta de bombardero de cuero negro con forro de piel', 199.99, 5),
('Camisa de mezclilla', 'Camisa de mezclilla de manga larga y corte regular', 69.99, 18),
('Pantalones de cuero', 'Pantalones de cuero negro de tiro alto', 149.99, 10),
('Vestido de cóctel negro', 'Vestido de cóctel negro con cuello halter', 129.99, 8);


#PEDIDOS
INSERT INTO Pedidos (fecha, total, id_cliente)
VALUES
  ("2023-01-01", 128.57, 1),
  ("2023-01-03", 83.99, 2),
  ("2023-01-15", 184.75, 3),
  ("2023-01-22", 64.32, 4),
  ("2023-01-10", 219.50, 5),
  ("2023-01-11", 92.20, 6),
  ("2023-01-19", 175.00, 7),
  ("2023-01-27", 51.45, 8),
  ("2023-01-08", 301.80, 9),
  ("2023-01-14", 77.30, 10),
  ("2023-01-20", 91.99, 11),
  ("2023-01-25", 240.00, 12),
  ("2023-01-05", 162.75, 13),
  ("2023-01-15", 87.50, 14),
  ("2023-01-20", 300.10, 15),
  ("2023-01-28", 66.25, 16),
  ("2023-01-16", 120.30, 17),
  ("2023-01-19", 210.50, 18),
  ("2023-01-25", 76.00, 19),
  ("2023-01-30", 179.90, 20);

 
  #PRODUCTOS + PEDIDOS + CANTIDAD
  INSERT INTO Productos_Pedidos (id_producto, id_pedido, cantidad)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 4),
(10, 10, 1),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 2),
(16, 16, 1),
(17, 17, 2),
(18, 18, 3),
(19, 19, 4),
(20, 20, 1);


#EMPLEADOS + PEDIDOS
INSERT INTO Empleados_Pedidos (id_empleado, id_pedido)
VALUES (5, 1),
        (5, 2),
        (5, 3),
        (5, 4),
        (5, 5),
        (5, 6),
        (5, 7),
        (5, 8),
        (5, 9),
        (5, 10),
        (5, 11),
        (5, 12),
        (5, 13),
        (5, 14),
        (5, 15),
        (5, 16),
        (5, 17),
        (5, 18),
        (5, 19),
        (5, 20);


#PRODUCTO + PROVEEDOR
INSERT INTO Productos_Proveedores (id_producto, id_proveedor)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 2),
  (6, 2),
  (7, 2),
  (8, 2),
  (9, 3),
  (10, 3),
  (11, 3),
  (12, 3),
  (13, 3),
  (14, 4),
  (15, 4),
  (16, 4),
  (17, 4),
  (18, 5),
  (19, 5),
  (20, 5);
  

SELECT * FROM Clientes;

SELECT * FROM Empleados;

SELECT * FROM Empleados_Pedidos;

SELECT * FROM Pedidos;

SELECT * FROM Productos;

SELECT * FROM Productos_Pedidos;

SELECT * FROM Productos_Proveedores;

SELECT * FROM Proveedores;



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

# función 1
select elrincondeldeporte.num_productos_mas_caros(20);

# función 2
select elrincondeldeporte.nuevo_cliente('Agus', 'rita', 'agusrita@gmail.com', 'Argentina');

# función 3
select elrincondeldeporte.salario_promedio_por_cargo('Gerente');

# función 4
select elrincondeldeporte.nuevo_proveedor('supply', 'argentina', '1122233444', 'supply@hotmail.com');
