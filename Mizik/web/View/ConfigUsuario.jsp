<%-- 
    Document   : ConfigUsuario
    Created on : 21/08/2023, 04:15:47 PM
    Author     : areva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/Perfil.css">
    </head>
    <body>
        <div class="form-container">
            <div class="form-image">
                <h2>Fotografía de Perfil</h2>
                <form enctype="multipart/form-data" action="Controlador?menu=fotoPerfil" method="POST">
                    <div class="form-group">
                        <label for="imagen">Selecciona una imagen:</label>
                        <input type="file" class="form-control-file" name="imagen" id="imagen">
                    </div>
                    <input name="accion" value="SubirFoto" class="btn-submit" type="submit">
                </form>
            </div>
        </div>
    </body>
</html>
