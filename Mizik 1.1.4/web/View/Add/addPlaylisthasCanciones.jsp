<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar PlaylisthasCanciones</title>
</head>
<body>
    <h1>Agregar PlaylisthasCanciones</h1>
    
    <form method="post" action="guardarPlaylisthasCanciones.jsp">
        Fecha: <input type="date" name="fechaPC" required><br>
        Hora: <input type="datetime-local" name="horaPC" required><br>
        Número único: <input type="number" name="numeroUnico" required><br>
        Código de canción: <input type="number" name="codigoCancion" required><br>
        Código de playlist: <input type="number" name="codigoPlaylist" required><br>
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
