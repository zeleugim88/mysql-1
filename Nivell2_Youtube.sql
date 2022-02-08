# Create and select database
DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube; 

CREATE TABLE IF NOT EXISTS usuarios
(
    id_usuario INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(30) NOT NULL,
    contrasena VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    nacimiento VARCHAR(30) NOT NULL,
    sexo VARCHAR(30) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    codigo_postal INT NOT NULL,
    PRIMARY KEY(id_usuario)
);

CREATE TABLE IF NOT EXISTS videos
(
    id_video INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(30) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    tamano VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    duracion INT NOT NULL,
    thumbnail BLOB NOT NULL,
    reproducciones INT NOT NULL,
    likes INT NOT NULL,
    dislikes INT NOT NULL,
    visibilidad VARCHAR(30) NOT NULL, #enum
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    usuario_id INT,
    PRIMARY KEY(id_video),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

#tabla likes
#tabla dislikes

CREATE TABLE IF NOT EXISTS etiquetas
(
    id_etiqueta INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    video_id INT,
    PRIMARY KEY(id_etiqueta),
    FOREIGN KEY (video_id) REFERENCES videos(video_id) #video puede tener muchas etiquetas
);

CREATE TABLE IF NOT EXISTS canales
(
    id_canal INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    fecha DATE NOT NULL,
    array_seguidores VARCHAR(30),

);


    
CREATE TABLE IF NOT EXISTS seguidores
(
    id_seguidores INT NOT NULL AUTO_INCREMENT,
    canal VARCHAR(30) NOT NULL,
    array_likes VARCHAR(30),
    array_dislikes VARCHAR(30)
    fecha DATE NOT NULL,
);

CREATE TABLE IF NOT EXISTS playlists
(
    id_playlist INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    fecha DATE NOT NULL,
    public BOOLEAN NOT NULL,
);

CREATE TABLE IF NOT EXISTS comentarios
(
    id_comentario INT NOT NULL AUTO_INCREMENT,
    texto VARCHAR(30) NOT NULL,
    fecha DATE NOT NULL,
    public BOOLEAN NOT NULL,
);

CREATE TABLE IF NOT EXISTS interacciones
(
    id_interaccion INT NOT NULL AUTO_INCREMENT,
    array_likes VARCHAR(30),
    array_dislikes VARCHAR(30)
    fecha DATE NOT NULL,
);