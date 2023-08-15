<%-- 
    Document   : mixes
    Created on : 23/07/2023, 07:28:35 PM
    Author     : luciano
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Mixes"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.MixesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mizik®</title>
    </head>
    <body>
        <div>
            <h1>Mixes del día</h1>
            <a href="Controlador?accion=principal">🢀</a><br>
            <table border="2">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Canciones</th>
                        <th>Género</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <%
                    MixesDAO dao = new MixesDAO();
                    List<Mixes> listaGenero = dao.listarMixes();
                    Iterator<Mixes> iterator = listaGenero.iterator();
                    Mixes g = null;
                    while (iterator.hasNext()) {
                        g = iterator.next();

                %>


                <tbody>
                    <tr>
                        <td><%= g.getCodigoMix()%></td>
                        <td><%= g.getNombreMix()%></td>
                        <td><%= g.getDescripcionMix()%></td>
                        <td><%= g.getCantidadCanciones()%></td>
                        <td><%= g.getCodigoGenero()%></td>
                        <td>
                            <a href="Controlador?accion=mix&id=<%= g.getCodigoMix()%>">Abrir</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>

            </table>
        </div>
    </body>
</html>
