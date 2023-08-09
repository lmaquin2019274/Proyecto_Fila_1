<%-- 
    Document   : addCancionesPlaylist
    Created on : 30/07/2023, 05:31:37 PM
    Author     : luciano
--%>

<%@page import="model.Playlist"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Canciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playlist: <%= ((Playlist) request.getAttribute("playlist")).getNombrePlaylist() %></title>
    </head>
    <body>
        
        <div>
        <h1>Canciones disponibles</h1>
        <table border="4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Canción</th>
                    <th>Duración</th>
                    <th>Género</th>
                    <th>Artista</th>
                    <th>Álbum</th>
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
                    <td><%= Mix.getDuracion()%></td>
                    <td><%= Mix.getCodigoGenero()%></td>
                    <td><%= Mix.getCodigoArtista()%></td>
                    <td><%= Mix.getCodigoAlbum()%></td>
                    <td>
                        <form action="Controlador" method="post">
                            <input type="hidden" name="menu" value="Add">
                            <input type="hidden" name="accion" value="agregarCancionPlaylist">
                            <input type="hidden" name="playlistId" value="<%= ((Playlist) request.getAttribute("playlist")).getCodigoPlaylist() %>">
                            <input type="hidden" name="cancionId" value="<%= Mix.getCodigoCancion() %>">
                            <input type="submit" value="Agregar">
                        </form>
                    </td>  
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>
    </body>
</html>
