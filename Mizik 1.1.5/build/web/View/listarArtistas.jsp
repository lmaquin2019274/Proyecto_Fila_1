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
        <title>Listar Artistas</title>
    </head>
    <body>
       
        <div>
             <h1>Artistas</h1>
             <a href="Controlador?accion=Opciones">🢀</a><br>
        <table border ="1">
            <thead>
            <tr>
                <th>Id</th>
                <th>Artistas</th>
                <th>Nacimiento</th>
                <th>País</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <%
                ArtistasDAO dao = new ArtistasDAO();  
                List <Artistas> listaArtistas = dao.listarArtistas();
                Iterator <Artistas> iterator = listaArtistas.iterator();
                Artistas art = null;
                while (iterator.hasNext()){
                    art = iterator.next();
                
            %>
            <tbody>
                <tr>
                    <td><%=art.getCodigoArtista()%></td>
                    <td><%= art.getNombreArtista()%></td>
                    <td><%= art.getFechaNacimiento()%></td>
                    <td><%=art.getPaisNacimiento()%></td>
                    <td>
                        <a href="">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
            </div>
    </body>
</html>

