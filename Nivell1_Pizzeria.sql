# Create and select database
DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provincias (
id_provincia INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
PRIMARY KEY(id_provincia)
);

CREATE TABLE localidades (
    id_localidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    provincia_id INT,
    PRIMARY KEY(id_localidad),
    FOREIGN KEY (provincia_id) REFERENCES provincias(id_provincia)
); 

CREATE TABLE tiendas (
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

CREATE TABLE pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    logistica ENUM("reparto domicilio", "recogida tienda") NOT NULL,
    cantidad INT NOT NULL,
    precio_total FLOAT NOT NULL,
    cliente_id INT NOT NULL,
    tienda_id INT NOT NULL,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
    FOREIGN KEY (tienda_id) REFERENCES tiendas(id_tienda)
    
);

CREATE TABLE categorias_pizza (
    id_categoria_pizza INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_categoria_pizza)
);

CREATE TABLE pizzas
(
	id_pizza INT NOT NULL AUTO_INCREMENT,
    categoria_pizza_id INT,
    PRIMARY KEY (id_pizza),
    FOREIGN KEY(categoria_pizza_id) 
    REFERENCES categorias_pizza(id_categoria_pizza)
);

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    tipo ENUM("pizzes", "hamburgueses", "begudes"),
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    imagen BLOB NOT NULL,
    precio FLOAT(2) NOT NULL,
    pedido_id INT,
    pizza_id INT,
    PRIMARY KEY(id_producto),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id_pizza)
);

CREATE TABLE articulos_comprados (
    id_articulo_comprado INT NOT NULL AUTO_INCREMENT,
    cantidad INT NOT NULL,
    nombre VARCHAR(30),
    PRIMARY KEY(id_articulo_comprado),
    pedido_id INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido)
);

CREATE TABLE empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    NIF VARCHAR(30) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    tipo_empleado ENUM("cocinero","repartidor"),
    tienda_id INT,
    PRIMARY KEY(id_empleado),
    FOREIGN KEY (tienda_id) REFERENCES tiendas(id_tienda)
);

CREATE TABLE entregas ( 
    id_entrega INT NOT NULL AUTO_INCREMENT,
    pedido_id INT,
    empleado_id INT,
    fecha_entrega DATE,
    hora_entrega TIME,
    PRIMARY KEY (id_entrega),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id_empleado)
);

INSERT INTO provincias (nombre)
VALUES ("Barcelona");

INSERT INTO localidades (nombre, provincia_id)
VALUES ("Barcelona","1");
INSERT INTO tiendas (direccion, codigo_postal, localidad_id)
VALUES ("Rambla de Poblenou 20","80001", 1);
INSERT INTO empleados (nombre, apellidos, NIF, telefono, tipo_empleado, tienda_id)
VALUES ("Pepito","Grillo", "10111222A", "656565656", "cocinero", "1");
INSERT INTO clientes (nombre, apellidos, direccion, codigo_postal, localidad_id, telefono, email, fecha_registro)
VALUES ("Aguacate", "Perez", "Ramblas del Born 1", "08002", "1", 636363636, "aguacate@gmail.com", "2021-01-01");
INSERT INTO pedidos (fecha, hora, logistica, cantidad, precio_total, cliente_id, tienda_id)
VALUES ("2021-01-01","15:00:00","recogida tienda", "1", "10.00", "1", "1");
INSERT INTO articulos_comprados (cantidad, nombre, pedido_id)
VALUES ("1","begudes", "1");

SELECT COUNT(pr.tipo) as "begudes", l.nombre as "ciudad" FROM localidades l JOIN clientes c ON l.id_localidad = c.localidad_id JOIN pedidos pe ON c.id_cliente = pe.cliente_id JOIN productos pr ON pe.id_pedido = pr.pedido_id WHERE l.nombre = "Barcelona";
SELECT e.nombre as "empleado", COUNT(p.id_pedido) as "pedidos_totales" FROM empleados e JOIN tiendas t ON e.tienda_id = t.id_tienda JOIN pedidos p ON t.id_tienda = p.tienda_id WHERE e.nombre = "Pepito";


