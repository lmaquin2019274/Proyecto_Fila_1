<%-- 
    Document   : addMixeshasCanciones
    Created on : 21/07/2023, 17:54:01 PM
    Author     : Diego2019417
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar MixeshasCanciones</title>
    </head>
    <body>
        <h1>Agregar MixeshasCanciones</h1>
        <form action="Controlador">
            <strong>FechaMC:</strong><br>
            <input type="date" name="txtfechaMC"><br><br>
            <strong>HoraMC:</strong><br>
            <input type="datetime" name="txthoraMC"><br><br>
            <strong>Numero Unico:</strong><br>
            <input type="text" name="txtnumeroUnico"><br><br>
            <strong>Codigo Cancion:</strong><br>
            <input type="text" name="txtcodigoCancion"><br><br>
            <strong>Codigo Mix:</strong><br>
            <input type="text" name="txtcodigoMix"><br><br>
            <input type="submit" name="accion" value="Agregar"><br><br>
        </form>
    </body>
</html>
