<%-- 
    Document   : MixeshasCanciones
    Created on : 20/07/2023, 02:31:17 PM
    Author     : Brandon2019417
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.PlaylisthasCanciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.PlaylisthasCancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
    </head>
    <body>
        
        <div>
        <h1>Tus Playlist Canciones</h1>
        <a href="Controlador?accion=addMixeshasCanciones"> Agregar Nuevos MixesCanciones</a>
        <table border="4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Numero Unico</th>
                    <th>Canción</th>
                    <th>Playlist</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%
            PlaylisthasCancionesDAO dao = new PlaylisthasCancionesDAO();
                List<PlaylisthasCanciones> listaPlaylisthasCancionesDAO = dao.listarPlaylisthasCanciones();
                Iterator<PlaylisthasCanciones> iterator = listaPlaylisthasCancionesDAO.iterator();
                PlaylisthasCanciones Mix = null;
                while (iterator.hasNext()){
                    Mix = iterator.next();

            %>
            <tbody>
                <tr>
                    <td><%= Mix.getCodigoPlaylisthasCanciones()%></td>
                    <td><%= Mix.getFechaPC()%></td>
                    <td><%= Mix.getHoraPC()%></td>
                    <td><%= Mix.getNumeroUnico()%></td>
                    <td><%= Mix.getCodigoCancion()%></td>
                    <td><%= Mix.getCodigoPlaylist()%></td>
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

