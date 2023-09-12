//@author jlopez2022006

package modelDAO;

import configuration.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import interfaces.CRUDHistorialReproduccion;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.HistorialReproduccion;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;


public class HistorialReproduccionDAO implements CRUDHistorialReproduccion{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HistorialReproduccion nHistorialR = new HistorialReproduccion();

    @Override
    public boolean agregarHistorialReproduccion(int userId, int songId) {
        String sql = "INSERT INTO HistorialReproduccion(fechaHR, horaHR, origen, codigoUsuario, codigoCancion) VALUES (now(), now(), 'mizik', ?, ?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, songId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminarHistorialReproduccion(int id) {
        String sql = "delete from HistorialReproduccion where codigoHistorialR = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<HistorialReproduccion> listarHistorialReproduccion(int codigoUsuario) {
        ArrayList<HistorialReproduccion> listaHistorialReproduccion = new ArrayList<>();
        String sql = ("select * from HistorialReproduccion where codigoUsuario = ?");
         try {
             con = conect.getConnection();
             ps = con.prepareStatement(sql);
             ps.setInt(1, codigoUsuario);
             rs = ps.executeQuery();
             while (rs.next()){
                HistorialReproduccion hr = new HistorialReproduccion();
                hr.setCodigoHistorialR(rs.getInt("codigoHistorialR"));
                hr.setFechaHR(rs.getDate("fechaHR"));
                // Obtener la fecha y hora completa desde la base de datos
                Timestamp fechaHoraBD = rs.getTimestamp("horaHR");

                // Convertir la fecha y hora de la base de datos a LocalDateTime
                LocalDateTime fechaHora = fechaHoraBD.toLocalDateTime();

                hr.setHoraHR(fechaHora);
                hr.setOrigen(rs.getString("Origen"));
                hr.setCodigoUsuario(rs.getInt("codigoUsuario"));
                hr.setCodigoCancion(rs.getInt("codigoCancion"));
                listaHistorialReproduccion.add(hr);
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        return listaHistorialReproduccion;
    }

    @Override
    public HistorialReproduccion buscarHistorialReproduccion(int id) {
String sql = "select * from HistorialReproduccion where codigoHistorialReproduccion=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nHistorialR.setCodigoHistorialR(rs.getInt("codigoHistorialR"));
                nHistorialR.setFechaHR(rs.getDate("fechaHR"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaHR").toLocalTime());
                nHistorialR.setOrigen(rs.getString("origen"));
                nHistorialR.setCodigoUsuario(rs.getInt("codigoUsuario"));
                nHistorialR.setCodigoCancion(rs.getInt("codigoCancion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nHistorialR;
    }
    
   
    
    
    
}


