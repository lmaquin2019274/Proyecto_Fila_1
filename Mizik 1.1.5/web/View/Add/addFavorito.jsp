<%-- 
    Document   : addFavorito
    Created on : 19/07/2023, 11:43:18 AM
    Author     : lmaquin2019274
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Favorito</title>
    </head>
    <body>
        <h1>Agregar Favorito</h1>
        <form action="Controlador">
            <strong>cantidad de canciones:</strong><br>
            <input type="text" name="txtCantidadCanciones"><br><br>
            <strong>duracion total:</strong><br>
            <input type="text" name="txtDuracionTotal"><br><br>
            <strong>cantidad artistas:</strong><br>
            <input type="text" name="txtCantidadArtistas"><br><br>
            <strong>codigo usario:</strong><br>
            <input type="text" name="txtCodigoUsuario"><br><br>
            <strong>codigo cancion:</strong><br>
            <input type="text" name="txtCodigoCancion"><br><br>
            <input type="submit" name="accion" value="Agregar"><br><br>
        </form>
    </body>
</html>
