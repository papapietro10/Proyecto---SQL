CREATE SCHEMA `elrincondeldeporte` ;

USE elrincondeldeporte;

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
