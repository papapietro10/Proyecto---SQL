# 1 DETERMINISTIC: Esta función devuelve la cantidad de productos en stock con un precio mayor a cierto valor dado como argumento.

CREATE FUNCTION `num_productos_mas_caros` (precio_min DECIMAL(10,2))
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE num_prod INT;
    SELECT COUNT(*) INTO num_prod FROM Productos WHERE precio > precio_min AND stock > 0;
    RETURN num_prod;
END

# función 1
select elrincondeldeporte.num_productos_mas_caros(20);



# 2 NO SQL: Esta función inserta un nuevo cliente en la tabla de clientes.

CREATE FUNCTION `nuevo_cliente` (nom VARCHAR(255), ape VARCHAR(255), ema VARCHAR(255), dir VARCHAR(255))
RETURNS BOOLEAN NO SQL
BEGIN
    INSERT INTO Clientes (nombre, apellido, email, direccion) VALUES (nom, ape, ema, dir);
    RETURN TRUE;
END

# función 2
select elrincondeldeporte.nuevo_cliente('Agus', 'rita', 'agusrita@gmail.com', 'Argentina');



# 3 DETERMINISTIC: Esta función devuelve el salario promedio de los empleados que tienen un cargo dado como argumento.

CREATE FUNCTION `salario_promedio_por_cargo` (car VARCHAR(255))
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE prom DECIMAL(10,2);
    SELECT AVG(salario) INTO prom FROM Empleados WHERE cargo = car;
    IF prom IS NULL THEN
        SET prom = 0;
    END IF;
    RETURN prom;
END

# función 3
select elrincondeldeporte.salario_promedio_por_cargo('Gerente');



# 4 NO SQL: Esta función inserta un nuevo proveedor en la tabla de proveedores.


CREATE FUNCTION `nuevo_proveedor` (nom VARCHAR(255), dir VARCHAR(255), tel VARCHAR(255), cor VARCHAR(255))
RETURNS BOOLEAN NO SQL
BEGIN
    INSERT INTO Proveedores (nombre, direccion, telefono, correo) VALUES (nom, dir, tel, cor);
    RETURN TRUE;
END

# función 4
select elrincondeldeporte.nuevo_proveedor('supply', 'argentina', '1122233444', 'supply@hotmail.com');