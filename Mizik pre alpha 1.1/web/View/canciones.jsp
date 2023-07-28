<%-- 
    Document   : canciones
    Created on : 23/07/2023, 08:59:52 PM
    Author     : luciano
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Canciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
    </head>
    <body>
        
        <div>
        <h1>Canciones</h1>
        <a href="Controlador?accion=addMixeshasCanciones"> Agregar Canciones</a>
        <table border="4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Canción</th>
                    <th>Raw</th>
                    <th>Duración</th>
                    <th>Id Género</th>
                    <th>Id Artista</th>
                    <th>Id Álbum</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%
            CancionesDAO dao = new CancionesDAO();
                List<Canciones> listaPlaylisthasCancionesDAO = dao.listarCanciones();
                Iterator<Canciones> iterator = listaPlaylisthasCancionesDAO.iterator();
                Canciones Mix = null;
                while (iterator.hasNext()){
                    Mix = iterator.next();

            %>
            <tbody>
                <tr>
                    <td><%= Mix.getCodigoCancion()%></td>
                    <td><%= Mix.getNombreCancion()%></td>
                    <td><%= Mix.getNombreRaw()%></td>
                    <td><%= Mix.getDuracion()%></td>
                    <td><%= Mix.getCodigoGenero()%></td>
                    <td><%= Mix.getCodigoArtista()%></td>
                    <td><%= Mix.getCodigoAlbum()%></td>
                    <td>
                        <a href="">Reproducir</a>
                        <a href="">Eliminar</a>
                    </td>  
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>
    </body>
</html>

