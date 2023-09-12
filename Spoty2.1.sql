Drop Database if exists Musical;
Create Database Musical;
Use Musical;

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
    nombreCancion varchar(50) not null,
	direccionRaw varchar(50) not null,
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
    Primary key PK_codigoMix (codigoMix)
   
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


-- Insert de Artistas ----------------
insert into Artista (nombreArtista,fechaNacimiento,paisNacimiento)
value ('Marc Anthony','1968-09-16','Estados Unidos');
insert into Artista (nombreArtista,fechaNacimiento,paisNacimiento)
value ('Ed Sheeran','1991-02-17','Reino Unido');
insert into Artista (nombreArtista,fechaNacimiento,paisNacimiento)
value ('Beyoncé','1981-09-04','Estados Unidos');
insert into Artista (nombreArtista,fechaNacimiento,paisNacimiento)
value ('Adele','1988-05-05','Reino Unido');
insert into Artista (nombreArtista,fechaNacimiento,paisNacimiento)
value ('Vicente Fernández','1940-02-17','Mexico');

-- Insert Generos ---------------------------
insert into Generos (nombreGenero, origen, descripcion) 
values ('Salsa', 'Cuba', 'Género musical bailable de Cuba que combina elementos del son cubano y otros ritmos latinos.');
insert into Generos (nombreGenero, origen, descripcion) 
values ('Pop', 'Estados Unidos', 'Género musical que abarca una amplia gama de estilos, es conocido por su enfoque comercial y accesible al público.');
insert into Generos (nombreGenero, origen, descripcion) 
values ('R&B', 'Estados Unidos', 'Género musical que combina el rhythm and blues con elementos del pop y el soul.');
insert into Generos (nombreGenero, origen, descripcion) 
values ('Folk', 'Varios países', 'Género musical que se transmite de generación en generación dentro de una cultura o comunidad.');
insert into Generos (nombreGenero, origen, descripcion) 
values ('Soul', 'Estados Unidos', 'Género musical que se caracteriza por su profunda expresión emocional y el uso de la voz.');
insert into Generos (nombreGenero, origen, descripcion) 
values('Ranchera', 'México', 'Género musical mexicano que tiene sus raíces en la música folklórica y tradicional.');
insert into Generos (nombreGenero, origen, descripcion) 
values('Hip Hop', 'Estados Unidos', 'Género musical que incorpora rimas, ritmo y poesía hablada, originario de la cultura afroamericana en Estados Unidos.');

-- Insert Albunes ------------------------
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('21','pop,soul','2011-01-24',4);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('25','pop,soul','2015-11-20',4);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('19','pop,soul','2008-01-28',4);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('Opus','Salsa','2019-05-10',1);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('3.0','Salsa','2013-07-23',1);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('Amar sin mentiras','Salsa','2004-06-08',1);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('+','Pop, Folk','2011-09-09',2);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('X','Pop, R&B','2014-06-20',2);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('÷','Pop, Hip Hop','2017-03-03',2);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('Lemonade',' R&B, Pop','2016-04-23',3);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('BDay','R&B, Pop','2006-09-01',3);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('4','R&B, Pop','2011-06-24',3);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('Un azteca en el Azteca','Ranchera','2016-09-02',5);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('¡Arriba Huentitàn!','Ranchera','1972-08-27',5);
insert into Album (nombreAlbum, generoComun, fechaLanzamiento,codigoArtista) 
values('Un Mexicano en la México','Ranchera','2010-07-20',5);

-- ------------------------------Insert Canciones ----------------------------------------------------
-- Adele --------------------------------
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Rolling in the Deep','rollingintheDeep.mp3','3:53',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Someone Like You','someoneLikeYou.mp3','4:46',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Set Fire to the Rain','setFiretotheRain.mp3','3:58',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Rumour Has It','rumourHasIt.mp3','3:43',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Turning Tables','turningTables.mp3','4:04',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Dont You Remember','dontYouRemember.mp3','4:15',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('One and Only','oneandOnly.mp3','5:46',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Lovesong','lovesong.mp3','5:17',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Take It All','takeItAll.mp3','3:50',2,4,1);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('He Wont Go','heWontGo.mp3','4:39',2,4,1);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Hello','hello.mp3','6:06',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Send My Love (To Your New Lover)','sendMyLove_ToYourNewLover)mp3','3:45',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('I Miss You','IMissYou.mp3','5:49',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('When We Were Young','whenWeWereYoung.mp3','4:51',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Remedy','remedy.mp3','4:05',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Water Under the Bridge','waterUndertheBridge.mp3','4:00',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('River Lea','riverLea.mp3','3:45',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('All I Ask','allIAsk.mp3','4:35',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Love in the Dark','loveintheDark.mp3','4:46',2,4,2);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Sweetest Devotion','sweetestDevotion.mp3','4:12',2,4,2);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Chasing Pavements','chasingPavements.mp3','3:31',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Hometown Glory','hometownGlory.mp3','4:31',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Make You Feel My Love','makeYouFeelMyLove.mp3','3:32',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('First Love','firstLove.mp3','3:10',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Daydreamer','daydreamer.mp3','3:41',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Melt My Heart to Stone','meltMyHearttoStone.mp3','3:24',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Cold Shoulder','coldShoulder.mp3','3:12',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Tired','tired.mp3','4:19',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('My Same','mySame.mp3','3:16',2,4,3);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Right as Rain','rightasRain.mp3','3:17',2,4,3);

-- Marc Antony -----------------------------------------------
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Úsame','úsame.mp3','5:00',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Parecen viernes','parecenViernes.mp3','4:28',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Lo que te di','loquetedi.mp3','4:02',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Un amor eterno','unamoreterno.mp3','4:19',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Lo peor de mí','lopeordemí.mp3','5:10',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Reconozco','reconozco.mp3','4:08',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Soy yo','soyYo.mp3','4:51',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Tu vida en la mía','tuvidaenlamía.mp3','6:14',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Si me creyeras','Si me creyeras.mp3','4:30',1,1,4);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Si pudiera','siPudiera.mp3','4:26',1,1,4);


insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Volver a comenzar','volveracomenzar.mp3','4:37',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Cautivo de tu amor','cautivodetuamor.mp3','3:40',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Espera','espera.mp3','4:01',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('La copa rota','lacoparota.mp3','3:29',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Hipocresía','hipocresía.mp3','4:32',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Cambio de piel','cambiodepiel.mp3','4:39',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Vivir mi vida','vivirmivida.mp3','3:51',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Flor pálida','florpálida.mp3','4:40',1,1,5);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Dime si no es verdad','dimesinoesverdad.mp3','4:06',1,1,5);


insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Escapémonos','escapémonos.mp3','4:46',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Volando Entre Tus Brazos','volandoEntreTusBrazos.mp3','4:25',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Tan Solo Palabras','tanSoloPalabras.mp3','3:42',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Tu Amor Me Hace Bien','tuAmorMeHaceBien.mp3','4:36',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Ahora Quien','ahoraQuien.mp3','5:05',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Amar Sin Mentiras','amarSinMentiras.mp3','4:50',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Se Esfuma Tu Amor','seEsfumaTuAmor.mp3','3:53',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Nada Personal','nadaPersonal.mp3','4:40',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Amigo','amigo.mp3','3:43',1,1,6);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Valio la Pena','valiolaPena.mp3','3:43',1,1,6);

-- Ed Sheeran -------------------------------------------------------------------------------------
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('The A Team','theATeam.mp3','4:50',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Lego House','legoHouse.mp3','4:06',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Drunk','drunk.mp3','3:18',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('U.N.I.','escapémonos.mp3','3:49',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Grade 8','grade8.mp3','3:00',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Wake Me Up','wakeMeUp.mp3','3:48',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Small Bump','smallBump.mp3','4:26',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('This','this.mp3','3:10',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Kiss Me','kissMe.mp3','4:41',2,2,7);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Give Me Love','giveMeLove.mp3','4:22',2,2,7);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Sing','sing.mp3','4:29',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Dont','dont.mp3','4:52',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Thinking Out Loud','thinkingOutLoud.mp3','4:46',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Bloodstream','bloodstream.mp3','4:00',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Im a Mess','imAMess.mp3','4:12',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Photograph','photograph.mp3','4:21',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Afire Love','afireLove.mp3','4:22',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Take It Back','takeItBack.mp3','3:28',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Even My Dad Does Sometimes','evenMyDadDoesSometimes.mp3','3:46',2,2,8);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Shirtsleeves','shirtsleeves.mp3','3:08',2,2,8);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Shape of You','shapeofYou.mp3','3:58',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Castle on the Hill','castleontheHill.mp3','4:37',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Galway Girl','galwayGirl.mp3','2:50',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Perfect','perfect.mp3','4:40',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Happier','happier.mp3','3:35',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('New Man','newMan.mp3','3:09',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Dive','dive.mp3','3:58',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Supermarket Flowers','supermarketFlowers.mp3','3:42',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Barcelona','barcelona.mp3','3:11',2,2,9);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Nancy Mulligan','nancyMulligan.mp3','3:00',2,2,9);

-- Beyoncé ------------------------------------------
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Formation','formation.mp3','4:47',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Sorry','sorry.mp3','4:26',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Hold Up','holdUp.mp3','5:16',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Dont Hurt Yourself','Dont Hurt Yourself.mp3','3:54',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('6 Inch','6Inch.mp3','4:20',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Daddy Lessons','daddyLessons.mp3','6:26',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Love Drought','loveDrought.mp3','3:26',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Sandcastles','sandcastles.mp3','4:36',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Freedom','freedom.mp3','4:50',3,3,10);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('All Night','allNight.mp3','6:21',3,3,10);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Déjà Vu','déjàVu.mp3','4:03',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Get Me Bodied','getMeBodied.mp3','6:37',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Suga Mama','sugaMama.mp3','3:31',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Upgrade U','upgradeU.mp3','4:37',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Ring the Alarm','ringtheAlarm.mp3','3:28',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Kitty Kat','kittyKat.mp3','3:56',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Freakum Dress','freakumDress.mp3','3:16',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Green Light','greenLight.mp3','3:31',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Irreplaceable','irreplaceable.mp3','4:13',3,3,11);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Resentment','resentment.mp3','4:41',3,3,11);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('1+1','1+1.mp3','4:29',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('I Care','ICare.mp3','3:46',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('I Miss You','IMissYou.mp3','3:00',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Best Thing I Never Had','bestThingINeverHad.mp3','4:12',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Party','party.mp3','3:41',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Rather Die Young','ratherDieYoung.mp3','3:43',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Start Over','startOver.mp3','3:29',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Love on Top','loveonTop.mp3','3:16',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Countdown','countdown.mp3','3:33',3,3,12);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('End of Time','endofTime.mp3','3:46',3,3,12);

-- Vicente Fernandez -------------------
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('No volveré','noVolveré.mp3','3:25',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Mátalas',' mátalas.mp3','3:07',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Paloma querida','palomaQuerida.mp3','3:31 ',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Estos celos','estosCelos.mp3','3:10',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Qué de raro tiene','quéDeRaroTiene.mp3','3:23',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('La ley del monte','laLeydelMonte.mp3','3:28',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Ando que me lleva','andoquemelleva.mp3','3:58',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Acá entre nos','acáEntreNos.mp3','3:57',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('La diferencia','laDiferencia.mp3','3:11',6,5,13);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Lástima que seas ajena','lástimaqueseasAjena.mp3','3:39',6,5,13);

insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Amor de la calle','amordelaCalle.mp3','3:10',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Sueña mi amor','sueñamiAmor.mp3','2:27',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Con golpes de pecho','conGolpesdePecho.mp3','2:55',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Voy a navegar','voyaNavegar.mp3','2:57',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Te voy a hacer que me quieras','teVoyaHacerquemeQuieras.mp3','2:07',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('La cruz de tu olvido','laCruzdetuOlvido.mp3','2:28',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Volver volver','volverVolver.mp3','2:57',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('El Palenque','elPalenque.mp3','2:20',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Te llevaré conmigo','teLlevaréConmigo.mp3','3:04',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('El jalisciense','elJalisciense.mp3','2:37',6,5,14);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Al final del camino','alFinaldelCamino.mp3','3:03',6,5,14);


insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Dolor','Dolor.mp3','3:08',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Por Un Amor','porUnAmor.mp3','3:23',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('La ley del monte','laLeydelMonte.mp3','3:28',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Volver volver','volverVolver.mp3','2:57',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('De 7 A 9','De7A9.mp3','3:03',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('México Lindo y Querido','méxicoLindoyQuerido.mp3','3:48',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('El Ranchero','elRanchero.mp3','2:00',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('No Me Se Rajar ','noMeSeRajar.mp3','3:00',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Motivos','Motivos.mp3','3:04',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('Que Te Vaya Bonito ','queTeVayaBonito .mp3','3:40',6,5,15);
insert into Canciones (nombreCancion, direccionRaw, duracion,codigoGenero,codigoArtista,codigoAlbum) 
values('De Que Manera Te Olvido ','deQueManeraTeOlvido .mp3','3:14',6,5,15);

INSERT INTO Mixes (nombreMix, descripcionMix, cantidadCanciones)
VALUES ('Mix_No.1', ' Es una Mezcla de diferentes canciones, donde el usuario se pondrá cómodo con diferentes géneros y canciones ', 15);
INSERT INTO Mixes (nombreMix, descripcionMix, cantidadCanciones)
VALUES ('Mix_No.2', 'Cuando piensas en un mix, atrevete a escuchar esta creación de música ideal para ti ', 15);
INSERT INTO Mixes (nombreMix, descripcionMix, cantidadCanciones)
VALUES ('Mix_No.3', 'Es momento de que tus oidos se relajen y te transporten a un paisaje de canciones y de diferentes aritistas ', 15);

INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 1, 33, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 2, 62, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 3, 32, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 4, 90, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 5, 2, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 6, 128, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 7, 9, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 8, 66, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 9, 127, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 10, 69, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 11, 91, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 12, 31, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 13, 36, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 14, 65, 1);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 15, 40, 1);

INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 1, 129, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 2, 94, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 3, 125, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 4, 35, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 5, 121, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 6, 1, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 7, 120, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 8, 64, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 9, 99, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 10, 37, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 11, 123, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 12, 68, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-21', now(), 13, 93, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-20', now(), 14, 4, 2);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 15, 97, 2);

INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 1, 67, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 2, 3, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 3, 124, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 4, 92, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 5, 122, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 6, 63, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 7, 39, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 8, 6, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 9, 8, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 10, 126, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 11, 38, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 12, 5, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 13, 98, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 14, 7, 3);
INSERT INTO MixeshasCanciones (fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix)
VALUES ('2023-07-19', now(), 15, 60, 3);


select * from MixeshasCanciones;
select * from Mixes;