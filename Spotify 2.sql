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
    nombreCancion varchar(20) not null,
	direccionRaw varchar(20) not null,
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
    codigoCancion int not null,
    Primary key PK_codigoPlaylist (codigoPlaylist),
	constraint FK_Playlist_Cancion foreign key
		(codigoCancion) references Canciones(codigoCancion) on update cascade on delete cascade,
	constraint FK_Playlist_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade
);

Create table Favoritos(
	codigoFav int not null auto_increment,
    cantidadCanciones int not null,
    duraciónTotal varchar(10) not null,
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
    EstadoSesion boolean not null,
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
    Primary key PK_codigoHistorialR (codigoHistorialR),
    constraint FK_HistorialReproduccion_Usuario foreign key
		(codigoUsuario) references Usuarios(codigoUsuario) on update cascade on delete cascade
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

-- LOGIN CRUD ----------------------------------------------

DELIMITER $$
	Create Procedure sp_AgregarLogin(in _codigoUsuario int)
		Begin
			Insert into Login(codigoUsuario, fechaLogin, horaLogin, EstadoSesion)
				values(_codigoUsuario, curdate(),curtime(),true);
        End$$
DELIMITER ;

DELIMITER $$
	Create procedure sp_EliminarLogin(in _codigoLogin int)
		Begin
			Delete from Login where codigoLogin = _codigoLogin;
        End$$
DELIMITER ;

DELIMITER $$
	Create procedure sp_ListarLogins()
		Begin
			Select 
				L.codigoLogin,
                L.fechaLogin,
                L.horaLogin,
                L.estadoSesion,
                L.codigoUsuario
					from Login L;
        End$$
DELIMITER ;

DELIMITER $$
	Create procedure sp_BuscarLogin(in _codigoLogin int)
		Begin
			Select 
				L.codigoLogin,
                L.fechaLogin,
                L.horaLogin,
                L.estadoSesion,
                L.codigoUsuario
					from Login L where L.codigoLogin = _codigoLogin;
        End$$
DELIMITER ;


