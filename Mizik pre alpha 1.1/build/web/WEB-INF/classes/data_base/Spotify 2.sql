Drop Database if exists Musical;
Create Database Musical;
Use Musical;

Create table Usuarios(
    codigoUsuario int not null auto_increment,
    nombreCompleto varchar(100) not null,
    usuario varchar(50) not null unique,
    correoUsuario varchar(50) not null,
    claveUsuario varchar(25) not null,
    Primary Key PK_codigoUsuario (codigoUsuario)
);

Create table Generos(
    codigoGenero int not null auto_increment,
    nombreGenero varchar(25) not null,
    origen varchar(25) not null,
    descripcion varchar(150) not null,
    Primary Key PK_codigoGenero (codigoGenero)
);

Create table Artista(
    codigoArtista int not null auto_increment,
    nombreArtista varchar(25) not null,
    fechaNacimiento date not null,
    paisNacimiento varchar(25) not null,
    Primary key PK_codigoArtista (codigoArtista)
);

Create table Album(
    codigoAlbum int not null auto_increment,
    nombreAlbum varchar(25) not null,
    generoComun varchar(25) not null,
    fechaLanzamiento date not null,
    codigoArtista int not null,
    Primary key PK_codigoAlbum (codigoAlbum),
    constraint FK_Album_Artista foreign key
		(codigoArtista) references Artista(codigoArtista) on update cascade on delete cascade
);

Create table Canciones(
    codigoCancion int not null auto_increment,
    nombreCancion varchar(30) not null,
	direccionRaw varchar(30) not null,
    duracion varchar(5) not null,
    codigoGenero int not null,
    codigoArtista int not null,
    codigoAlbum int not null,
    Primary key PK_codigoCancion (codigoCancion),
    constraint FK_Canciones_Artista foreign key
		(codigoArtista) references Artista(codigoArtista) on update cascade on delete cascade,
	constraint FK_Canciones_Genero foreign key
		(codigoGenero) references Generos(codigoGenero) on update cascade on delete cascade,
	constraint FK_Canciones_Album foreign key
		(codigoAlbum) references Album(codigoAlbum) on update cascade on delete cascade
);

Create table Mixes(
    codigoMix int not null auto_increment,
    nombreMix varchar(30) not null,
    descripcionMix varchar(200) not null,
    cantidadCanciones int not null,
    codigoGenero int not null,
    codigoCancion int not null,
    Primary key PK_codigoMix (codigoMix),
    constraint FK_Mixes_Generos foreign key
		(codigoGenero) references Generos(codigoGenero) on update cascade on delete cascade,
	constraint FK_Mixes_Cancion foreign key
		(codigoCancion) references Canciones(codigoCancion) on update cascade on delete cascade
);

Create table PlayList(
    codigoPlaylist int not null auto_increment,
    nombrePlaylist varchar(50) not null,
    descripcionPlaylist varchar(200),
    cantidadCanciones int not null,
    codigoUsuario int not null,
    Primary key PK_codigoPlaylist (codigoPlaylist),
	constraint FK_Playlist_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade
);

Create table Favoritos(
	codigoFav int not null auto_increment,
    cantidadCanciones int not null,
    duracionTotal varchar(10) not null,
    cantidadArtistas int not null,
    codigoUsuario int not null,
    codigoCancion int not null,
    Primary key PK_codigoFav (codigoFav),
	constraint FK_Favoritos_Cancion foreign key
		(codigoCancion) references Canciones(codigoCancion) on update cascade on delete cascade,
	constraint FK_Favoritos_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade
);

Create table Login(
	codigoLogin int not null auto_increment,
    fechaLogin date not null,
    horaLogin datetime not null,
    estadoSesion boolean not null,
    codigoUsuario int not null,
    Primary key PK_codigoLogin (codigoLogin),
    constraint FK_Login_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade
);

Create table HistorialBusqueda(
	codigoHistorialB int not null auto_increment,
    fechaHB date not null,
    horaHB datetime not null,
    palabraBuscada varchar(30) not null,
    codigoUsuario int not null,
    Primary key PK_codigoHistorialB (codigoHistorialB),
    constraint FK_HistorialBusqueda_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade
);

Create table HistorialReproduccion(
	codigoHistorialR int not null auto_increment,
    fechaHR date not null,
    horaHR datetime not null,
    Origen varchar(30) not null,
    codigoUsuario int not null,
    codigoCancion int not null,
    Primary key PK_codigoHistorialR (codigoHistorialR),
    constraint FK_HistorialReproduccion_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade,
	constraint FK_HistorialReproduccion_Cancion foreign key
		(codigoCancion) references Canciones(codigoCancion) on update cascade on delete cascade
);

Create table PlaylisthasCanciones(
	codigoPlaylisthasCanciones int not null auto_increment,
	fechaPC date not null,
    horaPC datetime not null,
    numeroUnico int not null,
    codigoCancion int not null,
    codigoPlaylist int not null,
    Primary key PK_codigoPlaylisthasCanciones (codigoPlaylisthasCanciones),
    constraint FK_PlaylisthasCanciones_Canciones foreign key
		(codigoCancion) references Canciones(codigoCancion) on update cascade on delete cascade,
	constraint FK_PlaylisthasCanciones_Playlist foreign key
		(codigoPlaylist) references Playlist(codigoPlaylist) on update cascade on delete cascade
);

Create table MixeshasCanciones(
	codigoMixeshasCanciones int not null auto_increment,
	fechaMC date not null,
    horaMC datetime not null,
    numeroUnico int not null,
    codigoCancion int not null,
    codigoMix int not null,
    Primary key PK_codigoMixeshasCanciones (codigoMixeshasCanciones),
    constraint FK_MixeshasCanciones_Canciones foreign key
		(codigoCancion) references Canciones(codigoCancion) on update cascade on delete cascade,
	constraint FK_MixeshasCanciones_Mixes foreign key
		(codigoMix) references Mixes(codigoMix) on update cascade on delete cascade
);

INSERT INTO Usuarios (nombreCompleto, usuario, correoUsuario, claveUsuario)
VALUES ('Luciano', 'lmaquin', 'luciano@email.com', '123');
INSERT INTO Usuarios (nombreCompleto, usuario, correoUsuario, claveUsuario)
VALUES ('Victor', 'valvarez', 'victor@email.com', '456');
INSERT INTO Usuarios (nombreCompleto, usuario, correoUsuario, claveUsuario)
VALUES ('David', 'darevalo', 'david@email.com', '789');


INSERT INTO Generos (nombreGenero, origen, descripcion)
VALUES ('Pop', 'Internacional', 'Género musical popular con énfasis en la melodía y la lírica.');
INSERT INTO Generos (nombreGenero, origen, descripcion)
VALUES ('Rock', 'Estados Unidos', 'Estilo musical que se caracteriza por el uso de guitarras eléctricas y batería.');
INSERT INTO Generos (nombreGenero, origen, descripcion)
VALUES ('Hip-Hop', 'Estados Unidos', 'Género musical que se basa en el ritmo y la rima de las palabras.');
INSERT INTO Generos (nombreGenero, origen, descripcion)
VALUES ('Reggae', 'Jamaica', 'Género musical originario de Jamaica con ritmos característicos.');
INSERT INTO Generos (nombreGenero, origen, descripcion)
VALUES ('Electrónica', 'Internacional', 'Género musical que se caracteriza por el uso de instrumentos electrónicos.');
INSERT INTO Generos (nombreGenero, origen, descripcion)
VALUES ('Country', 'Estados Unidos', 'Estilo musical popular en áreas rurales de Estados Unidos con temáticas cotidianas.');


INSERT INTO Artista (nombreArtista, fechaNacimiento, paisNacimiento)
VALUES ('Michael Jackson', '1958-08-29', 'Estados Unidos');
INSERT INTO Artista (nombreArtista, fechaNacimiento, paisNacimiento)
VALUES ('Shakira', '1977-02-02', 'Colombia');
INSERT INTO Artista (nombreArtista, fechaNacimiento, paisNacimiento)
VALUES ('Queen', '1970-06-27', 'Reino Unido');
INSERT INTO Artista (nombreArtista, fechaNacimiento, paisNacimiento)
VALUES ('Beyoncé', '1981-09-04', 'Estados Unidos');
INSERT INTO Artista (nombreArtista, fechaNacimiento, paisNacimiento)
VALUES ('Rihanna', '1988-02-20', 'Barbados');
INSERT INTO Artista (nombreArtista, fechaNacimiento, paisNacimiento)
VALUES ('Ed Sheeran', '1991-02-17', 'Reino Unido');


INSERT INTO Album (nombreAlbum, generoComun, fechaLanzamiento, codigoArtista)
VALUES ('Thriller', 'Pop', '1982-11-30', 1);
INSERT INTO Album (nombreAlbum, generoComun, fechaLanzamiento, codigoArtista)
VALUES ('Pies Descalzos', 'Pop', '1995-10-06', 2);
INSERT INTO Album (nombreAlbum, generoComun, fechaLanzamiento, codigoArtista)
VALUES ('A Night at the Opera', 'Rock', '1975-11-21', 3);
INSERT INTO Album (nombreAlbum, generoComun, fechaLanzamiento, codigoArtista)
VALUES ('Lemonade', 'R&B', '2016-04-23', 4);
INSERT INTO Album (nombreAlbum, generoComun, fechaLanzamiento, codigoArtista)
VALUES ('Anti', 'R&B', '2016-01-28', 5);
INSERT INTO Album (nombreAlbum, generoComun, fechaLanzamiento, codigoArtista)
VALUES ('÷ (Divide)', 'Pop', '2017-03-03', 6);


-- Canciones del álbum "Thriller" (Artista: Michael Jackson)
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Thriller', 'thriller123', '5:57', 1, 1, 1);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Beat It', 'beatit456', '4:18', 1, 1, 1);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Billie Jean', 'billiejean789', '4:54', 1, 1, 1);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('The Girl Is Mine', 'girlmine987', '3:42', 1, 1, 1);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Wanna Be Startin’ Somethin’', 'wbs456', '6:03', 1, 1, 1);

-- Canciones del álbum "Pies Descalzos" (Artista: Shakira)
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Estoy Aquí', 'estoyaqui123', '3:55', 1, 2, 2);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Antología', 'antologia456', '4:13', 1, 2, 2);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Un Poco de Amor', 'pocodeamor789', '4:21', 1, 2, 2);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Te Necesito', 'tenecesito987', '3:49', 1, 2, 2);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Pies Descalzos, Sueños Blancos', 'pdescalzos123', '3:18', 1, 2, 2);

-- Canciones del álbum "A Night at the Opera" (Artista: Queen)
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Bohemian Rhapsody', 'bohemian123', '5:55', 2, 3, 3);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Love of My Life', 'loveofmylife456', '3:37', 2, 3, 3);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Youre My Best Friend', 'ymybf789', '2:52', 2, 3, 3);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Im in Love with My Car', 'ilovecar987', '3:05', 2, 3, 3);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('God Save the Queen', 'godsavethequeen123', '1:15', 2, 3, 3);

-- Álbum "Lemonade" (Artista: Beyoncé)
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Formation', 'formation123', '3:26', 1, 4, 4);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Sorry', 'sorry456', '3:52', 1, 4, 4);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Hold Up', 'holdup789', '3:41', 1, 4, 4);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Freedom', 'freedom987', '4:49', 1, 4, 4);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('All Night', 'allnight123', '5:22', 1, 4, 4);

-- Álbum "Anti" (Artista: Rihanna)
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Consideration', 'consideration123', '2:41', 1, 5, 5);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Desperado', 'desperado456', '3:06', 1, 5, 5);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Love on the Brain', 'lotbrain789', '3:44', 1, 5, 5);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Same Ol’ Mistakes', 'sameolmistakes987', '6:37', 1, 5, 5);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Work', 'work123', '3:39', 1, 5, 5);

-- Álbum "÷ (Divide)" (Artista: Ed Sheeran)
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Shape of You', 'shapeyou123', '3:53', 1, 6, 6);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Castle on the Hill', 'castlehill456', '4:21', 1, 6, 6);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Galway Girl', 'galwaygirl789', '2:50', 1, 6, 6);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Perfect', 'perfect987', '4:23', 1, 6, 6);
INSERT INTO Canciones (nombreCancion, direccionRaw, duracion, codigoGenero, codigoArtista, codigoAlbum)
VALUES ('Happier', 'happier123', '3:27', 1, 6, 6);


INSERT INTO Mixes (nombreMix, descripcionMix, cantidadCanciones, codigoGenero, codigoCancion)
VALUES ('Mix Pop Latino', 'Mezcla de éxitos pop latino', 10, 1, 1);
INSERT INTO Mixes (nombreMix, descripcionMix, cantidadCanciones, codigoGenero, codigoCancion)
VALUES ('Mix Rock Clásico', 'Clásicos del rock en una sola lista', 8, 2, 10);
INSERT INTO Mixes (nombreMix, descripcionMix, cantidadCanciones, codigoGenero, codigoCancion)
VALUES ('Mix Hip-Hop Old School', 'Los mejores temas del hip-hop de antaño', 7, 3, 10);


INSERT INTO PlayList (nombrePlaylist, descripcionPlaylist, cantidadCanciones, codigoUsuario)
VALUES ('Mis Favoritas', 'Mis canciones favoritas de todos los géneros', 12, 1);
INSERT INTO PlayList (nombrePlaylist, descripcionPlaylist, cantidadCanciones, codigoUsuario)
VALUES ('Entrenamiento', 'Música para motivarse durante el entrenamiento', 15, 2);
INSERT INTO PlayList (nombrePlaylist, descripcionPlaylist, cantidadCanciones, codigoUsuario)
VALUES ('Relaxing Vibes', 'Canciones relajantes para desconectar', 8, 3);


INSERT INTO Favoritos (cantidadCanciones, duracionTotal, cantidadArtistas, codigoUsuario, codigoCancion)
VALUES (20, '1:35:27', 14, 1, 5);
INSERT INTO Favoritos (cantidadCanciones, duracionTotal, cantidadArtistas, codigoUsuario, codigoCancion)
VALUES (25, '1:54:42', 19, 2, 12);
INSERT INTO Favoritos (cantidadCanciones, duracionTotal, cantidadArtistas, codigoUsuario, codigoCancion)
VALUES (18, '1:25:13', 10, 3, 8);


INSERT INTO Login (fechaLogin, horaLogin, estadoSesion, codigoUsuario)
VALUES ('2023-07-21', now(), true, 1);
INSERT INTO Login (fechaLogin, horaLogin, estadoSesion, codigoUsuario)
VALUES ('2023-07-20', now(), true, 2);
INSERT INTO Login (fechaLogin, horaLogin, estadoSesion, codigoUsuario)
VALUES ('2023-07-19', now(), true, 3);


INSERT INTO HistorialBusqueda (fechaHB, horaHB, palabraBuscada, codigoUsuario)
VALUES ('2023-07-21', now(), 'Michael Jackson', 1);
INSERT INTO HistorialBusqueda (fechaHB, horaHB, palabraBuscada, codigoUsuario)
VALUES ('2023-07-20', now(), 'Shakira', 2);
INSERT INTO HistorialBusqueda (fechaHB, horaHB, palabraBuscada, codigoUsuario)
VALUES ('2023-07-19', now(), 'Queen', 3);


INSERT INTO HistorialReproduccion (fechaHR, horaHR, Origen, codigoUsuario, codigoCancion)
VALUES ('2023-07-21', now(), 'Mix Pop Latino', 1, 1);
INSERT INTO HistorialReproduccion (fechaHR, horaHR, Origen, codigoUsuario, codigoCancion)
VALUES ('2023-07-20', now(), 'Mis Favoritas', 2, 9);
INSERT INTO HistorialReproduccion (fechaHR, horaHR, Origen, codigoUsuario, codigoCancion)
VALUES ('2023-07-19', now(), 'Relaxing Vibes', 3, 15);


INSERT INTO PlaylisthasCanciones (fechaPC, horaPC, numeroUnico, codigoCancion, codigoPlaylist)
VALUES ('2023-07-21', now(), 1, 3, 1);
INSERT INTO PlaylisthasCanciones (fechaPC, horaPC, numeroUnico, codigoCancion, codigoPlaylist)
VALUES ('2023-07-20', now(), 2, 7, 2);
INSERT INTO PlaylisthasCanciones (fechaPC, horaPC, numeroUnico, codigoCancion, codigoPlaylist)
VALUES ('2023-07-19', now(), 3, 15, 3);


INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 1, 2, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 2, 12, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 3, 4, 3);


select * from PlaylisthasCanciones