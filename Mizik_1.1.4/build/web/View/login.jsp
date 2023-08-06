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
    <title>Configuración</title>
</head>
<body>
    <div>
        <h1>Registro de ingresos</h1>
        <a href="Controlador?accion=config">🢀</a><br>
        <table border="2">
            <thead>
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
                        <a href="">Abrir</a>
                        <a href="">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>

        </table>
    </div>
</body>
</html>

