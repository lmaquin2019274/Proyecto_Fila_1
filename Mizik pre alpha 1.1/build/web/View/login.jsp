<%-- 
    Document   : login
    Created on : 24/07/2023, 09:18:02 AM
    Author     : luciano
--%>

<%@page import="java.util.Iterator"%>
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
            <table border="2">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Canciones</th>
                        <th>Género</th>
                        <th>Canción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <%
                    LoginDAO dao = new LoginDAO();
                    List<Login> listaGenero = dao.listarLogins();
                    Iterator<Login> iterator = listaGenero.iterator();
                    Login g = null;
                    while (iterator.hasNext()) {
                        g = iterator.next();

                %>


                <tbody>
                    <tr>
                        <td><%= g.getCodigoLogin()%></td>
                        <td><%= g.getFechaLogin()%></td>
                        <td><%= g.getHoraLogin()%></td>
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
