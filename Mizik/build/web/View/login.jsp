<%-- 
    Document   : login
    Created on : 24/07/2023, 09:18:02 AM
    Author     : luciano
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Login"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="img/opciones.ico" />
    <title>Opciones</title>
    
    <!-- Agrega los enlaces a los archivos de Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1>Registro de ingresos</h1>
        <a class="btn btn-secondary mb-3" href="Controlador?accion=principal">🢀 Volver</a>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Sesión</th>
                    <th>Usuario</th>
                    <th>Acciones</th>
                </tr>
            </thead>

            <%
                LoginDAO dao = new LoginDAO();
                List<Login> listaLogin = dao.listarLogins();
                Iterator<Login> iterator = listaLogin.iterator();
                Login g = null;
                while (iterator.hasNext()) {
                    g = iterator.next();
                    // Formatear la hora utilizando DateTimeFormatter
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                    String formattedHoraLogin = g.getHoraLogin().format(formatter);
            %>

            <tbody>
                <tr>
                    <td><%= g.getCodigoLogin()%></td>
                    <td><%= g.getFechaLogin()%></td>
                    <td><%= formattedHoraLogin %></td>
                    <td><%= g.isEstadoSesion()%></td>
                    <td><%= g.getCodigoUsuario()%></td>
                    <td>
                        <a class="btn btn-danger btn-sm" href="#">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>
</body>
</html>


