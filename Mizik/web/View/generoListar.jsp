<%-- 
    Document   : generoListar
    Created on : 16-jul-2023, 19:09:31
    Author     : user
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Generos"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.GeneroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/buscar.ico" />
        <title>Buscar</title>
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
                <h1>.                 Unos cuantos géneros</h1>
            </div>
        </header>

        <div class="container">
            <div class="row" style="margin-top: 120px;">
                <%
                    GeneroDAO dao = new GeneroDAO();
                    List<Generos> listaGenero = dao.listarGeneros();
                    Iterator<Generos> iterator = listaGenero.iterator();
                    Generos g = null;
                    int generCount = 0;

                    while (iterator.hasNext()) {
                        g = iterator.next();
                %>
                <div class="col-md-4 artist-card">
                    <a href="Controlador?accion=generoCancion&id=<%= g.getCodigoGenero()%>">
                        <img src="img/genero/<%= g.getNombreGenero() %>.jpg" alt="<%= g.getNombreGenero()%>" width="165">
                    </a>
                    <h4><%= g.getNombreGenero()%></h4>
                </div>
                <%
                    generCount++;
                    // Cerrar una fila y abrir una nueva después de mostrar 3 artistas
                    if (generCount % 3 == 0) {
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