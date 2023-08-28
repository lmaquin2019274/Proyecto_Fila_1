<%-- 
    Document   : historialBusqueda
    Created on : 24/07/2023, 09:08:44 AM
    Author     : luciano
--%>

<% int codigoUsuario = Integer.parseInt(request.getSession().getAttribute("codigoUsuario").toString()); %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.HistorialBusqueda"%>
<%@page import="modelDAO.HistorialBusquedaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/opciones.ico" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
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
        <title>Opciones</title>
    </head>
    <body>
        <h1>Historial de Búsquedas</h1>
        <a href="Controlador?accion=principal" class="btn mb-3">
            <i class="fa-solid fa-circle-left fa-xl" style="color: #6c6c6c;"></i>
        </a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th style="text-align: center">Id</th>
                    <th style="text-align: center">Fecha</th>
                    <th style="text-align: center">Hora</th>
                    <th style="text-align: center">Palabra</th>
                    <th style="text-align: center">Usuario</th>
                    <th style="text-align: center">Acciones</th>
                </tr>
            </thead>
            <%
                HistorialBusquedaDAO dao = new HistorialBusquedaDAO();
                List<HistorialBusqueda> listaHistorialBusqueda = dao.listarHistorialBusqueda(codigoUsuario);
                Iterator<HistorialBusqueda> iterator = listaHistorialBusqueda.iterator();
                HistorialBusqueda fav = null;
                while (iterator.hasNext()) {
                    fav = iterator.next();
            %>
            <tbody>
                <tr>
                    <td style="text-align: center"><%= fav.getCodigoHistorialB()%></td>
                    <td style="text-align: center"><%= new java.text.SimpleDateFormat("d · MMM · yyyy").format(fav.getFechaHB()) %></td>
                    <td style="text-align: center"><%= fav.getHoraHB().format(java.time.format.DateTimeFormatter.ofPattern("h.mm a")) %></td>
                    <td style="text-align: center"><%= fav.getPalabraBuscada()%></td>
                    <td style="text-align: center"><%= fav.getCodigoUsuario()%></td>
                    <td style="text-align: center">
                        <a href="Controlador?accion=eliminarBusqueda&id=<%= fav.getCodigoHistorialB()%>" class="btn btn-sm">
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