-- Crear una nueva base de datos
CREATE DATABASE IF NOT EXISTS bitacora_savepoint;

-- Usar la base de datos recién creada
USE bitacora_savepoint;

-- Crear una tabla para simular una bitácora
CREATE TABLE IF NOT EXISTS bitacora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    saldo DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo
INSERT INTO clientes (nombre, saldo) VALUES
('Cliente 1', 1000.00),
('Cliente 2', 2000.00),
('Cliente 3', 3000.00);


SAVEPOINT antes_actualizacion;

-- Actualizar el saldo de un cliente
UPDATE clientes SET saldo = saldo - 500 WHERE id = 1;

-- Insertar el registro en la bitácora
INSERT INTO bitacora (accion) VALUES ('Se actualizó el saldo del cliente 1');

-- Mostrar los clientes actualizados
SELECT * FROM clientes;

-- Si necesitas revertir los cambios hasta el savepoint
-- ROLLBACK TO SAVEPOINT antes_actualizacion;

-- Si deseas confirmar los cambios
-- COMMIT;


