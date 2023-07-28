<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Guardar PlaylisthasCanciones</title>
</head>
<body>
    <h1>Guardar PlaylisthasCanciones</h1>
    
    <% 
    try {
        // Obtener los parámetros del formulario
        String fechaPC = request.getParameter("fechaPC");
        String horaPC = request.getParameter("horaPC");
        int numeroUnico = Integer.parseInt(request.getParameter("numeroUnico"));
        int codigoCancion = Integer.parseInt(request.getParameter("codigoCancion"));
        int codigoPlaylist = Integer.parseInt(request.getParameter("codigoPlaylist"));
        
        // Establecer la conexión JDBC con tu base de datos
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ Musical", "root", "admin");
        
        // Preparar la consulta SQL para insertar los datos
        String query = "INSERT INTO PlaylisthasCanciones (fechaPC, horaPC, numeroUnico, codigoCancion, codigoPlaylist) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        preparedStatement.setString(1, fechaPC);
        preparedStatement.setString(2, horaPC);
        preparedStatement.setInt(3, numeroUnico);
        preparedStatement.setInt(4, codigoCancion);
        preparedStatement.setInt(5, codigoPlaylist);
        
        // Ejecutar la consulta y guardar los datos en la base de datos
        int rowsInserted = preparedStatement.executeUpdate();
        
        // Cerrar la conexión JDBC
        preparedStatement.close();
        conn.close();
        
        // Mostrar un mensaje de éxito
        out.println("<p>Datos agregados correctamente a PlaylisthasCanciones.</p>");
    } catch (Exception e) {
        out.println("<p>Error al guardar los datos: " + e.getMessage() + "</p>");
    }
    %>
    
    <p><a href="agregarPlaylisthasCanciones.jsp">Volver al formulario</a></p>
</body>
</html>
