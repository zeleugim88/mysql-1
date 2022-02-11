/* 
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo ="alumno" ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2, telefono, NIF FROM persona WHERE telefono IS NULL AND NIF LIKE "%K" AND tipo = "alumno";
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = "alumno";
SELECT * FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND NIF LIKE "%K";
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7;
SELECT pe.apellido1 as "Primer Apellido", pe.apellido2 as "Segundo Apellido", pe.nombre as "Nombre", d.nombre FROM persona pe RIGHT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id ORDER BY pe.apellido1, pe.nombre;
SELECT p.nif, a.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura aa ON p.id = aa.id_alumno JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id JOIN asignatura a ON aa.id_asignatura = a.id WHERE p.nif = "26902806M";
SELECT DISTINCT d.nombre as "departamento" FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)";
SELECT DISTINCT p.nombre FROM persona p JOIN alumno_se_matricula_asignatura aa ON p.id = aa.id_alumno JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id JOIN asignatura a ON aa.id_asignatura = a.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;
SELECT d.nombre as "departamento", pe.apellido1, pe.apellido2, pe.nombre FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE pe.tipo = "profesor" ORDER BY d.nombre, pe.apellido1, pe.apellido2, pe.nombre;
SELECT d.nombre as "departamento", pe.apellido1, pe.apellido2, pe.nombre FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE pe.tipo = "profesor";
SELECT d.nombre as "departamento", pr.id_profesor as "id_profesor" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN persona pe ON pr.id_profesor = pe.id WHERE pr.id_profesor IS NULL;
SELECT pe.apellido1, pe.apellido2, pe.nombre, a.id as "id_asignatura" FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL AND pe.tipo = "profesor";
SELECT a.nombre as "nombre asignatura", a.id as "asignatura_id", a.id_profesor as "id_profesor" FROM persona pe RIGHT JOIN profesor pr ON pe.id = pr.id_profesor RIGHT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT d.nombre as "departamento", a.nombre as "asignatura" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;
SELECT COUNT(id) FROM persona WHERE tipo = "alumno";
SELECT COUNT(id) FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre as "departamento", COUNT(pr.id_profesor) as "nº profesores" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NOT NULL GROUP BY pr.id_departamento ORDER BY COUNT(pr.id_profesor) DESC;
SELECT d.nombre as "departamento", COUNT(pr.id_profesor) as "nº profesores" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY pr.id_departamento;
SELECT g.nombre as "grado", COUNT(a.id) as "num_asignatura" FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id ORDER BY COUNT(a.id) DESC;
SELECT g.nombre as "grado", COUNT(a.id) as "num_asignatura" FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id HAVING COUNT(a.id) > 40;
SELECT g.nombre as "grado", a.tipo as "tipo_asignatura", COUNT(a.creditos) as "creditos" FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado WHERE a.id IS NOT NULL GROUP BY g.id, a.tipo;
SELECT ce.anyo_inicio as "inicio curso", COUNT(a.id_alumno) FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura a ON ce.id = a.id_curso_escolar WHERE a.id_alumno IS NOT NULL GROUP BY ce.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) as "num_asignaturas" FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = "profesor" GROUP BY p.id ORDER BY COUNT(a.id) DESC;
SELECT * FROM persona WHERE fecha_nacimiento IN (SELECT MAX(fecha_nacimiento) FROM persona);
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre as "departamento" FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL AND d.id IS NOT NULL;
*/