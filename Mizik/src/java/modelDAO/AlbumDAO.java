//@author smaeda2019256
package modelDAO;

import configuration.Conexion;
import interfaces.CRUDAlbum;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Album;
import model.Canciones;

public class AlbumDAO implements CRUDAlbum {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Album nuevoAlbum = new Album();

    @Override
    public List<Album> listarAlbumes() {
        ArrayList<Album> listaAlbum = new ArrayList<Album>();
        String sql = "select * from Album";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Album nuevoAlbum = new Album();
                nuevoAlbum.setCodigoAlbum(rs.getInt("codigoAlbum"));
                nuevoAlbum.setNombreAlbum(rs.getString("nombreAlbum"));
                nuevoAlbum.setGeneroComun(rs.getString("generoComun"));
                nuevoAlbum.setFechaLanzamiento(rs.getDate("fechaLanzamiento"));
                nuevoAlbum.setCodigoArtista(rs.getInt("codigoArtista"));
                listaAlbum.add(nuevoAlbum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaAlbum;
    }

    @Override
    public Album buscarAlbum(int id) {
        String sql = "select * from Album where codigoAlbum=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nuevoAlbum.setCodigoAlbum(rs.getInt("codigoAlbum"));
                nuevoAlbum.setNombreAlbum(rs.getString("nombreAlbum"));
                nuevoAlbum.setGeneroComun(rs.getString("generoComun"));
                nuevoAlbum.setFechaLanzamiento(rs.getDate("fechaLanzamiento"));
                nuevoAlbum.setCodigoArtista(rs.getInt("codigoArtista"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nuevoAlbum;
    }

    public List<Album> buscarAlbumPorNombre(String nombre) {
        String sql = "select * from Album where nombreAlbum LIKE ?";
        List<Album> albumsEncontrados = new ArrayList<>();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                nuevoAlbum.setCodigoAlbum(rs.getInt("codigoAlbum"));
                nuevoAlbum.setNombreAlbum(rs.getString("nombreAlbum"));
                nuevoAlbum.setGeneroComun(rs.getString("generoComun"));
                nuevoAlbum.setFechaLanzamiento(rs.getDate("fechaLanzamiento"));
                nuevoAlbum.setCodigoArtista(rs.getInt("codigoArtista"));
                albumsEncontrados.add(nuevoAlbum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return albumsEncontrados;
    }

    @Override
    public Album buscarAlbumes(int id) {
        String sql = "select * from Album where codigoAlbum=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nuevoAlbum.setCodigoAlbum(rs.getInt("codigoAlbum"));
                nuevoAlbum.setNombreAlbum(rs.getString("nombreAlbum"));
                nuevoAlbum.setGeneroComun(rs.getString("generoComun"));
                nuevoAlbum.setFechaLanzamiento(rs.getDate("fechaLanzamiento"));
                nuevoAlbum.setCodigoArtista(rs.getInt("codigoArtista"));
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
        return nuevoAlbum;
    }

    @Override
    public boolean eliminarAlbum(int id) {
        String sql = "delete from Album where codigoAlbum" + id;
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
        String sql = "select * from Canciones where codigoAlbum = ?";
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
