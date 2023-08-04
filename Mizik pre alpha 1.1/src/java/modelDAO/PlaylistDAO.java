//@author sistacuy2022017

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDPlaylist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        String sql = "insert into playlist(nombrePlaylist,descripcionPlaylist,cantidadCanciones,codigoUsuario) values('" + nPlaylist.getNombrePlaylist() + "','" 
                    + nPlaylist.getDescricionPlaylist() + "','" + nPlaylist.getCantidadCanciones() + "','" + nPlaylist.getCodigoUsuario() + "')";
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
        String sql = "update playlist set nombrePlaylist = '" + nPlaylist.getNombrePlaylist() + "',descripcionPlaylist ='" + nPlaylist.getDescricionPlaylist() + "',cantidadCanciones ='"
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
        ArrayList<Playlist> listarPlaylist = new ArrayList<>();
        String sql = "select * from playlist";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Playlist nuevaPlaylist = new Playlist();
                nuevaPlaylist.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                nuevaPlaylist.setNombrePlaylist(rs.getString("nombrePlaylist"));
                nuevaPlaylist.setDescricionPlaylist(rs.getString("descripcionPlaylist"));
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
                nPlaylist.setDescricionPlaylist(rs.getString("descripcionPlaylist"));
                nPlaylist.setCantidadCanciones(rs.getInt("cantidadCanciones"));
                nPlaylist.setCodigoUsuario(rs.getInt("codigoUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nPlaylist;
    }

}