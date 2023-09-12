<%-- 
    Document   : MixeshasCanciones
    Created on : 20/07/2023, 02:31:17 PM
    Author     : Brandon2019417
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.PlaylisthasCanciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.PlaylisthasCancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,700;0,800;1,600&display=swap');


            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;

            }

            body{
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                background: linear-gradient(#b7328d, #ac18c0);
            }

            .container{
                border: solid 1px rgba(255, 255, 255, 0.2);
            }

            h1{
                color: #fff;
                padding: 20px 15px;
                font-weight: 700;
                text-transform: uppercase;
            }

            table{
                margin: 0 auto;
                color: #fff;
                font-size: 25px;
                table-layout: fixed;
                border-collapse: collapse;
            }

            thead{
                background: rgba(255, 255, 255, 0.4);
            }

            th{
                padding: 20px 15px;
                font-weight: 700;
                text-transform: uppercase;
            }

            td{
                padding: 15px;
                border-bottom: solid 1px rgba(255, 255, 255, 0.2);
            }

            tbody tr{
                cursor: pointer;
            }

            tbody tr:hover{
                background: rgba(243, 103, 199, 0.4);
            }

            a{
                outline: none;
            }

        </style>
    </head>
    <body>

        <div>
            <h1>Tus Playlist Canciones</h1>
            <a href="Controlador?accion=biblioteca">🢀</a><br>

            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Numero Unico</th>
                            <th>Canción</th>
                            <th>Playlist</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <%
                        PlaylisthasCancionesDAO dao = new PlaylisthasCancionesDAO();
                        List<PlaylisthasCanciones> listaPlaylisthasCancionesDAO = dao.listarPlaylisthasCanciones();
                        Iterator<PlaylisthasCanciones> iterator = listaPlaylisthasCancionesDAO.iterator();
                        PlaylisthasCanciones Mix = null;
                        while (iterator.hasNext()) {
                            Mix = iterator.next();

                    %>
                    <tbody>
                        <tr>
                            <td><%= Mix.getCodigoPlaylisthasCanciones()%></td>
                            <td><%= Mix.getFechaPC()%></td>
                            <td><%= Mix.getHoraPC()%></td>
                            <td><%= Mix.getNumeroUnico()%></td>
                            <td><%= Mix.getCodigoCancion()%></td>
                            <td><%= Mix.getCodigoPlaylist()%></td>
                            <td>

                                <input type="submit" name="accion" value="Edit" class="btn btn-info">
                                <input type="submit" name="accion" value="Eliminar" class="btn btn-success">
                            </td>  
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>

