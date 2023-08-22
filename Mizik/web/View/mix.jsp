<%-- 
    Document   : mix
    Created on : 6/08/2023, 01:08:42 PM
    Author     : luciano
--%>

<%@page import="model.Mixes"%>
<%@page import="java.util.List"%>
<%@page import="model.Canciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mixes</title>
    </head>
    <body>
        <h1>Mix <%= ((Mixes) request.getAttribute("mix")).getNombreMix() %></h1>
        
        <h2>Canciones:</h2>
        <a href="Controlador?accion=mixes">🢀</a><br>
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
