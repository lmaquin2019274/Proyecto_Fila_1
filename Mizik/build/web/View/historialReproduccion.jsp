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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="img/opciones.ico">
    <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
    <title>Opciones</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        /* Custom CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Historial de Reproducción</h1>
    <a href="Controlador?accion=principal" class="btn btn-primary mb-3">
        <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
    </a>
    <table class="table table-bordered">
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
            while (iterator.hasNext()){
                fav = iterator.next();

                UsuariosDAO userDAO = new UsuariosDAO();
                String obtenerNombreUser;
                Usuarios user = userDAO.buscarUsuario(fav.getCodigoUsuario());
                obtenerNombreUser = user.getUsuario();
                if(obtenerNombreUser == null){
                    obtenerNombreUser = "Desconocido";
                }

                CancionesDAO songDAO = new CancionesDAO();
                String obtenerNombreSong;
                Canciones song = songDAO.buscarCancion(fav.getCodigoCancion());
                obtenerNombreSong = song.getNombreCancion();
                if(obtenerNombreSong == null){
                    obtenerNombreSong = "Desconocido";
                }
        %>
        <tbody>
            <tr>
                <td style="text-align: center"><%= fav.getCodigoHistorialR()%></td>
                <td style="text-align: center"><%= new java.text.SimpleDateFormat("d · MMM · yyyy").format(fav.getFechaHR()) %></td>
                <td style="text-align: center"><%= fav.getHoraHR().format(java.time.format.DateTimeFormatter.ofPattern("h.mm a")) %></td>
                <td style="text-align: center"><%= fav.getOrigen()%></td>
                <td style="text-align: center"><%= obtenerNombreUser%></td>
                <td style="text-align: center"><%= obtenerNombreSong%></td>
                <td style="text-align: center">
                    <a href="Controlador?accion=eliminarReproduccion&id=<%= fav.getCodigoHistorialR()%>" class="btn btn-danger btn-sm">
                        <i class="fa-solid fa-trash" style="color: #9d1c28;"></i>
                    </a>
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>
    <!-- Bootstrap JS scripts (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Kq0pJl2BX6wC6Vo4JZj6f0WJp4Bf8Kb5HsRVnXsg8X3KF1Cii/bYjUWsf+OrCWp" crossorigin="anonymous"></script>
</body>
</html>