//@author dmarroquin2019417

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDMixesHasCanciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.MixeshasCanciones;
 

public class MixeshasCancionesDAO implements CRUDMixesHasCanciones {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    MixeshasCanciones nMixeshasCanciones = new MixeshasCanciones();
    
     @Override
    public List<MixeshasCanciones> listarMixeshasCanciones() {
        ArrayList<MixeshasCanciones> listaMixeshasCanciones = new ArrayList<>();
        String sql = "select * from MixeshasCanciones";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                MixeshasCanciones LMixeshasCanciones = new MixeshasCanciones();
                LMixeshasCanciones.setCodigoMixeshasCanciones(rs.getInt("codigoMixeshasCanciones"));
                LMixeshasCanciones.setFechaMC(rs.getDate("fechaMC"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaMC").toLocalTime());
                LMixeshasCanciones.setNumeroUnico(rs.getInt("numeroUnico"));
                LMixeshasCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                LMixeshasCanciones.setCodigoMix(rs.getInt("codigoMix"));
                listaMixeshasCanciones.add(LMixeshasCanciones);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaMixeshasCanciones;
    }


    @Override
    public boolean agregarMixeshasCanciones(MixeshasCanciones per) {
        String sql = "insert into MixeshasCanciones(codigoMixeshasCanciones, fechaMC, horaMC, numeroUnico, codigoCancion, codigoMix) values('"+per.getCodigoMixeshasCanciones()+"', '"+per.getFechaMC()+"', '"+per.getHoraMC()+"', '"+per.getNumeroUnico()+"', '"+per.getCodigoCancion()+"','"+per.getCodigoMix()+"')";
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
    public MixeshasCanciones buscarMixeshasCanciones(int id) {
        String sql = "select * from MixeshasCanciones where codigoMixeshasCanciones =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
            {
                nMixeshasCanciones.setCodigoMixeshasCanciones (rs.getInt("codigoArtista"));
                nMixeshasCanciones.setFechaMC(rs.getDate("nombreArtista"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaMC").toLocalTime());
                nMixeshasCanciones.setNumeroUnico(rs.getInt("numeroUnico"));
                nMixeshasCanciones.setCodigoCancion(rs.getInt("codigoCancion"));
                nMixeshasCanciones.setCodigoMix(rs.getInt("codigoMix"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nMixeshasCanciones;
    }

    @Override
    public boolean eliminarMixeshasCanciones(int id) {
        String sql = "delete from Artistas where codigoMixeshasCanciones" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
}