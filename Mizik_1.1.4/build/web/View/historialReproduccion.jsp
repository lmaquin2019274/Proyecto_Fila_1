<%-- 
    Document   : historialReproduccion
    Created on : 20/07/2023, 05:52:34 PM
    Author     : Ivan
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.HistorialReproduccion"%>
<%@page import="modelDAO.HistorialReproduccionDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración</title>
    </head>
    <body>
        <h1>Historial de Reproducción</h1>
        <a href="Controlador?accion=config">🢀</a><br>
        <table border="4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Origen</th>
                    <th>Usuario</th>
                    <th>Canción</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%
                HistorialReproduccionDAO dao = new HistorialReproduccionDAO();
                List<HistorialReproduccion> listaHistorialReproduccion = dao.listarHistorialReproduccion();
                Iterator<HistorialReproduccion> iterator = listaHistorialReproduccion.iterator();
                HistorialReproduccion fav = null;
                while (iterator.hasNext()){
                    fav = iterator.next();

            %>
            <tbody>
                <tr>
                    <td><%= fav.getCodigoHistorialR()%></td>
                    <td><%= fav.getFechaHR()%></td>
                    <td><%= fav.getHoraHR()%></td>
                    <td><%= fav.getOrigen()%></td>
                    <td><%= fav.getCodigoUsuario()%></td>
                    <td><%= fav.getCodigoCancion()%></td>
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
