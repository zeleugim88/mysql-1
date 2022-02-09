# Create and select database
DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube; 

CREATE TABLE IF NOT EXISTS canales
(
    id_canal INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY(id_canal)
);

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
    canal_id INT,
    PRIMARY KEY(id_usuario),
    FOREIGN KEY (canal_id) REFERENCES canales(id_canal)
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
    visibilidad ENUM("publico","oculto","privado") NOT NULL,
    usuario_id INT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    PRIMARY KEY(id_video),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS etiquetas
(
    id_etiqueta INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    PRIMARY KEY(id_etiqueta)
);

CREATE TABLE IF NOT EXISTS videos_etiquetas ( 
    video_id INT NOT NULL,
    etiqueta_id INT NOT NULL, 
    FOREIGN KEY (video_id) REFERENCES videos(id_video),
    FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id_etiqueta)
);

CREATE TABLE IF NOT EXISTS likes_dislikes_videos
(
    like_dislike ENUM("like","dislike"),
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    video_id INT,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (video_id) REFERENCES videos(id_video)
);



CREATE TABLE IF NOT EXISTS usuarios_canales
(
    usuario_id INT,
    canal_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (canal_id) REFERENCES canales(id_canal)
);


CREATE TABLE IF NOT EXISTS playlists
(
    id_playlist INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    fecha DATE NOT NULL,
    privacidad ENUM("publica","privada"),
    usuario_id INT,
    PRIMARY KEY (id_playlist),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS videos_playlists
(   playlist_id INT,
    video_id INT,
    FOREIGN KEY (playlist_id) REFERENCES playlists(id_playlist),
    FOREIGN KEY (video_id) REFERENCES videos(id_video)
);

CREATE TABLE IF NOT EXISTS comentarios
(
    id_comentario INT NOT NULL AUTO_INCREMENT,
    texto VARCHAR(30) NOT NULL,
    fecha DATE NOT NULL,
    public BOOLEAN NOT NULL,
    video_id INT,
    usuario_id INT,
    PRIMARY KEY(id_comentario),
    FOREIGN KEY (video_id) REFERENCES videos(id_video),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS likes_dislikes_comentarios
(
    like_dislike ENUM("like","dislike"),
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    comentario_id INT,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (comentario_id) REFERENCES comentarios(id_comentario)
);
