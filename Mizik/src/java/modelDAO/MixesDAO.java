package modelDAO;

import configuration.Conexion;
import interfaces.CRUDHistorialReproduccion;
import interfaces.CRUDMixes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.HistorialReproduccion;
import model.Mixes;
import model.MixeshasCanciones;

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
    public List<MixeshasCanciones> obtenerCancionesDeMix(int mixId) {
        ArrayList<MixeshasCanciones> listaCanciones = new ArrayList<>();
        String sql = "select * from MixeshasCanciones where codigoMix = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, mixId);
            rs = ps.executeQuery();
            while (rs.next()) {
                MixeshasCanciones mixhasCanciones = new MixeshasCanciones();
                mixhasCanciones.setCodigoMixeshasCanciones(rs.getInt("codigoMixeshasCanciones"));
                mixhasCanciones.setFechaMC(rs.getDate("fechaMC"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaMC").toLocalTime());
                mixhasCanciones.setNumeroUnico(rs.getInt("numeroUnico"));
                mixhasCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                mixhasCanciones.setCodigoMix(rs.getInt("codigoMix"));
                
                listaCanciones.add(mixhasCanciones);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCanciones;
    }
    
    @Override
    public List<Mixes> listarMixes() {
        ArrayList<Mixes> listarMixes = new ArrayList<>();
        String sql = "SELECT m.codigoMix, m.nombreMix, m.descripcionMix, COUNT(mc.codigoCancion) AS cantidadCanciones " +
            "FROM Mixes AS m " +
            "LEFT JOIN MixeshasCanciones AS mc ON m.codigoMix = mc.codigoMix " +
            "GROUP BY m.codigoMix";
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mix;
    }
}
