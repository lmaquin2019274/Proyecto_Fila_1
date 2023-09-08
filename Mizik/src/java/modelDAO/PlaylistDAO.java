//@author sistacuy2022017

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDPlaylist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Playlist;
import model.PlaylisthasCanciones;

public class PlaylistDAO implements CRUDPlaylist {

    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Playlist nPlaylist = new Playlist();

    @Override
    public boolean agregarPlaylist(Playlist playlist) {
        String sql = "INSERT INTO playlist(nombrePlaylist, descripcionPlaylist, cantidadCanciones, codigoUsuario, imagen) VALUES (?, ?, ?, ?, ?)";
        Connection con = null;
        try {
            con = connect.getConnection();
            con.setAutoCommit(false);
            
            ps = con.prepareStatement(sql);
            ps.setString(1, playlist.getNombrePlaylist());
            ps.setString(2, playlist.getDescripcionPlaylist());
            ps.setInt(3, playlist.getCantidadCanciones());
            ps.setInt(4, playlist.getCodigoUsuario());
            ps.setString(5, playlist.getImagen());
            ps.executeUpdate();
            
            con.commit();
            con.setAutoCommit(true);
            
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                con.rollback();
                con.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean eliminarPlaylist(int id) {
        String sql = "delete from playlist where codigoPlaylist = ?";
        Connection con = null;
        try {
            con = connect.getConnection();
            con.setAutoCommit(false);
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            
            con.commit();
            con.setAutoCommit(true);
            
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public List<PlaylisthasCanciones> obtenerCancionesDePlaylist(int playlistId) {
        ArrayList<PlaylisthasCanciones> listaCanciones = new ArrayList<>();
        String sql = "select * from PlaylisthasCanciones where codigoPlaylist = ?";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, playlistId);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlaylisthasCanciones playlisthasCanciones = new PlaylisthasCanciones();
                playlisthasCanciones.setCodigoPlaylisthasCanciones(rs.getInt("codigoPlaylisthasCanciones"));
                playlisthasCanciones.setFechaPC(rs.getDate("fechaPC"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaPC").toLocalTime());
                playlisthasCanciones.setNumeroUnico(rs.getInt("numeroUnico"));
                playlisthasCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                playlisthasCanciones.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                
                listaCanciones.add(playlisthasCanciones);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCanciones;
    }
    
    @Override
    public boolean modificarPlaylist(Playlist playlist) {
        String sql = "update PlayList set nombrePlaylist = ?, descripcionPlaylist = ?, imagen = ? where codigoPlaylist = ?";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, playlist.getNombrePlaylist());
            ps.setString(2, playlist.getDescripcionPlaylist());
            ps.setString(3, playlist.getImagen());
            ps.setInt(4, playlist.getCodigoPlaylist());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public List<Playlist> listarPlaylists(int codigoUsuario) {
        List<Playlist> listarPlaylist = new ArrayList<>();
        String sql = "SELECT p.codigoPlaylist, p.nombrePlaylist, p.descripcionPlaylist, p.codigoUsuario, p.imagen, COUNT(pc.codigoCancion) AS cantidadCanciones " +
            "FROM Playlist AS p " +
            "LEFT JOIN PlaylisthasCanciones AS pc ON p.codigoPlaylist = pc.codigoPlaylist " +
            "WHERE p.codigoUsuario = ? " +
            "GROUP BY p.codigoPlaylist";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoUsuario);

            rs = ps.executeQuery();

            while (rs.next()) {
                Playlist nuevaPlaylist = new Playlist();
                nuevaPlaylist.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                nuevaPlaylist.setNombrePlaylist(rs.getString("nombrePlaylist"));
                nuevaPlaylist.setDescripcionPlaylist(rs.getString("descripcionPlaylist"));
                nuevaPlaylist.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nuevaPlaylist.setCodigoUsuario(rs.getInt("codigoUsuario"));
                nuevaPlaylist.setImagen(rs.getString("imagen"));
                listarPlaylist.add(nuevaPlaylist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listarPlaylist;
    }

    @Override
    public Playlist buscarPlaylist(int id) {
        String sql = "Select * from playlist where codigoPlaylist = ?";
        Connection con = null;
        try {
            con = connect.getConnection();
            con.setAutoCommit(false);
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                nPlaylist.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                nPlaylist.setNombrePlaylist(rs.getString("nombrePlaylist"));
                nPlaylist.setDescripcionPlaylist(rs.getString("descripcionPlaylist"));
                nPlaylist.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nPlaylist.setCodigoUsuario(rs.getInt("codigoUsuario"));
                nPlaylist.setImagen(rs.getString("imagen"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nPlaylist;
    }

}
