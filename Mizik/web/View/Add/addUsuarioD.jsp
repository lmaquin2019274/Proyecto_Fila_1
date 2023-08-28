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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                display: flex;
                align-items: center;
            }
            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
                
            }
            .form-group {
                text-align: left;
            }
            h1 {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Nuevo Usuario</h1>
            
            <!-- Mostrar el mensaje de error si existe -->
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <form action="Controlador" method="post">
                <input type="hidden" name="menu" value="Add">
                <div class="form-group">
                    <label for="txtNombre">Nombre</label>
                    <input type="text" class="form-control" name="txtNombre" required>
                </div>
                <div class="form-group">
                    <label for="txtUsuario">Usuario</label>
                    <input type="text" class="form-control" name="txtUsuario" required>
                </div>
                <div class="form-group">
                    <label for="txtCorreo">Correo</label>
                    <input type="email" class="form-control" name="txtCorreo" required>
                </div>
                <div class="form-group">
                    <label for="txtClave">Contraseña</label>
                    <input type="password" class="form-control" name="txtClave" required>
                </div>
                <br>
                <button type="submit" class="btn btn-primary" name="accion" value="AgregarUsuarioD">Agregar Usuario</button>
            </form>
        </div>
    </body>
</html>