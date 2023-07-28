
package modelDAO;

import configuration.Conexion;
import interfaces.CRUDHistorialReproduccion;
import interfaces.CRUDMixes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.HistorialReproduccion;
import model.Mixes;

/**
 *
 * @author User
 */
public class MixesDAO implements CRUDMixes {
    
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Mixes mix = new Mixes();
    
   
    @Override
    public boolean eliminarMixes(int id) {
        String sql = "delete from Mixes where codigoMix" + id;
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
    public List<Mixes> listarMixes() {
        ArrayList<Mixes> listarMixes = new ArrayList<>();
        String sql = "select * from Mixes";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mixes mix = new Mixes();
                mix.setCodigoMix(rs.getInt("codigoMix"));
                mix.setNombreMix(rs.getString("nombreMix"));
                mix.setDescripcionMix(rs.getString("descripcionMix"));
                mix.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                mix.setCodigoGenero(rs.getInt("codigoGenero"));
                mix.setCantidadCanciones(rs.getInt("codigoCancion"));
                listarMixes.add(mix);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listarMixes;
    }

    @Override
    public Mixes buscarMixes(int id) {
       String sql = "select * from Mixes where codigoMix=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                mix.setCodigoMix(rs.getInt("codigoMix"));
                mix.setNombreMix(rs.getString("nombreMix"));
                mix.setDescripcionMix(rs.getString("descripcionMix"));
                mix.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                mix.setCodigoGenero(rs.getInt("codigoGenero"));
                mix.setCantidadCanciones(rs.getInt("codigoCancion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mix;
    }

    

    
   
    
    
}
