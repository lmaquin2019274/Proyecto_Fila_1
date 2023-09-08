<%-- 
    Document   : mixes
    Created on : 23/07/2023, 07:28:35 PM
    Author     : luciano
--%>

<%@page import="model.Generos"%>
<%@page import="modelDAO.GeneroDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Mixes"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.MixesDAO"%>
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
                border-radius: 45px;
                max-width: 100%;
                width: 200px;
                height: 150px;
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
        <div>

            <header>
                <div class="icon_menu">
                    <a href="Controlador?accion=principal">
                        <i class="fa-solid fa-circle-left" style="color: #454545;"></i>
                    </a>
                </div>
                <div class="title_header">
                    <h1>.                 Unas cuantos mix</h1>
                </div>
            </header>

            <div class="container">
                <div class="row" style="margin-top: 120px;">
                    <%
                        MixesDAO dao = new MixesDAO();
                        List<Mixes> listaGenero = dao.listarMixes();
                        Iterator<Mixes> iterator = listaGenero.iterator();
                        Mixes g = null;
                        int mixCount = 0;

                        // Verifica si no hay playlists y muestra un mensaje
                        if (!iterator.hasNext()) {
                    %>
                    <div class="col-md-12 text-center">
                        <p>Aquí podrás guardar tus mix :)</p>
                    </div>
                    <%
                    } else {
                        while (iterator.hasNext()) {
                            g = iterator.next();
                    %>
                    <div class="col-md-4 artist-card">
                        <a href="Controlador?accion=mix&id=<%= g.getCodigoMix()%>">
                            <img src="img/mix/<%= g.getCodigoMix()%>.jpg" alt="<%= g.getNombreMix()%>" width="165" class="circular-image">
                        </a>
                        <h4><%= g.getNombreMix()%></h4>
                        <h6>
                            <a><%= g.getCantidadCanciones()%> canciones</a>
                        </h6>
                    </div>
                    <%
                        mixCount++;
                        if (mixCount % 3 == 0) {
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
        </div>
    </body>
</html>