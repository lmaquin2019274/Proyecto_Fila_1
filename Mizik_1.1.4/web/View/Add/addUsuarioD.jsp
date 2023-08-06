<%-- 
    Document   : addUsuarioD
    Created on : 30/07/2023, 06:23:09 PM
    Author     : luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <h1>Nuevo Usuario</h1>
        <form action="Controlador" method="post">
            <input type="hidden" name="menu" value="Add">
            <strong>Nombre</strong><br>
            <input type="text" name="txtNombre"><br><br>
            <strong>Usuario</strong><br>
            <input type="text" name="txtUsuario"><br><br>
            <strong>Correo</strong><br>
            <input type="text" name="txtCorreo"><br><br>
            <strong>Contraseña</strong><br>
            <input type="text" name="txtClave"><br><br>
            <input type="submit" name="accion" value="AgregarUsuarioD"><br><br>
        </form>
    </body>
</html>
