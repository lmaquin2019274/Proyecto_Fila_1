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

public class FavoritosDAO implements CRUDFavoritos{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Favoritos nuevoFavorito = new Favoritos();

    @Override
    public boolean agregarFavoritos(Favoritos favoritos) {
        String sql = "insert into Favoritos(cantidadCanciones, duracionTotal, cantidadArtistas, codigoUsario, codigoCancion) values('"+nuevoFavorito.getCantidadCanciones()+"', '"+nuevoFavorito.getDuracionTotal()+"', '"+nuevoFavorito.getCantidadArtistas()+"', '"+nuevoFavorito.getCodigoUsario()+"', '"+nuevoFavorito.getCodigoCancion()+"')";
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminarFavoritos(int id) {
        String sql = "delete from Favoritos where codigoFavorito" + id;
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
    public List<Favoritos> listarFavoritos() {
        ArrayList<Favoritos> listaFavoritos = new ArrayList<>();
        String sql = "select * from Favoritos";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Favoritos nuevoFavorito = new Favoritos();
                nuevoFavorito.setCodigoFav(rs.getInt("codigoFav"));
                nuevoFavorito.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nuevoFavorito.setDuracionTotal(rs.getString("duracionTotal"));
                nuevoFavorito.setCantidadArtistas(rs.getInt("cantidadArtistas"));
                nuevoFavorito.setCodigoUsario(rs.getInt("codigoUsuario"));
                nuevoFavorito.setCodigoCancion(rs.getInt("codigoCancion"));
                
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
