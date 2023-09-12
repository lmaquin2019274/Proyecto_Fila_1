<%-- 
    Document   : buscar
    Created on : 8/09/2023, 07:13:57 PM
    Author     : lucciano
--%>

<%@page import="modelDAO.CancionesDAO"%>
<%@page import="model.Canciones"%>
<%@page import="model.Album"%>
<%@page import="modelDAO.AlbumDAO"%>
<%@page import="model.Artistas"%>
<%@page import="modelDAO.ArtistasDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Generos"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.GeneroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/buscar.ico" />
        <title>Buscar</title>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-decoration: none;
                font-family: 'Maven Pro', sans-serif;
            }

            .artist-card {
                margin-top: 20px;
                width: 24%;
                display: inline-block;
                text-align: center;
            }

            .mini-artist-card {
                width: 90%;
                margin-left: 50px;
                margin-top: 10px;
                margin-bottom: 10px;
                display: inline-block;
                display: flex;
                align-items: center;
                text-align: left;
                padding: 10px;
            }

            .mini-artist-card:hover{
                border-radius: 15px;
                cursor: pointer;
                background: #e6e6e6;
            }

            .mini-artist-card a {
                display: block;
                height: 100%;
                width: 100%;
            }

            .song-image {
                margin-right: 20px;
            }

            .song-details {
                position:absolute;
                margin-top: -56px;
                margin-left: 130px;
                flex-grow: 1;
                display: flex;
                flex-direction: column;
            }

            .song-title {
                cursor: pointer;
                font-weight: bold;
            }

            .artist-name {
                cursor: pointer;
                font-size: 14px;
                color: gray;
            }


            .artista-card {
                width: 19%;
                display: inline-block;
                text-align: center;
            }

            .circular-image {
                border-radius: 50%;
                max-width: 100%;
            }

            header{
                width: 100%;
                height: 80px;
                background: #f5f5f5;
                display: flex;
                align-items: center;
                position: fixed;
                top: 0;
                z-index: 200;
            }

            main{
                margin-top: 80px;
                padding: 20px;
            }

            .icon_menu{
                width: 100px;
                height: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                transform: translateX(10px);
                background: #f5f5f5;
            }

            .icon_menu i{
                font-size: 35px;
                cursor: pointer;
            }

            .search-bar {
                width: 80%;
                display: flex;
                align-items: center;
                border: 2px solid #ccc;
                border-radius: 20px;
                margin-top: 20px;
                height: 47px;
                max-width: 800px;
                margin: 0 auto;
            }

            .search-bar input[type="text"] {
                border: none;
                outline: none;
                flex: 1;
                padding: 6px;
                border-radius: 20px 0px 0px 20px;
            }

            .search-icon {
                border: 2px solid #ccc;
                color: #fff;
                background-color: #ccc;
                border-radius: 0 17px 17px 0;
                cursor: pointer;
                padding: 14px 19px;
            }

            .search-icon:hover{
                color: #fff;
                background-color: #e6e6e6;
            }

            .search-icon:active {
                color: #ccc;
                background-color: #fff;
            }

            .search-bar input[type="text"]:focus {
                width: 100%;
                max-width: 800px;
            }

            .search-bar input[type="text"]:focus + .search-icon {
                color: #fff;
                background-color: #ccc;
            }

            .filtro{
                display: none;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="icon_menu">
                <a href="Controlador?accion=principal">
                    <i class="fa-solid fa-circle-left" style="color: #454545;"></i>
                </a>
            </div>
            <div>
                <h1>.  Unas cuantas búsquedas</h1>
            </div>
        </header>
        <main style="margin-top: 80px;">
            <div class="search-bar">
                <input type="text" id="buscador" name="buscador" placeholder="Busca canciones, artistas y álbumes">
                <i class="fa-solid fa-magnifying-glass" style="color: #ccc; margin-right: 15px;"></i>
            </div>


            <h2>Géneros</h2>
            <div class="row" style="margin-top: 20px;">
                <%
                    GeneroDAO dao = new GeneroDAO();
                    List<Generos> listaGenero = dao.listarGeneros();
                    Iterator<Generos> iterator = listaGenero.iterator();
                    Generos g = null;
                    int generCount = 0;

                    while (iterator.hasNext()) {
                        g = iterator.next();
                %>
                <div class="artist-card articulo">
                    <a href="Controlador?accion=generoCancionD&id=<%= g.getCodigoGenero()%>">
                        <img src="img/genero/<%= g.getNombreGenero()%>.jpg" alt="<%= g.getNombreGenero()%>" width="130">
                    </a>
                    <h4><%= g.getNombreGenero()%></h4>
                </div>
                <%
                    generCount++;
                    if (generCount % 10 == 0) {
                %>
            </div>
            <div class="row" style="margin-top: 0px;">
                <%
                        }
                    }
                %>
            </div>

            <br><br><br>
            <h2>Artistas</h2>
            <div class="row" style="margin-top: 20px;">
                <%
                    ArtistasDAO artdao = new ArtistasDAO();
                    List<Artistas> listaArtistas = artdao.listarArtistas();
                    Iterator<Artistas> artiterator = listaArtistas.iterator();
                    Artistas art = null;
                    int artistCount = 0;

                    while (artiterator.hasNext()) {
                        art = artiterator.next();
                %>
                <div class="artista-card articulo">
                    <a href="Controlador?accion=artistaD&id=<%= art.getCodigoArtista()%>">
                        <img src="img/artista/<%= art.getNombreArtista()%>dos.jpg" alt="<%= art.getNombreArtista()%>" width="130" class="circular-image">
                    </a>
                    <h4><%= art.getNombreArtista()%></h4>
                </div>
                <%
                    artistCount++;
                    // Cerrar una fila y abrir una nueva después de mostrar 3 artistas
                    if (artistCount % 5 == 0) {
                %>
            </div>
            <div class="row" style="margin-top: 20px;"> <!-- Agrega margen superior para separar las filas -->
                <%
                        }
                    }
                %>
            </div>

            <br><br><br>
            <h2>Álbumes</h2>
            <div class="row" style="margin-top: 20px;">
                <%
                    AlbumDAO albumdao = new AlbumDAO();
                    List<Album> listaAlbum = albumdao.listarAlbumes();
                    Iterator<Album> albumiterator = listaAlbum.iterator();
                    Album a = null;
                    int albumCount = 0;

                    while (albumiterator.hasNext()) {
                        a = albumiterator.next();
                %>
                <div class="artist-card articulo">
                    <a href="Controlador?accion=albumD&id=<%= a.getCodigoAlbum()%>">
                        <img src="img/album/<%= a.getNombreAlbum()%>.jpg" alt="<%= a.getNombreAlbum()%>" width="130">
                    </a>
                    <h4><%= a.getNombreAlbum()%></h4>
                </div>
                <%
                    albumCount++;
                    // Cerrar una fila y abrir una nueva después de mostrar 3 artistas
                    if (albumCount % 40 == 0) {
                %>
            </div>
            <div class="row" style="margin-top: 0px;"> <!-- Agrega margen superior para separar las filas -->
                <%
                        }
                    }
                %>
            </div>

            <br><br><br>
            <h2>Canciones</h2>
            <div class="row" style="margin-top: 20px;">
                <%
                    CancionesDAO canciondao = new CancionesDAO();
                    List<Canciones> listaCanciones = canciondao.listarCanciones();
                    Iterator<Canciones> caniterator = listaCanciones.iterator();
                    Canciones c = null;
                    int canCount = 0;
                    int x = 0;

                    while (caniterator.hasNext()) {

                        c = caniterator.next();

                        ArtistasDAO artistaDAO = new ArtistasDAO();
                        String obtenerNombreArtista;
                        Artistas artista = artistaDAO.buscarArtistas(c.getCodigoArtista());
                        obtenerNombreArtista = artista.getNombreArtista();
                        if (obtenerNombreArtista == null) {
                            obtenerNombreArtista = "Desconocido";
                        }

                        AlbumDAO albumDAO = new AlbumDAO();
                        String obtenerNombreAlbum;
                        Album album = albumDAO.buscarAlbumes(c.getCodigoAlbum());
                        obtenerNombreAlbum = album.getNombreAlbum();
                        if (obtenerNombreAlbum == null) {
                            obtenerNombreAlbum = "Desconocido";
                        }

                        x = x + 1;
                %>
                <div class="mini-artist-card articulo">
                    <a href="Controlador?accion=cancion&id=<%= c.getCodigoCancion()%>">
                        <div class="song-image">
                            <img style="margin-left: 20px;" src="img/album/<%= obtenerNombreAlbum%>.jpg" alt="<%= c.getNombreCancion()%>" width="60">
                        </div>
                        <div class="song-details">
                            <label class="song-title"><%= c.getNombreCancion()%></label>
                            <label class="artist-name"><%= obtenerNombreArtista%></label>
                        </div>
                    </a>
                </div>

                <%
                    canCount++;
                    if (canCount % 1 == 0) {
                %>
            </div>
            <div class="row" style="margin-top: 0px;"> <!-- Agrega margen superior para separar las filas -->
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</main>
<script src="js/buscar.js"></script>
</body>
</html>
