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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
    </head>

    <body class="text-center">
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <img src="img/login.jpg" alt="200" width="200" style="margin-top: 20px"/><br>

                    <h3 class="mt-3 text-muted" style="font-size: 20px">
                        Registro de login
                    </h3>

                    <a href="Controlador?accion=principal">
                        <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
                    </a>
                </div>
            </div> 

            <div class="row justify-content-center mt-4">
                <div class="col-md-8">
                    <table class="table">
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
                                <td><%= formattedHoraLogin%></td>
                                <td><%= g.isEstadoSesion()%></td>
                                <td><%= g.getCodigoUsuario()%></td>
                                <td>
                                    <a href="Controlador?accion=eliminarLogin&id=<%= g.getCodigoLogin()%>">
                                        <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


