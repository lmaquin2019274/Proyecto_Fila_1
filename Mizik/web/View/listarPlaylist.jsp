<%-- 
    Document   : listarPlaylist
    Created on : 20/07/2023, 11:23:45 PM
    Author     : sebas
--%>

<% int codigoUsuario = Integer.parseInt(request.getSession().getAttribute("codigoUsuario").toString()); %>
<%@page import="java.util.Iterator"%>
<%@page import="model.Playlist"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.PlaylistDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/biblioteca.ico" />
        <title>Biblioteca</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <style>
            .artist-card {
                width: 30%;
                display: inline-block;
                text-align: center;
            }

            .circular-image {
                border-radius: 45px;
                max-width: 100%;
                border: 3px solid black;
            }

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-decoration: none;
            }

            header{
                width: 100%;
                height: 80px;
                background: #f5f5f5;
                display: flex;
                align-items: center;
                position: fixed;
                top: 0;
                z-index: 200;
            }

            container{
                margin-top: 80px;
                padding: 20px;
            }

            .icon_menu{
                width: 100px;
                height: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                transform: translateX(10px);
                background: #f5f5f5;
            }

            .icon_menu i{
                font-size: 35px;
                cursor: pointer;
            }

            .icon_add{
                width: 100px;
                height: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                transform: translateX(10px);
                background: #f5f5f5;
                position: fixed; /* Ajusta la posición vertical */
                left: 90%;
            }

            .icon_add i{
                font-size: 35px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <header>
            <div class="icon_menu">
                <a href="Controlador?accion=principal">
                    <i class="fa-solid fa-circle-left" style="color: #454545;"></i>
                </a>
            </div>
            <div class="icon_add">
                <a href="Controlador?accion=addPlaylist">
                    <i class="fa-solid fa-plus" style="color: #454545;"></i>
                </a>
            </div>
            <div class="title_header">
                <h1>.                 Unas cuantas playlist</h1>
            </div>
        </header>

        <div class="container">
            <div class="row" style="margin-top: 120px;">
                <%
                    PlaylistDAO playlistdao = new PlaylistDAO();
                    List<Playlist> listaPlaylist = playlistdao.listarPlaylists(codigoUsuario);
                    Iterator<Playlist> iterator = listaPlaylist.iterator();
                    Playlist play = null;
                    int playlistCount = 0;

                    // Verifica si no hay playlists y muestra un mensaje
                    if (!iterator.hasNext()) {
                %>
                <div class="col-md-12 text-center">
                    <p>Aquí podrás guardar tus playlists :)</p>
                </div>
                <%
                } else {
                    while (iterator.hasNext()) {
                        play = iterator.next();
                %>
                <div class="col-md-4 artist-card">
                    <a href="Controlador?accion=playlist&id=<%= play.getCodigoPlaylist()%>">
                        <img src="img/playlists/<%= play.getImagen()%>" alt="<%= play.getNombrePlaylist()%>" width="165" class="circular-image">
                    </a>
                    <h4><%= play.getNombrePlaylist()%></h4>
                    <h6>
                        <a><%= play.getCantidadCanciones()%> canciones</a>
                        <a style="color: white">__</a>
                        <a href="#" onclick="confirmarEliminacion(<%= play.getCodigoPlaylist()%>)">
                            <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                        </a>
                        <a style="color: white">_</a>
                        <a href="#">
                            <i class="fa-solid fa-pen" style="color: #e6c822;"></i>
                        </a>
                    </h6>
                </div>
                <%
                    playlistCount++;
                    if (playlistCount % 3 == 0) {
                %>
            </div>
            <div class="row" style="margin-top: 20px;"> 
                <%
                        }
                    }
                %>
            </div>
            <%
                }
            %>
        </div>
        <script>
            function confirmarEliminacion(playlistId) {
                var confirmacion = confirm("¿Estás seguro de que deseas eliminar esta playlist?");
                if (confirmacion) {
                    window.location.href = "Controlador?accion=eliminarPlaylist&id=" + playlistId;
                } else {
                    // El usuario canceló la eliminación, no se hace nada.
                }
            }
        </script>
    </body>
</html>