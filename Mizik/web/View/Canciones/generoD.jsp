<%-- 
    Document   : generoD
    Created on : 9/09/2023, 08:21:06 PM
    Author     : lucciano
--%>

<%@page import="model.Artistas"%>
<%@page import="modelDAO.ArtistasDAO"%>
<%@page import="model.Generos"%>
<%@page import="java.util.List"%>
<%@page import="model.Canciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/biblioteca.ico" />
        <title>Géneros</title>
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
                    <img src="img/genero/<%= ((Generos) request.getAttribute("genero")).getNombreGenero() %>.jpg" alt="200" width="330" style="margin-top: 20px"/><br>

                    <h3 class="mt-3 text-muted" style="font-size: 20px">
                        <%= ((Generos) request.getAttribute("genero")).getDescripcion() %>
                    </h3>
                    
                    <a href="Controlador?accion=buscar">
                        <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
                    </a>
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
                            <th>Artista</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int x = 0;
                        List<Canciones> listaCanciones = (List<Canciones>) request.getAttribute("canciones");
                        for (Canciones cancion : listaCanciones) {
                            x = x + 1;
                            ArtistasDAO artistaDAO = new ArtistasDAO();
                            String obtenerNombreArtista;
                            Artistas artista = artistaDAO.buscarArtistas(cancion.getCodigoArtista());
                            obtenerNombreArtista = artista.getNombreArtista();
                            if(obtenerNombreArtista == null){
                                obtenerNombreArtista = "Desconocido";
                            }
                        %>
                        <tr>
                            <td><%= x %></td>
                            <td><%= cancion.getNombreCancion() %></td>
                            <td><%= cancion.getDuracion() %></td>
                            <td><%= obtenerNombreArtista %></td>
                            <td>
                                <a href="Controlador?accion=cancion&id=<%= cancion.getCodigoCancion() %>">
                                    <i class="fa-solid fa-circle-play" style="color: #10b4fa;"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </body>
</html>
