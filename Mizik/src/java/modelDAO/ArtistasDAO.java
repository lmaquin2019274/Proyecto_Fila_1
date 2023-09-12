//@author iiboy2022099

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDArtista;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Artistas;
import model.Canciones;
 

public class ArtistasDAO implements CRUDArtista {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Artistas nArtistas = new Artistas();
    
     @Override
    public List<Artistas> listarArtistas() {
        ArrayList<Artistas> listaArtistas = new ArrayList<>();
        String sql = "select * from Artista";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Artistas nuevacodigoArtista = new Artistas();
                nuevacodigoArtista.setCodigoArtista(rs.getInt("codigoArtista"));
                nuevacodigoArtista.setNombreArtista(rs.getString("nombreArtista"));
                nuevacodigoArtista.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                nuevacodigoArtista.setPaisNacimiento(rs.getString("paisNacimiento"));
                listaArtistas.add(nuevacodigoArtista);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaArtistas;
    }

    @Override
    public Artistas buscarArtista(int id) {
        String sql = "select * from Artista where codigoArtista=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                nArtistas.setCodigoArtista(rs.getInt("codigoArtista"));
                nArtistas.setNombreArtista(rs.getString("nombreArtista"));
                nArtistas.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                nArtistas.setPaisNacimiento(rs.getString("paisNacimiento"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nArtistas;
    }

    
    public List<Artistas> buscarArtistasPorNombre(String nombre) {
        String sql = "SELECT * FROM Artista WHERE nombreArtista LIKE ?";
        List<Artistas> artistasEncontrados = new ArrayList<>();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Artistas nArtistas = new Artistas();
                nArtistas.setCodigoArtista(rs.getInt("codigoArtista"));
                nArtistas.setNombreArtista(rs.getString("nombreArtista"));
                nArtistas.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                nArtistas.setPaisNacimiento(rs.getString("paisNacimiento"));
                artistasEncontrados.add(nArtistas);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return artistasEncontrados;
    }
    
    @Override
    public Artistas buscarArtistas(int id) {
        String sql = "select * from Artista where codigoArtista=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                nArtistas.setCodigoArtista(rs.getInt("codigoArtista"));
                nArtistas.setNombreArtista(rs.getString("nombreArtista"));
                nArtistas.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                nArtistas.setPaisNacimiento(rs.getString("paisNacimiento"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return nArtistas;
    }
    
    @Override
    public boolean eliminarArtista(int id) {
        String sql = "delete from Artista where codigoArtista" + id;
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
        String sql = "select * from Canciones where codigoArtista = ?";
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

