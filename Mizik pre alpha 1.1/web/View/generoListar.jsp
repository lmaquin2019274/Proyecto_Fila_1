<%-- 
    Document   : generoListar
    Created on : 16-jul-2023, 19:09:31
    Author     : user
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Generos"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.GeneroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
    </head>
    <body>
        <div>
            <h1>Géneros</h1>
            <table border="2">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Origen</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <%
                    GeneroDAO dao = new GeneroDAO();
                    List<Generos> listaGenero = dao.listarGeneros();
                    Iterator<Generos> iterator = listaGenero.iterator();
                    Generos g = null;
                    while (iterator.hasNext()) {
                        g = iterator.next();

                %>


                <tbody>
                    <tr>
                        <td><%= g.getCodigoGenero()%></td>
                        <td><%= g.getNombreGenero()%></td>
                        <td><%= g.getOrigen()%></td>
                        <td><%= g.getDescripcion()%></td>
                        <td>
                            <a href="">Buscar</a>
                            <a href="">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>

            </table>
        </div>
    </body>
</html>
