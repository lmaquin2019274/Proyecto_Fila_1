//@author lmaquin2019274
package modelDAO;

import configuration.Conexion;
import interfaces.CRUDFavoritos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Favoritos;

public class FavoritosDAO implements CRUDFavoritos {

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

    public List<Favoritos> listarFavoritos() {
        ArrayList<Favoritos> listaFavoritos = new ArrayList<>();
        int id;
        UsuariosDAO uDAO = new UsuariosDAO();
        id = uDAO.datosActuales();
        String sql = "select * from Favoritos where codigoUsuario = "+id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Favoritos nuevoFavorito = new Favoritos();
                if (rs.getInt("codigoFav") != 0) {
                    nuevoFavorito.setCodigoFav(rs.getInt("codigoFav"));
                }
                if (rs.getInt("cantidadCanciones") != 0) {
                    nuevoFavorito.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                }
                if (rs.getString("duraciónTotal") != null) { 
                    nuevoFavorito.setDuracionTotal(rs.getString("duraciónTotal")); // Por alguna razon en la base de datos lo pusieron con tilde duracionTotal
                }
                if (rs.getInt("cantidadArtistas") != 0) {
                    nuevoFavorito.setCantidadArtistas(rs.getInt("cantidadArtistas"));
                }
                if (rs.getInt("codigoUsuario") != 0) {
                    nuevoFavorito.setCodigoUsario(rs.getInt("codigoUsuario"));
                }
                if (rs.getInt("codigoCancion") != 0) {
                    nuevoFavorito.setCodigoCancion(rs.getInt("codigoCancion"));
                }

                listaFavoritos.add(nuevoFavorito);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaFavoritos;
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
