<%-- 
    Document   : historialReproduccion
    Created on : 20/07/2023, 05:52:34 PM
    Author     : Ivan
--%>

<%@page import="model.Canciones"%>
<%@page import="modelDAO.CancionesDAO"%>
<%@page import="model.Usuarios"%>
<%@page import="modelDAO.UsuariosDAO"%>
<% int codigoUsuario = Integer.parseInt(request.getSession().getAttribute("codigoUsuario").toString()); %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.HistorialReproduccion"%>
<%@page import="modelDAO.HistorialReproduccionDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/opciones.ico" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <title>Opciones</title>
    </head>

    <body class="text-center">
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <img src="img/music.jpg" alt="200" width="200" style="margin-top: 20px"/><br>

                    <h3 class="mt-3 text-muted" style="font-size: 20px">
                        Historial de reproducciones
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
                                <th style="text-align: center">Id</th>
                                <th style="text-align: center">Fecha</th>
                                <th style="text-align: center">Hora</th>
                                <th style="text-align: center">Origen</th>
                                <th style="text-align: center">Usuario</th>
                                <th style="text-align: center">Canción</th>
                                <th style="text-align: center">Acciones</th>
                            </tr>
                        </thead>
                        <%
                            HistorialReproduccionDAO dao = new HistorialReproduccionDAO();
                            List<HistorialReproduccion> listaHistorialReproduccion = dao.listarHistorialReproduccion(codigoUsuario);
                            Iterator<HistorialReproduccion> iterator = listaHistorialReproduccion.iterator();
                            HistorialReproduccion fav = null;
                            while (iterator.hasNext()) {
                                fav = iterator.next();

                                UsuariosDAO userDAO = new UsuariosDAO();
                                String obtenerNombreUser;
                                Usuarios user = userDAO.buscarUsuario(fav.getCodigoUsuario());
                                obtenerNombreUser = user.getUsuario();
                                if (obtenerNombreUser == null) {
                                    obtenerNombreUser = "Desconocido";
                                }

                                CancionesDAO songDAO = new CancionesDAO();
                                String obtenerNombreSong;
                                Canciones song = songDAO.buscarCancion(fav.getCodigoCancion());
                                obtenerNombreSong = song.getNombreCancion();
                                if (obtenerNombreSong == null) {
                                    obtenerNombreSong = "Desconocido";
                                }
                        %>
                        <tbody>
                            <tr>
                                <td style="text-align: center"><%= fav.getCodigoHistorialR()%></td>
                                <td style="text-align: center"><%= new java.text.SimpleDateFormat("d · MMM · yyyy").format(fav.getFechaHR())%></td>
                                <td style="text-align: center"><%= fav.getHoraHR().format(java.time.format.DateTimeFormatter.ofPattern("h.mm a"))%></td>
                                <td style="text-align: center"><%= fav.getOrigen()%></td>
                                <td style="text-align: center"><%= obtenerNombreUser%></td>
                                <td style="text-align: center"><%= obtenerNombreSong%></td>
                                <td style="text-align: center">
                                    <a href="Controlador?accion=eliminarReproduccion&id=<%= fav.getCodigoHistorialR()%>">
                                        <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>