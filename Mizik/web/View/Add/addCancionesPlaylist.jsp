<%-- 
    Document   : addCancionesPlaylist
    Created on : 30/07/2023, 05:31:37 PM
    Author     : luciano
--%>

<%@page import="model.Playlist"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Canciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Playlist: <%= ((Playlist) request.getAttribute("playlist")).getNombrePlaylist() %></title>
    <!-- Agregar enlace a Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h1>Canciones disponibles</h1>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Canción</th>
            <th>Duración</th>
            <th>Género</th>
            <th>Artista</th>
            <th>Álbum</th>
            <th></th>
        </tr>
        </thead>
        <%
        CancionesDAO dao = new CancionesDAO();
        List<Canciones> listaPlaylisthasCancionesDAO = dao.listarCanciones();
        Iterator<Canciones> iterator = listaPlaylisthasCancionesDAO.iterator();
        Canciones Mix = null;
        while (iterator.hasNext()){
            Mix = iterator.next();
        %>
        <tbody>
        <tr>
            <td><%= Mix.getCodigoCancion()%></td>
            <td><%= Mix.getNombreCancion()%></td>
            <td><%= Mix.getDuracion()%></td>
            <td><%= Mix.getCodigoGenero()%></td>
            <td><%= Mix.getCodigoArtista()%></td>
            <td><%= Mix.getCodigoAlbum()%></td>
            <td>
                <form action="Controlador" method="post">
                    <input type="hidden" name="menu" value="Add">
                    <input type="hidden" name="accion" value="agregarCancionPlaylist">
                    <input type="hidden" name="playlistId" value="<%= ((Playlist) request.getAttribute("playlist")).getCodigoPlaylist() %>">
                    <input type="hidden" name="cancionId" value="<%= Mix.getCodigoCancion() %>">
                    <!-- Usar clases de Bootstrap para el botón -->
                    <button type="submit" class="btn btn-primary">Agregar</button>
                </form>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<!-- Agregar enlace a Bootstrap JS y jQuery (opcional) al final del archivo -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

