# Create and select database
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica; 

CREATE TABLE IF NOT EXISTS proveedores
(
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre_proveedor VARCHAR(12),
    telefono_proveedor CHARACTER(9),
    fax_proveedor INT,
    NIF_proveedor INT,
    PRIMARY KEY(id_proveedor)
);

CREATE TABLE IF NOT EXISTS direcciones (
    id_direccion INT NOT NULL AUTO_INCREMENT,
    calle VARCHAR(30),
    numero INT,
    piso INT,
    puerta VARCHAR(5),
    ciudad VARCHAR(30),
    codigo_postal VARCHAR(5),
    pais VARCHAR(30),
    proveedor_id INT,
    PRIMARY KEY(id_direccion),
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS gafas
(
    id_gafa INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(30),
    graduacion_izq FLOAT(2),
    graduacion_der FLOAT(2),
    tipo_montura VARCHAR(8),
    color_montura VARCHAR(12),
    color_cristales VARCHAR(12),
    precio FLOAT(2),
    cantidad INT,
    proveedor_id INT,
    PRIMARY KEY(id_gafa),
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS clientes
(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(30),
    direccion_cliente VARCHAR(60),
    telefono_cliente CHARACTER(9),
    email_cliente VARCHAR(30),
    fecha_registro DATE,
    recomendado_por VARCHAR(20),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS ventas
(
    order_id CHARACTER(20) NOT NULL,
    empleado_venta VARCHAR(20),
    fecha_venta DATE,
    cantidad INT,
    cliente_id INT,
    gafa_id INT,
    PRIMARY KEY(order_id),
    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id_cliente),
    FOREIGN KEY (gafa_id)
    REFERENCES gafas(id_gafa)
);