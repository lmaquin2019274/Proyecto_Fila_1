//@author lmaquin2019274

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDFavoritos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Canciones;
import model.Favoritos;

public class FavoritosDAO implements CRUDFavoritos{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Favoritos nuevoFavorito = new Favoritos();

    @Override
    public boolean agregarFavoritos(Favoritos favoritos) {
        String sql = "insert into Favoritos(cantidadCanciones, duracionTotal, cantidadArtistas, codigoUsario, codigoCancion) values (?, ?, ?, ?, ?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, favoritos.getCantidadCanciones());
            ps.setString(2, favoritos.getDuracionTotal());
            ps.setInt(3, favoritos.getCantidadArtistas());
            ps.setInt(4, favoritos.getCodigoUsario());
            ps.setInt(5, favoritos.getCodigoCancion());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminarFavoritos(int id) {
        String sql = "delete from Favoritos where codigoFav = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Canciones> listarFavoritos(int codigoUsuario) {
        List<Canciones> listaCancionesFavoritas = new ArrayList<>();
        String sql = "SELECT c.* FROM Favoritos f INNER JOIN Canciones c ON f.codigoCancion = c.codigoCancion WHERE f.codigoUsuario = ?";

        try (Connection con = conect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codigoUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Canciones cancion = new Canciones();
                    cancion.setCodigoCancion(rs.getInt("codigoCancion"));
                    cancion.setNombreCancion(rs.getString("nombreCancion"));
                    cancion.setDuracion(rs.getString("duracion"));
                    cancion.setCodigoGenero(rs.getInt("codigoGenero"));
                    cancion.setCodigoArtista(rs.getInt("codigoArtista"));
                    cancion.setCodigoAlbum(rs.getInt("codigoAlbum"));

                    listaCancionesFavoritas.add(cancion);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCancionesFavoritas;
    }


    @Override
    public Favoritos buscarFavoritos(int id) {
        String sql = "select * from Favoritos where codigoFavorito=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nuevoFavorito.setCodigoFav(rs.getInt("codigoFav"));
                nuevoFavorito.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nuevoFavorito.setDuracionTotal(rs.getString("duracionTotal"));
                nuevoFavorito.setCantidadArtistas(rs.getInt("cantidadArtistas"));
                nuevoFavorito.setCodigoUsario(rs.getInt("codigoUsuario"));
                nuevoFavorito.setCodigoCancion(rs.getInt("codigoCancion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nuevoFavorito;
    }
    
    
}
