<%-- 
    Document   : canciones
    Created on : 23/07/2023, 08:59:52 PM
    Author     : luciano
--%>
<%@page import="model.Album"%>
<%@page import="modelDAO.AlbumDAO"%>
<%@page import="model.Artistas"%>
<%@page import="modelDAO.ArtistasDAO"%>
<%@page import="model.Generos"%>
<%@page import="modelDAO.GeneroDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Canciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/buscar.ico" />
        <title>Buscar</title>
    </head>
    <body>
        <div class="container">
            <div class="page-header">
                <h1>Reproductor de Música</h1>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <audio id="reproductor" controls class="col-xs-12">
                        <source src="" type="audio/mpeg">
                        Tu navegador no soporta la reproducción de audio.
                    </audio>
                </div>
            </div>

            <div>
                <h1>Canciones</h1>
                <a href="Controlador?accion=principal">🢀</a><br>
                <table border="4">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Canción</th>
                            <th>Duración</th>
                            <th>Género</th>
                            <th>Artista</th>
                            <th>Álbum</th>
                        </tr>
                    </thead>
                    <%
                        CancionesDAO dao = new CancionesDAO();
                        List<Canciones> listaPlaylisthasCancionesDAO = dao.listarCanciones();
                        Iterator<Canciones> iterator = listaPlaylisthasCancionesDAO.iterator();
                        Canciones Mix = null;
                        while (iterator.hasNext()) {
                            Mix = iterator.next();
                            
                            GeneroDAO generosDAO = new GeneroDAO();
                            String obtenerNombreGenero;
                            Generos genero = generosDAO.buscarGeneros(Mix.getCodigoGenero());
                            obtenerNombreGenero = genero.getNombreGenero();
                            if(obtenerNombreGenero == null){
                                obtenerNombreGenero = "Desconocido";
                            }

                            ArtistasDAO artistaDAO = new ArtistasDAO();
                            String obtenerNombreArtista;
                            Artistas artista = artistaDAO.buscarArtistas(Mix.getCodigoArtista());
                            obtenerNombreArtista = artista.getNombreArtista();
                            if(obtenerNombreArtista == null){
                                obtenerNombreArtista = "Desconocido";
                            }

                            AlbumDAO albumDAO = new AlbumDAO();
                            String obtenerNombreAlbum;
                            Album album = albumDAO.buscarAlbumes(Mix.getCodigoAlbum());
                            obtenerNombreAlbum = album.getNombreAlbum();
                            if(obtenerNombreAlbum == null){
                                obtenerNombreAlbum = "Desconocido";
                            }
                    %>
                    <tbody>
                        <tr>
                            <td><%= Mix.getCodigoCancion()%></td>
                            <td><%= Mix.getNombreCancion()%></td>
                            <td><%= Mix.getDuracion()%></td>
                            <td><%= obtenerNombreGenero %></td>
                            <td><%= obtenerNombreArtista %></td>
                            <td><%= obtenerNombreAlbum %></td>
                            <td>
                                <a href="#" onclick="reproducirCancion('<%= Mix.getNombreRaw()%>')"> ▶ </a>

                                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                <script>
                                    function reproducirCancion(rutaCancion) {
                                        var reproductor = document.getElementById("reproductor");
                                        var source = reproductor.getElementsByTagName("source")[0];
                                        source.setAttribute("src", rutaCancion);
                                        reproductor.load();
                                        reproductor.play();
                                    }
                                </script>
                            </td>  
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>

    </body>
</html>

