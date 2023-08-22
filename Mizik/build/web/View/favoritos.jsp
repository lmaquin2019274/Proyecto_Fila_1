<%-- 
    Document   : favoritos
    Created on : 20/07/2023, 02:31:17 PM
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
        <title>Mizik®</title>
    </head>
    <body>
        <h1>Favoritos <3</h1>
        
        <h2>Canciones:</h2>
        <a href="Controlador?accion=principal">🢀</a><br>
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
                        <td colspan="4">No hay favoritos disponibles.</td>
                    </tr>
                <% 
                }
                %>
            </tbody>
        </table>
    </body>
</html>
