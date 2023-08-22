//@author plopez2019280

package modelDAO;


import configuration.Conexion;
import interfaces.CRUDCanciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Canciones;


    public class CancionesDAO implements CRUDCanciones {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Canciones nCanciones = new Canciones();
    
     @Override
    public List listarCanciones() {
        ArrayList<Canciones> listaCanciones = new ArrayList<Canciones>();
        String sql = "select * from Canciones";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Canciones nuevaCancion = new Canciones();
                nuevaCancion.setCodigoCancion(rs.getInt("codigoCancion"));
                nuevaCancion.setNombreCancion(rs.getString("nombreCancion"));
                nuevaCancion.setNombreRaw(rs.getString("direccionRaw"));
                nuevaCancion.setDuracion(rs.getString("duracion"));
                nuevaCancion.setCodigoGenero(rs.getInt("codigoGenero"));
                nuevaCancion.setCodigoArtista(rs.getInt("codigoArtista"));
                nuevaCancion.setCodigoAlbum(rs.getInt("codigoAlbum"));
                listaCanciones.add(nuevaCancion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCanciones;
    }

    @Override
    public Canciones buscarCancion(int id) {
        String sql = "select * from Canciones where codigoCancion=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Canciones nCanciones = new Canciones();
                nCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                nCanciones.setNombreCancion(rs.getString("nombreCancion"));
                nCanciones.setNombreRaw(rs.getString("direccionRaw"));
                nCanciones.setDuracion(rs.getString("duracion"));
                nCanciones.setCodigoGenero(rs.getInt("codigoGenero"));
                nCanciones.setCodigoArtista(rs.getInt("codigoArtista"));
                nCanciones.setCodigoAlbum(rs.getInt("codigoAlbum"));
                return nCanciones;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean eliminarCancion(int id) {
        String sql = "delete from Canciones where codigoCancion" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
