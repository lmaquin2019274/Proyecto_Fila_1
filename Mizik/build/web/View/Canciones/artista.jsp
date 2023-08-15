<%-- 
    Document   : artista
    Created on : 15/08/2023, 11:37:05 AM
    Author     : lucciano
--%>

<%@page import="model.Artistas"%>
<%@page import="java.util.List"%>
<%@page import="model.Canciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artistas</title>
    </head>
    <body>
        <h1>Artistas: <%= ((Artistas) request.getAttribute("artista")).getNombreArtista() %></h1>
        
        <h2>Canciones:</h2>
        <a href="Controlador?accion=artistas">🢀</a><br>
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
                <% } %>
            </tbody>
        </table>
    </body>
</html>
