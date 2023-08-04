//@author jlopez2022006

package modelDAO;

import configuration.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import interfaces.CRUDHistorialReproduccion;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.HistorialReproduccion;
import java.time.LocalDateTime;


public class HistorialReproduccionDAO implements CRUDHistorialReproduccion{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HistorialReproduccion nHistorialR = new HistorialReproduccion();

    @Override
    public boolean agregarHistorialReproduccion(HistorialReproduccion historialReproduccion) {
        String sql = "insert into HistorialReproduccion(fechaHR, horaHR, origen, codigoUsario, codigoCancion) values('"+nHistorialR.getFechaHR()+"', '"+nHistorialR.getHoraHR()+"', '"+nHistorialR.getOrigen()+"', '"+nHistorialR.getCodigoUsuario()+"')";
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminarHistorialReproduccion(int id) {
        String sql = "delete from HistorialReproduccion where codigoHistorialR" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<HistorialReproduccion> listarHistorialReproduccion() {
        ArrayList<HistorialReproduccion> listaHistorialReproduccion = new ArrayList<>();
        String sql = "select * from HistorialReproduccion";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistorialReproduccion nHistorialR = new HistorialReproduccion();
                nHistorialR.setCodigoHistorialR(rs.getInt("codigoHistorialR"));
                nHistorialR.setFechaHR(rs.getDate("fechaHR"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaHR").toLocalTime());
                nHistorialR.setOrigen(rs.getString("origen"));
                nHistorialR.setCodigoUsuario(rs.getInt("codigoUsuario")); 
                nHistorialR.setCodigoCancion(rs.getInt("codigoCancion"));
                listaHistorialReproduccion.add(nHistorialR);
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


