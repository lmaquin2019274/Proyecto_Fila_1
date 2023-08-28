<%-- 
    Document   : favoritos
    Created on : 20/07/2023, 02:31:17 PM
    Author     : luciano
--%>
<%@page import="model.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="model.Canciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/biblioteca.ico" />
        <title>Biblioteca</title>
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
                    <img src="img/fav.jpg" alt="200" width="200" style="margin-top: 20px"/><br>

                    <h3 class="mt-3 text-muted" style="font-size: 20px">
                        Favoritos <3
                    </h3>
                    
                    <a href="Controlador?accion=principal">
                        <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
                    </a>
                </div>
            </div>
            
            <div class="row justify-content-center mt-4">
            <div class="col-md-8">
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nombre</th>
                            <th>Duración</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        List<Canciones> listaCanciones = (List<Canciones>) request.getAttribute("canciones");
                        if (listaCanciones != null && !listaCanciones.isEmpty()) {
                            int x = 0;
                            for (Canciones cancion : listaCanciones) {
                                x = x + 1;
                        %>
                            <tr>
                                <td><%= x %></td>
                                <td><%= cancion.getNombreCancion() %></td>
                                <td><%= cancion.getDuracion() %></td>
                                <td>
                                    <a href="Controlador?accion=cancion&id=<%= cancion.getCodigoCancion() %>">
                                        <i class="fa-solid fa-circle-play" style="color: #10b4fa;"></i>
                                    </a>
                                        <a style="color: white; cursor: default">__</a>
                                    <a href="Controlador?accion=eliminarFav&id=<%= cancion.getCodigoCancion() %>">
                                        <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                                    </a>
                                </td>
                            </tr>
                        <%
                            }
                        } else {
                        %>
                            <tr>
                                <td colspan="4">No hay favoritos disponibles.</td>
                            </tr>
                        <% 
                        }
                        %>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </body>
</html>
