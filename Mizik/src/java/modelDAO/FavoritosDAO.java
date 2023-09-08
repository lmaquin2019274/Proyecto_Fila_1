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
    public boolean agregarFavoritos(int idUsuario, int idCancion) {
        String sql = "insert into Favoritos(cantidadCanciones, duracionTotal, cantidadArtistas, codigoUsuario, codigoCancion) values (1, 1, 1, ?, ?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setInt(2, idCancion);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminarFavoritos(int idCancion, int idUser) {
        String sql = "delete from Favoritos where codigoCancion = ? and codigoUsuario = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCancion);
            ps.setInt(2, idUser);
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

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoUsuario);
            rs = ps.executeQuery();

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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCancionesFavoritas;
    }


    @Override
    public Favoritos buscarFavoritos(int idCancion, int idUsuario) {
        String sql = "select * from Favoritos where codigoCancion=" + idCancion +" and codigoUsuario="+ idUsuario;
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
