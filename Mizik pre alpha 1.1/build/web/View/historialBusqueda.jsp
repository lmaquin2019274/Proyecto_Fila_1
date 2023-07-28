<%-- 
    Document   : historialBusqueda
    Created on : 24/07/2023, 09:08:44 AM
    Author     : luciano
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.HistorialBusqueda"%>
<%@page import="modelDAO.HistorialBusquedaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración</title>
    </head>
    <body>
        <h1>Historial de Reproducción</h1>
        <table border="4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Palabra</th>
                    <th>Usuario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%
                HistorialBusquedaDAO dao = new HistorialBusquedaDAO();
                List<HistorialBusqueda> listaHistorialReproduccion = dao.listarHistorialBusqueda();
                Iterator<HistorialBusqueda> iterator = listaHistorialReproduccion.iterator();
                HistorialBusqueda fav = null;
                while (iterator.hasNext()){
                    fav = iterator.next();

            %>
            <tbody>
                <tr>
                    <td><%= fav.getCodigoHistorialB()%></td>
                    <td><%= fav.getFechaHB()%></td>
                    <td><%= fav.getHoraHB()%></td>
                    <td><%= fav.getPalabraBuscada()%></td>
                    <td><%= fav.getCodigoUsuario()%></td>
                    <td>
                        <a href="">edit</a>
                        <a href="">Eliminar</a>
                    </td>  
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>
    </body>
</html>
