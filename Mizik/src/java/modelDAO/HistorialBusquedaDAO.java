//@author Amax2019189

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDHistorialBusqueda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.HistorialBusqueda;

public class HistorialBusquedaDAO implements CRUDHistorialBusqueda{
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HistorialBusqueda nHistorialBusqueda = new HistorialBusqueda();
    
     @Override
    public List<HistorialBusqueda> listarHistorialBusqueda(int codigoUsuario) {
        ArrayList<HistorialBusqueda> listaHistorialBusqueda = new ArrayList<>();
        String sql = ("select * from HistorialBusqueda where codigoUsuario = ?");
         try {
             con = connect.getConnection();
             ps = con.prepareStatement(sql);
             ps.setInt(1, codigoUsuario);
             rs = ps.executeQuery();
             while (rs.next()){
                HistorialBusqueda nuevocodigoHistorialB = new HistorialBusqueda();
                nuevocodigoHistorialB.setCodigoHistorialB(rs.getInt("codigoHistorialB"));
                nuevocodigoHistorialB.setFechaHB(rs.getDate("fechaHB"));
                nuevocodigoHistorialB.setHoraHB(LocalDateTime.MAX);
                nuevocodigoHistorialB.setPalabraBuscada(rs.getString("palabraBuscada"));
                nuevocodigoHistorialB.setCodigoUsuario(rs.getInt("codigoUsuario"));
                listaHistorialBusqueda.add(nuevocodigoHistorialB);
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        return listaHistorialBusqueda;
    }
    
    @Override
    public HistorialBusqueda buscarHistorialBusqueda(int id) {
        String sql = "select * from HistorialBusqueda where codigoHistorialB=" +id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                nHistorialBusqueda.setCodigoHistorialB(rs.getInt("codigoHistorialB"));
                nHistorialBusqueda.setFechaHB(rs.getDate("fechaHB"));
                nHistorialBusqueda.setHoraHB(LocalDateTime.MAX);
                nHistorialBusqueda.setPalabraBuscada(rs.getString("palabraBuscada"));
                nHistorialBusqueda.setCodigoUsuario(rs.getInt("codigoUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return nHistorialBusqueda;
    }

    @Override
    public boolean agregarHistorialBusqueda(HistorialBusqueda historialBusqueda) {
        String sql = "insert into HistorialBusqueda(fechaHR, fechaHR, horaHR, setPalabraBuscada, setCodigoUsuario) values('"+nHistorialBusqueda.getFechaHB()+"', '"+nHistorialBusqueda.getHoraHB()+"', '"+nHistorialBusqueda.getPalabraBuscada()+"', '"+nHistorialBusqueda.getCodigoUsuario()+"')";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }

    @Override
    public boolean eliminarHistorialBusqueda(int id) {
        String sql = "delete from HistorialBusqueda where codigoHistorialB = ?";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
