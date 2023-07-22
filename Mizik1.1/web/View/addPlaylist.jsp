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
        <title>Agregar Playlist</title>
    </head>
    <body>
        <h1>Agregar Playlist</h1>
        <form action="Controlador">
            <Strong>NombrePlaylist:</strong><br><br>
            <input type="text" name="txtNombrePlaylist"><br><br>
            <Strong>DescripcionPlaylist:</strong><br><br>
            <input type="text" name="txtDescripciónPlaylist"><br><br>
            <Strong>CantidadCancionest:</strong><br><br>
            <input type="text" name="txtCantidadCanciones"><br><br>
            <Strong>CodigoUsuario:</strong><br><br>
            <input type="text" name="txtCodigoUsuario"><br><br>
            <input type="submit" name="accion" value="Agregar"><br><br>
        </form>
    </body>
</html>
