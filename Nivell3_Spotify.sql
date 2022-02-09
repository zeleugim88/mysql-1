# Create and select database
DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify; 

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

CREATE TABLE IF NOT EXISTS usuarios_premium
(
    id_usuario_premium INT NOT NULL AUTO_INCREMENT,
	usuario_id INT,
    PRIMARY KEY(id_usuario_premium),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS subscripciones
(
	id_subscripcion INT NOT NULL AUTO_INCREMENT,
    inicio DATE NOT NULL,
    renovacion DATE NOT NULL,
    pago ENUM("tarjeta", "Paypal"),
    usuario_premium_id INT,
    PRIMARY KEY (id_subscripcion),
    FOREIGN KEY(usuario_premium_id) REFERENCES usuarios_premium(id_usuario_premium)
);

CREATE TABLE IF NOT EXISTS tarjetas
(
	id_tarjeta INT NOT NULL AUTO_INCREMENT,
    caducidad DATE,
    codigo_seguridad INT,
    subscripcion_id INT,
    PRIMARY KEY (id_tarjeta),
    FOREIGN KEY(subscripcion_id) REFERENCES subscripciones(id_subscripcion)
);


CREATE TABLE IF NOT EXISTS paypals
(
	id_paypal INT NOT NULL AUTO_INCREMENT,
    usuario_paypal VARCHAR(30),
    subscripcion_id INT,
    PRIMARY KEY (id_paypal),
    FOREIGN KEY(subscripcion_id) REFERENCES subscripciones(id_subscripcion)
);

CREATE TABLE IF NOT EXISTS pagos
(
	id_pago INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    pago_total INT NOT NULL,
    tarjeta_id INT,
    paypal_id INT,
    PRIMARY KEY (id_pago),
    FOREIGN KEY (tarjeta_id) REFERENCES tarjetas(id_tarjeta),
    FOREIGN KEY (paypal_id) REFERENCES paypals(id_paypal)
);

CREATE TABLE IF NOT EXISTS playlists_activas (
	id_playlist_activa INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(60) NOT NULL,
    num_canciones INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    usuario_id INT,
    PRIMARY KEY(id_playlist_activa),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS playlists_borradas 
(
	id_playlist_borrada INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(60) NOT NULL,
    num_canciones INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    playlist_activa_id INT,
    PRIMARY KEY(id_playlist_borrada),
    FOREIGN KEY (playlist_activa_id) REFERENCES playlists_activas(id_playlist_activa)
);

CREATE TABLE IF NOT EXISTS artistas 
(
	id_artista INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    imagen BLOB NOT NULL,
    PRIMARY KEY(id_artista)
);

CREATE TABLE IF NOT EXISTS albumes
(
	id_album INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(60) NOT NULL,
    fecha DATE NOT NULL, 
    portada BLOB NOT NULL,
    artista_id INT,
    PRIMARY KEY(id_album),
    FOREIGN KEY(artista_id) REFERENCES artistas(id_artista)
);

CREATE TABLE IF NOT EXISTS canciones
(
	id_cancion INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(60) NOT NULL,
    duracion FLOAT(2) NOT NULL,
    reproduccioens INT NOT NULL,
    album_id INT,
    PRIMARY KEY(id_cancion),
    FOREIGN KEY(album_id) REFERENCES albumes(id_album)
);

CREATE TABLE IF NOT EXISTS playlists_compartidas (
	id_playlist_compartida INT NOT NULL AUTO_INCREMENT,
    playlist_activa_id INT,
    PRIMARY KEY(id_playlist_compartida),
    FOREIGN KEY (playlist_activa_id) REFERENCES playlists_activas(id_playlist_activa)
);

CREATE TABLE IF NOT EXISTS canciones_compartidas
(
	cancion_compartida_id INT NOT NULL AUTO_INCREMENT,
    playlist_compartida_id INT,
    usuario_id INT,
    cancion_id INT,
    fecha TIMESTAMP,
    PRIMARY KEY(cancion_compartida_id),
    FOREIGN KEY(playlist_compartida_id) REFERENCES playlists_compartidas(id_playlist_compartida),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id_usuario),
    FOREIGN KEY(cancion_id) REFERENCES canciones(id_cancion)
);

CREATE TABLE IF NOT EXISTS artistas_relacionados
(
	artista_relacionado_id INT NOT NULL AUTO_INCREMENT,
    artista1 INT NOT NULL,
    artista2 INT NOT NULL,
    PRIMARY KEY(artista_relacionado_id),
    FOREIGN KEY(artista1) REFERENCES artistas(id_artista),
    FOREIGN KEY(artista2) REFERENCES artistas(id_artista)
);

CREATE TABLE IF NOT EXISTS artistas_seguidos 
(
    usuario_id INT,
    artista_id INT,
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id_usuario),
    FOREIGN KEY(artista_id) REFERENCES artistas(id_artista)
);

CREATE TABLE IF NOT EXISTS albumes_favoritos
(
	album_favorito_id INT NOT NULL AUTO_INCREMENT,
	usuario_id INT,
    album_id INT,
    PRIMARY KEY(album_favorito_id),
    FOREIGN KEY (album_id) REFERENCES albumes(id_album),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS canciones_favoritas
(
	cancion_favorita_id INT NOT NULL AUTO_INCREMENT,
	usuario_id INT,
    cancion_id INT,
    PRIMARY KEY(cancion_favorita_id),
    FOREIGN KEY (cancion_id) REFERENCES canciones(id_cancion),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id_usuario)
);


