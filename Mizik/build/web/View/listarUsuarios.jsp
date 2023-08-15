<%-- 
    Document   : listarUsuarios
    Created on : 21/07/2023, 10:04:35 AM
    Author     : Drake
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.UsuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración</title>
    </head>
    <body>
        <div>
            <h1>Usuarios</h1>
            <a href="Controlador?accion=Principal">🢀</a><br>
            <a href="Controlador?accion=addUsuario">Agregar Nuevo Usuario</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombres</th>
                    <th>Correo</th>
                    <th>Usuario</th>
                    <th>Contraseña</th>
                </tr>
            </thead>
            <%
                UsuariosDAO dao = new UsuariosDAO();
                List<Usuarios> listaUsuario = dao.listarUsuarios();
                Iterator<Usuarios> iterator = listaUsuario.iterator();
                Usuarios per = null;
                while(iterator.hasNext()){
                    per = iterator.next();
                
             %>
            <tbody>
                <tr>
                    <td><%=per.getCodigoUsuario()%></td>
                    <td><%=per.getNombreCompleto()%></td>
                    <td><%=per.getCorreoUsuario()%></td>
                    <td><%=per.getUsuario()%></td>
                    <td><%=per.getClaveUsuario()%></td>
                    <td>
                        <a href="Controlador?accion=edit&codigoUsuario=<%= per.getCodigoUsuario()%>">Edit</a>
                        <a href="#" onclick="confirmarEliminacion(<%= per.getCodigoUsuario()%>)">Eliminar</a>
                    </td>
                </tr>
                <%}%>
                <script>
                    function confirmarEliminacion(usuarioId) {
                        var confirmacion = confirm("¿Estás seguro de que deseas eliminar este usuario?");
                        if (confirmacion) {
                            window.location.href = "Controlador?accion=eliminarUsuario&id=" + usuarioId;
                        } else {
                            // El usuario canceló la eliminación, no se hace nada.
                        }
                    }
                </script>
            </tbody>
        </table>
        </div>
    </body>
</html>

