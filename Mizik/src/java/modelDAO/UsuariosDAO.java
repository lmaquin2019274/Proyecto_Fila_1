//@author dalvarez2022277

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDUsuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Usuarios;

public class UsuariosDAO implements CRUDUsuarios {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuarios nuevoUsuarios = new Usuarios();

    @Override
    public boolean agregarUsuario(Usuarios usuario) {
        String sql = "insert into Usuarios(nombreCompleto, usuario, correoUsuario, claveUsuario) values('" + nuevoUsuarios.getNombreCompleto() + "', '" + nuevoUsuarios.getNombreCompleto() + "', '" + nuevoUsuarios.getCorreoUsuario() + "', '" + nuevoUsuarios.getClaveUsuario() + "')";
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
    public boolean eliminarUsuario(int id) {
        String sql = "delete from Usuarios where codigoUsuario" + id;
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
    public List<Usuarios> listarUsuarios() {
        ArrayList<Usuarios> listaUsuarios = new ArrayList<>();
        String sql = "select * from Usuarios";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios nuevoUsuario = new Usuarios();
                nuevoUsuario.setCodigoUsuario(rs.getInt("codigoUsuario"));
                nuevoUsuario.setNombreCompleto(rs.getString("nombreCompleto"));
                nuevoUsuario.setUsuario(rs.getString("usuario"));
                nuevoUsuario.setCorreoUsuario(rs.getString("correoUsuario"));
                nuevoUsuario.setClaveUsuario(rs.getString("claveUsuario"));

                listaUsuarios.add(nuevoUsuario);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }

    @Override
    public boolean editarUsuario(Usuarios us) {
        String sql = "update Usuarios set codigoUsuario ='" + us.getCodigoUsuario() + "',nombreCompleto ='" + us.getNombreCompleto() + "',Usuario='" + us.getUsuario() + "',correoUsuario='" + us.getCorreoUsuario() + "',claveUsuario='" + us.getUsuario() + "' where codigoUsuario = " + us.getCodigoUsuario();
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Usuarios buscarUsuario(int id) {
        String sql = "select * from Usuarios where codigoUsuario=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nuevoUsuarios.setClaveUsuario("codigoUsuario");
                nuevoUsuarios.setNombreCompleto("nombreCompleto");
                nuevoUsuarios.setUsuario("usuario");
                nuevoUsuarios.setCorreoUsuario("correoUsuario");
                nuevoUsuarios.setClaveUsuario("claveUsuario");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nuevoUsuarios;
    }
    
    // metodo validar
    public Usuarios validar(String usuario, String claveUsuario){
        // se instancia el objeto
        Usuarios user = new Usuarios();
        // string para la consulta
        String sql = "select * from Usuarios where usuario = ? and claveUsuario = ?";
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, claveUsuario);
            rs = ps.executeQuery();
            while(rs.next()){
                user.setCodigoUsuario(rs.getInt("codigoUsuario"));
                user.setNombreCompleto(rs.getString("nombreCompleto"));
                user.setUsuario(rs.getString("usuario"));
                user.setCorreoUsuario(rs.getString("correoUsuario"));
                user.setClaveUsuario(rs.getString("claveUsuario"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
}
