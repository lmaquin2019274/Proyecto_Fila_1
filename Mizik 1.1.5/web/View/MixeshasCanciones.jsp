<%-- 
    Document   : MixeshasCanciones
    Created on : 20/07/2023, 02:31:17 PM
    Author     : Diego2019417
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.MixeshasCanciones"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.MixeshasCancionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
    </head>
    <body>
        
        <div>
        <h1>Tus Mixes Canciones</h1>
        <a href="Controlador?accion=principal">🢀</a><br>
        <a href="Controlador?accion=addMixeshasCanciones"> Agregar Nuevos MixesCanciones</a>
        <table border="4">
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
            MixeshasCancionesDAO dao = new MixeshasCancionesDAO();
                List<MixeshasCanciones> listaMixeshasCancionesDAO = dao.listarMixeshasCanciones();
                Iterator<MixeshasCanciones> iterator = listaMixeshasCancionesDAO.iterator();
                MixeshasCanciones Mix = null;
                while (iterator.hasNext()){
                    Mix = iterator.next();

            %>
            <tbody>
                <tr>
                    <td><%= Mix.getCodigoMixeshasCanciones()%></td>
                    <td><%= Mix.getFechaMC()%></td>
                    <td><%= Mix.getHoraMC()%></td>
                    <td><%= Mix.getNumeroUnico()%></td>
                    <td><%= Mix.getCodigoCancion()%></td>
                    <td><%= Mix.getCodigoMix()%></td>
                    <td>
                        <a href="">edit</a>
                        <a href="">Eliminar</a>
                    </td>  
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>
    </body>
</html>
