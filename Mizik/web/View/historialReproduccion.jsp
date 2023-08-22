<%-- 
    Document   : historialReproduccion
    Created on : 20/07/2023, 05:52:34 PM
    Author     : Ivan
--%>

<% int codigoUsuario = Integer.parseInt(request.getSession().getAttribute("codigoUsuario").toString()); %>
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
        <a href="Controlador?accion=principal">🢀</a><br>
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
                List<HistorialReproduccion> listaHistorialReproduccion = dao.listarHistorialReproduccion(codigoUsuario);
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
                        <a href="#" onclick="confirmarEliminacion(<%= fav.getCodigoHistorialR()%>)">Eliminar</a>
                    </td>  
                </tr>
                <%}%>
                <script>
                    function confirmarEliminacion(reproduccionId) {
                        var confirmacion = confirm("¿Estás seguro de que deseas eliminar este registro?");
                        if (confirmacion) {
                            window.location.href = "Controlador?accion=eliminarReproduccion&id=" + reproduccionId;
                        } else {
                            // El usuario canceló la eliminación, no se hace nada.
                        }
                    }
                </script>
            </tbody>
        </table>
    </div>
    </body>
</html>
