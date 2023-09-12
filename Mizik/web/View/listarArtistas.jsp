<%-- 
    Document   : listarArtistas
    Created on : 21/07/2023, 12:44:59 PM
    Author     : Familia Iboy Leiva
--%>

<%@page import="modelDAO.ArtistasDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Artistas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/principal.ico" />
        <title>Principal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <style>
            .artist-card {
                width: 30%;
                display: inline-block;
                text-align: center;
            }

            .circular-image {
                border-radius: 50%;
                max-width: 100%;
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
        </style>
    </head>
    <body>

        <header>
            <div class="icon_menu">
                <a href="Controlador?accion=principal">
                    <i class="fa-solid fa-circle-left" style="color: #454545;"></i>
                </a>
            </div>
            <div class="title_header">
                <h1>.                 Unos cuantos artistas</h1>
            </div>
        </header>

        <div class="container">
            <div class="row" style="margin-top: 120px;">
                <%
                    ArtistasDAO dao = new ArtistasDAO();
                    List<Artistas> listaArtistas = dao.listarArtistas();
                    Iterator<Artistas> iterator = listaArtistas.iterator();
                    Artistas art = null;
                    int artistCount = 0;

                    while (iterator.hasNext()) {
                        art = iterator.next();
                %>
                <div class="col-md-4 artist-card">
                    <a href="Controlador?accion=artista&id=<%= art.getCodigoArtista()%>">
                        <img src="img/artista/<%= art.getNombreArtista()%>dos.jpg" alt="<%= art.getNombreArtista()%>" width="165" class="circular-image">
                    </a>
                    <h4><%= art.getNombreArtista()%></h4>
                </div>
                <%
                    artistCount++;
                    // Cerrar una fila y abrir una nueva después de mostrar 3 artistas
                    if (artistCount % 3 == 0) {
                %>
            </div>
            <div class="row" style="margin-top: 20px;"> <!-- Agrega margen superior para separar las filas -->
                <%
                        }
                    }
                %>
            </div>
        </div>

    </body>
</html>