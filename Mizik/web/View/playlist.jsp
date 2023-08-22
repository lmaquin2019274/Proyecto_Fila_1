<%-- 
    Document   : playlist
    Created on : 24/07/2023, 10:36:10 AM
    Author     : luciano
--%>

<%@page import="model.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="model.Canciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playlist</title>
    </head>
    <body>
        <h1>Playlist: <%= ((Playlist) request.getAttribute("playlist")).getNombrePlaylist() %></h1>
        
        <h2>Canciones:</h2>
        <a href="Controlador?accion=playlists">🢀</a><br>
        <a href="Controlador?accion=addCancionesPlaylist&playlistId=<%= ((Playlist) request.getAttribute("playlist")).getCodigoPlaylist()%>">Agregar Canción</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Duración</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Canciones> listaCanciones = (List<Canciones>) request.getAttribute("canciones");
                if (listaCanciones != null && !listaCanciones.isEmpty()) {
                    for (Canciones cancion : listaCanciones) {
                        %>
                        <tr>
                            <td><%= cancion.getCodigoCancion() %></td>
                            <td><%= cancion.getNombreCancion() %></td>
                            <td><%= cancion.getDuracion() %></td>
                            <td>
                                <a href="">Reproducir</a>
                            </td>
                        </tr>
                        <% 
                    }
                } else {
                    %>
                    <tr>
                        <td colspan="4">No hay canciones disponibles.</td>
                    </tr>
                    <% 
                }
                %>
            </tbody>
        </table>
    </body>
</html>

