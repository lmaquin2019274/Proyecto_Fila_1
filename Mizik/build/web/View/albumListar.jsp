<%-- 
    Document   : albumListar
    Created on : 21-jul-2023, 16:52:37
    Author     : smaeda-2019256
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Album"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.AlbumDAO"%>
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
                <h1>.                 Unos cuantos álbumes</h1>
            </div>
        </header>

        <div class="container">
            <div class="row" style="margin-top: 120px;">
                <%
                    AlbumDAO dao = new AlbumDAO();
                    List<Album> listaAlbum = dao.listarAlbumes();
                    Iterator<Album> iterator = listaAlbum.iterator();
                    Album a = null;
                    int albumCount = 0;

                    while (iterator.hasNext()) {
                        a = iterator.next();
                %>
                <div class="col-md-4 artist-card">
                    <a href="Controlador?accion=album&id=<%= a.getCodigoAlbum()%>">
                        <img src="img/album/<%= a.getNombreAlbum() %>.jpg" alt="<%= a.getNombreAlbum()%>" width="165">
                    </a>
                    <h4><%= a.getNombreAlbum()%></h4>
                </div>
                <%
                    albumCount++;
                    // Cerrar una fila y abrir una nueva después de mostrar 3 artistas
                    if (albumCount % 3 == 0) {
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