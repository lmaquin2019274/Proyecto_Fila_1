<%-- 
    Document   : Expirado
    Created on : 21/08/2023, 10:52:10 AM
    Author     : lucciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="img/buscar.ico" />
    <title>Inicio de sesión expirado</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        /* Personalizar estilos adicionales si es necesario */
        body {
            background-color: #f8f9fa;
        }
        
        .container {
            margin-top: 100px;
            text-align: center;
        }
        
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Tu inicio de sesión ha expirado!</h1>
        <br>
        <img src="img/expirado.png" alt="70" width="130"/><br>
        <br>
        <h2>Vuelve a iniciar sesión</h2>
        <br>
        <a class="btn btn-custom" href="Controlador?accion=index">Cerrar Sesión</a>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

