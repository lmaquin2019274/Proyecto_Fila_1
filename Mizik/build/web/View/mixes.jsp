<%-- 
    Document   : mixes
    Created on : 23/07/2023, 07:28:35 PM
    Author     : luciano
--%>

<%@page import="model.Generos"%>
<%@page import="modelDAO.GeneroDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Mixes"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.MixesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/principal.ico" />
        <title>Principal</title>
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
                        
                    GeneroDAO generosDAO = new GeneroDAO();

                    String obtenerNombreGenero;
                    Generos genero = generosDAO.buscarGenero(g.getCodigoGenero());
                    obtenerNombreGenero = genero.getNombreGenero();
                    if(obtenerNombreGenero == null){
                        obtenerNombreGenero = "Desconocido";
                    }

                %>


                <tbody>
                    <tr>
                        <td><%= g.getCodigoMix()%></td>
                        <td><%= g.getNombreMix()%></td>
                        <td><%= g.getCantidadCanciones()%></td>
                        <td><%= obtenerNombreGenero %></td>
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