<%-- 
    Document   : listarPlaylist
    Created on : 20/07/2023, 11:23:45 PM
    Author     : sebas
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.PlaylistDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mizik</title>
    </head>
    <body>
        <div>
               <h1>Tus playlists</h1>
               <a href="Controlador?accion=addPlaylist">Agregar Playlist</a>
        <table border ="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Tus canciones</th>
                    <th>Usuario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%  
                PlaylistDAO playlistdao = new PlaylistDAO();
                List<Playlist> listaPlaylist  = playlistdao.listarPlaylists();
                Iterator<Playlist> iterator = listaPlaylist.iterator();
                Playlist play = null;
                    while(iterator.hasNext()){
                        play = iterator.next();
                    
                %>
            <tbody>
                <tr>
                    <td><%= play.getCodigoPlaylist()%></td>
                    <td><%= play.getNombrePlaylist()%></td>
                    <td><%= play.getDescricionPlaylist()%></td>
                    <td><%= play.getCantidadCanciones()%></td>
                    <td><%= play.getCodigoUsuario()%></td>
                    <td>
                        <a href="Controlador?accion=playlist&id=<%= play.getCodigoPlaylist()%>">Abrir</a>
                         <a href ="">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
    </body>
</html>
