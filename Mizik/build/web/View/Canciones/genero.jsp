<%-- 
    Document   : genero
    Created on : 15/08/2023, 11:37:26 AM
    Author     : lucciano
--%>

<%@page import="model.Generos"%>
<%@page import="java.util.List"%>
<%@page import="model.Canciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Géneros</title>
    </head>
    <body>
        <h1>Género: <%= ((Generos) request.getAttribute("genero")).getNombreGenero() %></h1>
        <h3>Descripción: <%= ((Generos) request.getAttribute("genero")).getDescripcion() %></h3>
        
        <h2>Canciones:</h2>
        <a href="Controlador?accion=genero">🢀</a><br>
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
