<%-- 
    Document   : playlist
    Created on : 24/07/2023, 10:36:10 AM
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
    <title>Playlist</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
</head>
<body class="text-center">
    <div class="container">
        <h1><%= ((Playlist) request.getAttribute("playlist")).getNombrePlaylist() %></h1>
        
        <div class="row justify-content-center">
            <div class="col-md-6">
                <img src="img/playlists/<%= ((Playlist) request.getAttribute("playlist")).getImagen() %>" alt="200" width="200"/><br>
                
                <h3 class="mt-3 text-muted" style="font-size: 20px"><%= ((Playlist) request.getAttribute("playlist")).getDescripcionPlaylist()%></h3>
                <a href="Controlador?accion=playlists">
                    <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
                </a><br>
                <a href="Controlador?accion=addCancionesPlaylist&playlistId=<%= ((Playlist) request.getAttribute("playlist")).getCodigoPlaylist()%>" class="btn btn-primary mt-3">Agregar Canción</a>
            </div>
        </div>
        
        <div class="row justify-content-center mt-4">
            <div class="col-md-8">
                <table class="table">
                    <thead>
                        <tr>
                            <th>n.º</th>
                            <th>Nombre</th>
                            <th>Duración</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int x = 0;  
                        List<Canciones> listaCanciones = (List<Canciones>) request.getAttribute("canciones");
                        if (listaCanciones != null && !listaCanciones.isEmpty()) {
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
                                        <a href="#" onclick="confirmarEliminacion(<%= cancion.getCodigoCancion() %>, <%= ((Playlist) request.getAttribute("playlist")).getCodigoPlaylist() %>)">
                                            <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                                        </a>
                                    </td>
                                </tr>
                                <% 
                            }
                        } else {
                            %>
                            <tr>
                                <td colspan="4">No hay canciones disponibles.</td>
                            </tr>
                            <% 
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function confirmarEliminacion(cancionId, playlistId) {
            var confirmacion = confirm("¿Estás seguro de que deseas eliminar esta canción?");
            if (confirmacion) {
                window.location.href = "Controlador?accion=eliminarCancionPlaylist&cancionId=" + cancionId + "&playlistId=" + playlistId;
            } else {
                // El usuario canceló la eliminación, no se hace nada.
            }
        }
    </script>
</body>
</html>