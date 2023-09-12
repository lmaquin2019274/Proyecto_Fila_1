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
                    <img src="img/user.jpg" alt="200" width="200" style="margin-top: 20px"/><br>

                    <h3 class="mt-3 text-muted" style="font-size: 20px">
                        Usuarios
                    </h3>

                    <a href="Controlador?accion=principal">
                        <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
                    </a>
                </div>
            </div>

            <a class="btn btn-primary mt-3" href="Controlador?accion=addUsuario">Agregar usuario</a>

            <div class="row justify-content-center mt-4">
                <div class="col-md-8">
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
                                while (iterator.hasNext()) {
                                    per = iterator.next();
                            %>
                            <tr>
                                <td><%=per.getCodigoUsuario()%></td>
                                <td><%=per.getNombreCompleto()%></td>
                                <td><%=per.getCorreoUsuario()%></td>
                                <td><%=per.getUsuario()%></td>
                                <td>
                                    <input type="password" id="password<%= per.getCodigoUsuario()%>" value="<%=per.getClaveUsuario()%>" disabled>
                                    <button onclick="togglePassword('password<%= per.getCodigoUsuario()%>')">
                                        <i class="fa-solid fa-eye" style="color: #373737;"></i>
                                    </button>
                                </td>
                                <td>
                                        <a style="color: white">_</a>
                                    <a href="#" onclick="confirmarEliminacion(<%= per.getCodigoUsuario()%>)">
                                        <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                                    </a>
                                        <a style="color: white">_</a>
                                        <label style="cursor: pointer">
                                        <i class="fa-solid fa-image" style="color: #698ac7;"></i>
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
            </div>
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

                                function togglePassword(inputId) {
                                    var passwordInput = document.getElementById(inputId);
                                    if (passwordInput.type === "password") {
                                        passwordInput.type = "text";
                                    } else {
                                        passwordInput.type = "password";
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
