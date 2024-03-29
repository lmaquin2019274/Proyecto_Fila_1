//@author dbarton2019164

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDGeneros;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Canciones;
import model.Generos;

public class GeneroDAO implements CRUDGeneros {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Generos nGenero = new Generos();


    @Override
    public List<Generos> listarGeneros() {
        ArrayList<Generos> listaGenero = new ArrayList<Generos>();
        String sql = "select * from Generos";
        try {
            con = conect.getConnection();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Generos nuevoGenero = new Generos();
                nuevoGenero.setCodigoGenero(rs.getInt("codigoGenero"));
                nuevoGenero.setNombreGenero(rs.getString("nombreGenero"));
                nuevoGenero.setOrigen(rs.getString("origen"));
                nuevoGenero.setDescripcion(rs.getString("descripcion"));
                listaGenero.add(nuevoGenero);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaGenero;
    }

    @Override
    public Generos buscarGenero(int id) {
        String sql = "select * from Generos where codigoGenero =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nGenero.setCodigoGenero(rs.getInt("codigoGenero"));
                nGenero.setNombreGenero(rs.getString("nombreGenero"));
                nGenero.setOrigen(rs.getString("origen"));
                nGenero.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nGenero;
    }

    public List<Generos> buscarGeneroPorNombre(String nombre) {
        String sql = "select * from Generos where nombreGenero LIKE ?";
        List<Generos> generosEncontrados = new ArrayList<>();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                nGenero.setCodigoGenero(rs.getInt("codigoGenero"));
                nGenero.setNombreGenero(rs.getString("nombreGenero"));
                nGenero.setOrigen(rs.getString("origen"));
                nGenero.setDescripcion(rs.getString("descripcion"));
                generosEncontrados.add(nGenero);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generosEncontrados;
    }
    
    @Override
    public Generos buscarGeneros(int id) {
        String sql = "select * from Generos where codigoGenero =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nGenero.setCodigoGenero(rs.getInt("codigoGenero"));
                nGenero.setNombreGenero(rs.getString("nombreGenero"));
                nGenero.setOrigen(rs.getString("origen"));
                nGenero.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        // Aquí cierras los recursos en el bloque finally
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        return nGenero;
    }
    
    @Override
    public boolean eliminarGenero(int id) {
        String sql = "delete from Generos where codigoPersona =" + id;
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
    public List<Canciones> listarCanciones(int id) {
            ArrayList<Canciones> listaCanciones = new ArrayList<>();
        String sql = "select * from Canciones where codigoGenero = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
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
}
