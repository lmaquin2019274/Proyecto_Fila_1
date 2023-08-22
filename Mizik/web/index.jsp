 <%-- 
    Document   : index
    Created on : 19/07/2023, 11:44:18 AM
    Author     : lmaquin2019274
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
        <title>Bienvenidos</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10">
                <div class="card-body">
                    <form class="form-sign" action="Validar" method="Post">
                        <div class="form-group text-center">
                            <h3>Login</h3>

                            <%-- Agrega este código para mostrar el mensaje de error si existe --%>
                            <c:if test="${not empty error}">
                                <p style="color: red">${error}</p>
                                <%-- Limpia el mensaje de error de la sesión después de mostrarlo --%>
                                <% session.removeAttribute("error");%>
                            </c:if>

                            <img src="img/logo.png" alt="70" width="130"/><br>
                            <label>Mizik®</label>
                        </div>
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" name="txtUser" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" name="txtPass" class="form-control">
                        </div>
                        <input type="hidden" name="menu" value="Principal">
                        <input type="submit" name="accion" value="Login" class="btn btn-primary btn-block"><br>
                        <div class="text-center">
                            <a href="Controlador?accion=addUsuarioD">Sigup</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
