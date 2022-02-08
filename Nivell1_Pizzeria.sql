# Create and select database
DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE IF NOT EXISTS provincias (
id_provincia INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
PRIMARY KEY(id_provincia)
);

CREATE TABLE IF NOT EXISTS localidades (
    id_localidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    provincia_id INT,
    PRIMARY KEY(id_localidad),
    FOREIGN KEY (provincia_id) REFERENCES provincias(id_provincia)
); 

CREATE TABLE IF NOT EXISTS tiendas (
    id_tienda INT NOT NULL AUTO_INCREMENT,
    direccion VARCHAR(30) NOT NULL,
    codigo_postal INT NOT NULL,
    localidad_id INT,
    PRIMARY KEY(id_tienda),
    FOREIGN KEY (localidad_id) REFERENCES localidades(id_localidad)
);

CREATE TABLE clientes
(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    codigo_postal INT NOT NULL,
    localidad_id INT NOT NULL,
    telefono INT,
    email VARCHAR(30),
    fecha_registro DATE,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY (localidad_id) REFERENCES localidades(id_localidad)
);

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    imagen BLOB NOT NULL,
    precio FLOAT(2) NOT NULL,
    PRIMARY KEY(id_producto)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    a_domicilio BOOLEAN NOT NULL,
    cliente_id INT NOT NULL,
    tienda_id INT NOT NULL,
    producto_id INT NOT NULL,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
    FOREIGN KEY (tienda_id) REFERENCES tiendas(id_tienda),
    FOREIGN KEY (producto_id) REFERENCES productos(id_producto222)
    
);

CREATE TABLE IF NOT EXISTS articulos_comprados (
    id_articulo_comprado INT NOT NULL AUTO_INCREMENT,
    cantidad INT NOT NULL,
    nombre VARCHAR(30),
    PRIMARY KEY(id_articulo_comprado),
    pedido_id INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)
);

CREATE TABLE IF NOT EXISTS categoria_pizza (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    producto_id INT,
    PRIMARY KEY(id_categoria),
    FOREIGN KEY (producto_id) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    NIF INT NOT NULL,
    telefono INT NOT NULL,
    cocinero BOOLEAN NOT NULL,
    tienda_id INT,
    PRIMARY KEY(id_empleado),
    FOREIGN KEY (tienda_id) REFERENCES tiendas(id_tienda)
);

CREATE TABLE IF NOT EXISTS entregas ( 
    id_entrega INT NOT NULL AUTO_INCREMENT,
    pedido_id INT,
    empleado_id INT,
    fecha_entrega DATE,
    hora_entrega TIME,
    PRIMARY KEY (id_entrega),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id_empleado)
    
);