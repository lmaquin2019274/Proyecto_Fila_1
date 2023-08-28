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
    <link rel="shortcut icon" type="image/x-icon" href="img/opciones.ico"/>
    <title>Opciones</title>
    <!-- Agrega los enlaces a los archivos CSS de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Usuarios</h1>
    <a class="btn btn-secondary mb-3" href="Controlador?accion=Principal">🢀</a>
    <a class="btn btn-primary mb-3" href="Controlador?accion=addUsuario">Agregar Nuevo Usuario</a>
    <table class="table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nombres</th>
            <th>Correo</th>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            UsuariosDAO dao = new UsuariosDAO();
            List<Usuarios> listaUsuario = dao.listarUsuarios();
            Iterator<Usuarios> iterator = listaUsuario.iterator();
            Usuarios per = null;
            while(iterator.hasNext()){
                per = iterator.next();
         %>
            <tr>
                <td><%=per.getCodigoUsuario()%></td>
                <td><%=per.getNombreCompleto()%></td>
                <td><%=per.getCorreoUsuario()%></td>
                <td><%=per.getUsuario()%></td>
                <td><%=per.getClaveUsuario()%></td>
                <td>
                    <a class="btn btn-warning" href="Controlador?accion=edit&codigoUsuario=<%= per.getCodigoUsuario()%>">Edit</a>
                    <a class="btn btn-danger" href="#" onclick="confirmarEliminacion(<%= per.getCodigoUsuario()%>)">Eliminar</a>
                    <label class="btn btn-primary">
                        Subir imagen
                        <input class="ocultar-Input" id="userId" accept="image/*" type="file">
                    </label>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<!-- Agrega los enlaces a los archivos JavaScript de Bootstrap y cualquier otro script necesario -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
</body>
</html>

<style>
    .ocultar-Input {
        display: none;
    }
</style>
