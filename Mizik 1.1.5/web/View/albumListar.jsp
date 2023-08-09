<%-- 
    Document   : albumListar
    Created on : 21-jul-2023, 16:52:37
    Author     : smaeda-2019256
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Album"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.AlbumDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
    </head>
    <body>
        <h1>Álbumes</h1>
        <a href="Controlador?accion=principal">🢀</a><br>
        <table border="2">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Género</th>
                    <th>Lanzamiento</th>
                    <th>Artista</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            
            <%
              AlbumDAO dao = new AlbumDAO();
              List<Album> listaAlbum = dao.listarAlbumes();
              Iterator<Album> iterator = listaAlbum.iterator();
              Album a = null;
              while (iterator.hasNext()){
                  a = iterator.next();
              
            %>
            
            <tbody>
                <tr>
                    <td><%= a.getCodigoAlbum()%></td>
                    <td><%= a.getNombreAlbum()%></td>
                    <td><%= a.getGeneroComun()%></td>
                    <td><%= a.getFechaLanzamiento()%></td>
                    <td><%= a.getCodigoArtista()%></td>
                    <td>
                        <a href="">Buscar</a>
                        <a href="">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>  
        </table>
    </body>
</html>
