SELECT DISTINCT nombre FROM producto;
SELECT DISTINCT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio as EUR, ROUND(precio*1.15,2) as USD FROM producto;
SELECT nombre as "nom de producto", precio as euros , ROUND(precio*1.15,2) as dolars FROM producto;
SELECT UPPER(nombre) AS nombre, UPPER(precio) as precio FROM producto;
SELECT LOWER(nombre) AS nombre, LOWER(precio) as precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS siglas FROM fabricante;
SELECT nombre, ROUND(precio,1) as precio FROM producto;
SELECT nombre, FLOOR(precio) as precio FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre as "Producto", producto.precio, fabricante.nombre as "Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre as "Producto", producto.precio, fabricante.nombre as "Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
SELECT producto.codigo as "Codigo Producto", producto.nombre as "Producto", fabricante.codigo as "Codigo Fabricante", fabricante.nombre as "Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre as "Producto", MIN(producto.precio) AS precio, fabricante.nombre as "Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre as "Producto", MAX(producto.precio) AS precio, fabricante.nombre as "Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre as "Producto", fabricante.nombre as "Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo";
SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Crucial" and producto.precio > 200;
SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";
SELECT * FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ("Asus","Hewlett-Packard","Seagate");
SELECT producto.nombre as "Producto", producto.precio as "Precio", fabricante.nombre as "Nombre Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%e";
SELECT producto.nombre as "Producto", producto.precio as "Precio", fabricante.nombre as "Nombre Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%w%";
SELECT producto.nombre as "Producto", producto.precio as "Precio", fabricante.nombre as "Nombre Fabricante" FROM producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, fabricante.nombre ASC;
SELECT codigo, nombre FROM fabricante WHERE codigo IN (SELECT codigo_fabricante FROM producto);
SELECT fabricante.nombre as "Fabricante", producto.nombre as "Producto" FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre as "Fabricante", producto.nombre as "Producto" FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.codigo NOT IN (SELECT producto.codigo_fabricante FROM producto);
SELECT producto.nombre as "Producto" FROM fabricante RIGHT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo";
SELECT * FROM producto WHERE precio IN (SELECT MAX(producto.precio) FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo"); 
SELECT nombre FROM producto WHERE precio IN (SELECT MAX(producto.precio) FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo"); 
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Hewlett-Packard" ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto WHERE precio >= (SELECT producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Lenovo" ORDER BY precio DESC LIMIT 1);
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Asus" AND producto.precio >= (SELECT AVG(producto.precio) FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = "Asus");









