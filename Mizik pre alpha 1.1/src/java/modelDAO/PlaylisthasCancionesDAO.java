//@author bmarroquin2019551

package modelDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import configuration.Conexion;
import interfaces.CRUDPlaylisthasCanciones;
import java.time.LocalDate;
import java.time.LocalDateTime;
import model.PlaylisthasCanciones;

public class PlaylisthasCancionesDAO implements CRUDPlaylisthasCanciones{
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    PlaylisthasCanciones nuevoPlaylisthasCanciones = new PlaylisthasCanciones();

    @Override
    public boolean agregarPlaylisthasCanciones(PlaylisthasCanciones PlaylisthasCanciones) {
        String sql = "insert into PlaylisthasCanciones(codigoPlaylisthasCanciones,fechaPC, horaPC, numeroUnico, codigoCancion, codigoPlaylist) values('"+nuevoPlaylisthasCanciones.getCodigoPlaylisthasCanciones()+"', '"+nuevoPlaylisthasCanciones.getFechaPC()+"', '"+nuevoPlaylisthasCanciones.getHoraPC()+"', '"+nuevoPlaylisthasCanciones.getNumeroUnico()+"', '"+nuevoPlaylisthasCanciones.getCodigoCancion()+"','"+nuevoPlaylisthasCanciones.getCodigoPlaylist()+"')";
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
    public boolean eliminarPlaylisthasCanciones(int id) {
        String sql = "delete from PlaylisthasCanciones where codigoPlaylisthasCanciones" + id;
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
    public List<PlaylisthasCanciones> listarPlaylisthasCanciones() {
        ArrayList<PlaylisthasCanciones> listaPlaylisthasCanciones = new ArrayList<>();
        String sql = "select * from PlaylisthasCanciones";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlaylisthasCanciones nuevoPlaylisthasCanciones = new PlaylisthasCanciones();
                nuevoPlaylisthasCanciones.setCodigoPlaylisthasCanciones(rs.getInt("codigoPlaylisthasCanciones"));
                nuevoPlaylisthasCanciones.setFechaPC(rs.getDate("fechaPC"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaPC").toLocalTime());
                nuevoPlaylisthasCanciones.setNumeroUnico(rs.getInt("numeroUnico"));
                nuevoPlaylisthasCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                nuevoPlaylisthasCanciones.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
                
                listaPlaylisthasCanciones.add(nuevoPlaylisthasCanciones);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaPlaylisthasCanciones;
    }

    @Override
    public PlaylisthasCanciones buscarPlaylisthasCanciones(int id) {
        String sql = "select * from PlaylisthasCanciones where codigoPlaylisthasCanciones=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlaylisthasCanciones nuevoPlaylisthasCanciones = new PlaylisthasCanciones();
                nuevoPlaylisthasCanciones.setCodigoPlaylisthasCanciones(rs.getInt("CodigoPHC"));
                nuevoPlaylisthasCanciones.setFechaPC(rs.getDate("fechaPC"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaPC").toLocalTime());
                nuevoPlaylisthasCanciones.setNumeroUnico(rs.getInt("numeroUnico"));
                nuevoPlaylisthasCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                nuevoPlaylisthasCanciones.setCodigoPlaylist(rs.getInt("codigoPlaylist"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
         return nuevoPlaylisthasCanciones;
    }
    
    
}

