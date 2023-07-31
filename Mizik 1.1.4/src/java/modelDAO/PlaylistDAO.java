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
        String sql = "INSERT INTO playlist(nombrePlaylist, descripcionPlaylist, cantidadCanciones, codigoUsuario) VALUES (?, ?, ?, ?)";
        try (Connection con = connect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, playlist.getNombrePlaylist());
            ps.setString(2, playlist.getDescripcionPlaylist());
            ps.setInt(3, playlist.getCantidadCanciones());
            ps.setInt(4, playlist.getCodigoUsuario());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminarPlaylist(int id) {
        String sql = "Delete from playlist where codigoPlaylist" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
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
        String sql = "update playlist set nombrePlaylist = '" + nPlaylist.getNombrePlaylist() + "',descripcionPlaylist ='" + nPlaylist.getDescripcionPlaylist() + "',cantidadCanciones ='"
                + nPlaylist.getCodigoUsuario() + "'where codigoPlaylist = " + nPlaylist.getCodigoPlaylist();
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Playlist> listarPlaylists() {
        List<Playlist> listarPlaylist = new ArrayList<>();
        String sql = "SELECT p.codigoPlaylist, p.nombrePlaylist, p.descripcionPlaylist, p.codigoUsuario, COUNT(pc.codigoCancion) AS cantidadCanciones " +
                     "FROM playlist AS p " +
                     "LEFT JOIN PlaylisthasCanciones AS pc ON p.codigoPlaylist = pc.codigoPlaylist " +
                     "GROUP BY p.codigoPlaylist";

        try (Connection con = connect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Playlist nuevaPlaylist = new Playlist();
                nuevaPlaylist.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                nuevaPlaylist.setNombrePlaylist(rs.getString("nombrePlaylist"));
                nuevaPlaylist.setDescripcionPlaylist(rs.getString("descripcionPlaylist"));
                nuevaPlaylist.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nuevaPlaylist.setCodigoUsuario(rs.getInt("codigoUsuario"));
                listarPlaylist.add(nuevaPlaylist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listarPlaylist;
    }

    @Override
    public Playlist buscarPlaylist(int id) {
        String sql = "Select * from playlist where codigoPlaylist =" + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nPlaylist.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                nPlaylist.setNombrePlaylist(rs.getString("nombrePlaylist"));
                nPlaylist.setDescripcionPlaylist(rs.getString("descripcionPlaylist"));
                nPlaylist.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nPlaylist.setCodigoUsuario(rs.getInt("codigoUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nPlaylist;
    }

}
