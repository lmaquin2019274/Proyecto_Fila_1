<%-- 
    Document   : addPlaylist
    Created on : 20/07/2023, 11:16:10 PM
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tus Playlists</title>
    </head>
    <body>
        <h1>Nueva Playlist</h1>
        <form action="Controlador" method="post">
            <input type="hidden" name="menu" value="Add">
            <Strong>Nombre</strong><br>
            <input type="text" name="txtNombrePlaylist"><br><br>
            <Strong>Descripcion</strong><br>
            <input type="text" name="txtDescripcionPlaylist"><br><br>
            <input type="submit" name="accion" value="AgregarPlaylist"><br><br>
        </form>
    </body>
</html>


