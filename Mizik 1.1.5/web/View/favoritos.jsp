<%-- 
    Document   : favoritos
    Created on : 20/07/2023, 02:31:17 PM
    Author     : luciano
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Favoritos"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.FavoritosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mizik®</title>
    </head>
    <body>
        
        <div>
        <h1>Favoritos <3</h1>
        <a href="Controlador?accion=principal">🢀</a><br>
        <a href="Controlador?accion=addFavorito"> Agregar Nueva Canción</a>
        <table border="4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>cantidad de canciones</th>
                    <th>Duracion</th>
                    <th>Artistas</th>
                    <th>Usuario</th>
                    <th>Canción</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%
                FavoritosDAO dao = new FavoritosDAO();
                List<Favoritos> listaFavoritos = dao.listarFavoritos();
                Iterator<Favoritos> iterator = listaFavoritos.iterator();
                Favoritos fav = null;
                while (iterator.hasNext()){
                    fav = iterator.next();

            %>
            <tbody>
                <tr>
                    <td><%= fav.getCodigoFav()%></td>
                    <td><%= fav.getCantidadCanciones()%></td>
                    <td><%= fav.getDuracionTotal()%></td>
                    <td><%= fav.getCantidadArtistas()%></td>
                    <td><%= fav.getCodigoUsario()%></td>
                    <td><%= fav.getCodigoCancion()%></td>
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
