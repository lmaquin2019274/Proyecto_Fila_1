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
        <title>JSP Page</title>
    </head>
    <body>
        <div>
               <h1>Registro de personas</h1>
               <a href="Controlador?accion=addPlaylist">Agregar Nueva Persona</a>
        <table border ="1">
            <thead>
                <tr>
                    <th>CODIGO PLAYLIST</th>
                    <th>NOMBRE PLAYLIST</th>
                    <th>DESCRIPCIÓN PLAYLIST</th>
                    <th>CANTIDAD CANCIONES</th>
                    <th>CODIGO USUARIO</th>
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
                        <a href ="">Edit</a>
                         <a href ="">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
    </body>
</html>
