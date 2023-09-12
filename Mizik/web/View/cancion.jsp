<%-- 
    Document   : canción
    Created on : 20/08/2023, 04:10:19 PM
    Author     : lucciano
--%>

<%@page import="model.Album"%>
<%@page import="modelDAO.AlbumDAO"%>
<%@page import="model.Favoritos"%>
<%@page import="model.Artistas"%>
<%@page import="modelDAO.ArtistasDAO"%>
<%@page import="model.Canciones"%>
<%@page import="model.Usuarios"%>
<%@page import="modelDAO.FavoritosDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="view ort" content="width=device-width, initial-scale=l. Ü" >
        <link rel="stylesheet" href="Css/Cancion.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
        <title>Mizik® for everyone</title>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <script>
            function reproducir() {
                localStorage.isRun = true;
                const audio = document.getElementById("audio");
                const songSlider = document.querySelector(".song-slider input");
                const currentTimeDisplay = document.getElementById("tiempoCancion");
                const duracion = document.getElementById("duracion");
                const duracionCancion = audio.duration;

                const minutes = Math.floor(duracionCancion / 60);
                const seconds = Math.floor(duracionCancion % 60);

                if (seconds < 10) {
                    var segundos = "0" + seconds.toString();
                    console.log("Estos son los segundos: " + segundos);
                    duracion.textContent = minutes + ':' + segundos
                } else {
                    duracion.textContent = minutes + ':' + seconds;
                }

                audio.addEventListener("timeupdate", function () {
                    const currentTime = audio.currentTime;
                    const duration = audio.duration;
                    const percentage = (currentTime / duration) * 100;

                    songSlider.value = percentage;

                    const minutes = Math.floor(currentTime / 60);
                    const seconds = Math.floor(currentTime % 60);

                    if (seconds < 10) {
                        var segundos = "0" + seconds.toString();
                        console.log("Estos son los segundos: " + segundos);
                        currentTimeDisplay.textContent = minutes + ':' + segundos
                    } else {
                        currentTimeDisplay.textContent = minutes + ':' + seconds;
                    }
                });

                // Agrega un evento para controlar el avance o retroceso en la canción
                songSlider.addEventListener("input", function () {
                    const duration = audio.duration;
                    const newPosition = (this.value / 100) * duration;

                    // Actualiza la posición de reproducción del audio
                    audio.currentTime = newPosition;
                });

                // Inicia la reproducción de la canción
                audio.play();
            }

            function detener() {
                console.log(localStorage.isRun);
                if (localStorage.isRun === "true") {
                    const audio = document.getElementById("audio");
                    audio.pause();
                    localStorage.isRun = "false";
                } else if (localStorage.isRun === "false") {
                    const audio = document.getElementById("audio");
                    audio.play();
                    localStorage.isRun = "true";
                }
            }

        </script>
    </head>
    <body onload="reproducir()">
        <audio src="${urlRAW}" id="audio" ></audio>
        <div class="music-player">
            <div class="cover-art">

                <%
                    AlbumDAO albumDAO = new AlbumDAO();
                    String obtenerNombreAlbum;
                    Album album = albumDAO.buscarAlbumes(((Canciones) request.getAttribute("cancion")).getCodigoAlbum());
                    obtenerNombreAlbum = album.getNombreAlbum();
                    if (obtenerNombreAlbum == null) {
                        obtenerNombreAlbum = "Desconocido";
                    }
                %>

                <img src="img/album/<%= obtenerNombreAlbum%>.jpg"  alt="300" width="300" style="margin-top: 10px"/><br>
            </div>
            <div class="music-time">
                <div class="current-time" id="tiempoCancion">0:00</div>
                <div class="song-slider">
                    <input type="range" value="0" class="elemento">
                </div>
                <div class="total-time" id="duracion">0:00</div>
            </div>
            <div class="music-controls">

                <button class="repeat-button">
                    <i class="fa-solid fa-repeat"></i>
                </button>

                <button class="prev-button" id="refresh-button">
                    <i class="fa-solid fa-backward"></i>
                </button>
                <script>
                    document.getElementById('refresh-button').addEventListener('click', function () {
                        location.reload();
                    });
                </script>

                <button class="play-button" id="playPauseButton" onclick="detener()">
                    <i id="playPauseIcon" class="fa-solid fa-pause"></i>
                </button>
                <script>
                    const playPauseButton = document.getElementById("playPauseButton");
                    const playPauseIcon = document.getElementById("playPauseIcon");

                    let isPlaying = true; // Inicialmente, la canción está reproduciéndose

                    playPauseButton.addEventListener("click", () => {
                        // Cambia el estado de reproducción al hacer clic
                        isPlaying = !isPlaying;

                        // Actualiza el icono según el estado de reproducción
                        if (isPlaying) {
                            playPauseIcon.classList.remove("fa-play");
                            playPauseIcon.classList.add("fa-pause");
                        } else {
                            playPauseIcon.classList.remove("fa-pause");
                            playPauseIcon.classList.add("fa-play");
                        }
                    });
                    localStorage.isRun = isPlaying;
                </script>

                <button class="next-button">
                    <i class="fa-solid fa-forward"></i>
                </button>

                <%
                    // Obtener el ID de la canción y el ID del usuario
                    int idCancion = ((Canciones) request.getAttribute("cancion")).getCodigoCancion();
                    int idUsuario = (Integer) request.getAttribute("usuario");

                    // Verificar si la canción está en favoritos
                    FavoritosDAO favDAO = new FavoritosDAO();
                    Favoritos favorito = favDAO.buscarFavoritos(idCancion, idUsuario);

                    // Determinar el estado de "Me gusta"
                    boolean isFav = (favorito.getCodigoFav() != 0);
                %>
                <button class="heart-button" id="botonMegusta">
                    <i id="meGusta" class="fa-heart <%= isFav ? "fa-solid" : "fa-regular"%>" style="color: <%= isFav ? "#cfa618" : "#000000"%>;"></i>
                </button>
                <script>
                    const botonMegusta = document.getElementById("botonMegusta");
                    const meGusta = document.getElementById("meGusta");
                    let isFav = <%= (favorito.getCodigoFav() != 0)%>;
                    const idUsuario = <%= (Integer) request.getAttribute("usuario")%>;
                    const idCancion = <%= ((Canciones) request.getAttribute("cancion")).getCodigoCancion()%>

                    botonMegusta.addEventListener("click", () => {
                        // Cambia el estado de "Me gusta"
                        isFav = !isFav;
                        console.log("Botón Me gusta fue clickeado");
                        console.log(idUsuario);
                        console.log(idCancion);

                        // Actualiza el icono y el color según el estado
                        meGusta.classList.remove(isFav ? "fa-regular" : "fa-solid");
                        meGusta.classList.add(isFav ? "fa-solid" : "fa-regular");
                        meGusta.style.color = isFav ? "#cfa618" : "#000000";

                        const url = isFav ? "http://localhost:8080/Mizik/src/java/controller/Controlador?menu=Favoritos&accion=AgregarFavorito&idUsuario=" + idUsuario + "&idCancion=" + idCancion : "http://localhost:8080/Mizik/src/java/controller/Controlador?menu=Favoritos&accion=EliminarFavorito&idUsuario=" + idUsuario + "&idCancion=" + idCancion;
                        const data = {
                            idUsuario: idUsuario,
                            idCancion: idCancion
                        };

                        fetch(url, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify(data)
                        })
                                .then(response => response.json())
                                .then(result => {
                                    if (result.success) {
                                        if (isFav) {
                                            // Realizar acciones adicionales si se agregó a favoritos
                                        } else {
                                            // Realizar acciones adicionales si se eliminó de favoritos
                                        }
                                    } else {
                                        // Manejar el caso de error
                                        console.error("Error al procesar la solicitud");
                                    }
                                })
                                .catch(error => {
                                    console.error("Error en la solicitud:", error);
                                });
                    });
                </script>
            </div>
            <div class="music-details"></div>
            <div class="music-title"><%= ((Canciones) request.getAttribute("cancion")).getNombreCancion()%></div>
            <%
                ArtistasDAO artistaDAO = new ArtistasDAO();
                String obtenerNombreArtista;
                Artistas artista = artistaDAO.buscarArtista(((Canciones) request.getAttribute("cancion")).getCodigoArtista());
                obtenerNombreArtista = artista.getNombreArtista();
                if (obtenerNombreArtista == null) {
                    obtenerNombreArtista = "Desconocido";
                }
            %>
            <div class="music-artist"><%= obtenerNombreArtista%></div>

            <br>
        </div>
    </body>
</html>

