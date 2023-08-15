//@author dalvarez2022277
package modelDAO;

import configuration.Conexion;
import interfaces.CRUDUsuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Usuarios;

public class UsuariosDAO implements CRUDUsuarios {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuarios nuevoUsuarios = new Usuarios();
    private static String userActual;
    private static String contraseniaActual;
    
    @Override
    public boolean agregarUsuario(Usuarios usuario) {
        String sql = "INSERT INTO Usuarios(nombreCompleto, usuario, correoUsuario, claveUsuario) VALUES (?, ?, ?, ?)";
        try {
            con = conect.getConnection();
            con.setAutoCommit(false);

            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombreCompleto());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.getCorreoUsuario());
            ps.setString(4, usuario.getClaveUsuario());
            ps.executeUpdate();

            con.commit();
            con.setAutoCommit(true);

            return true;
        } catch (Exception e) {
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
    public boolean eliminarUsuario(int id) {
        String sql = "delete from Usuarios where codigoUsuario = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
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
    public Usuarios validar(String usuario, String claveUsuario) {
        boolean x = false;
        // Se instancia el objeto
        Usuarios user = new Usuarios(); // Inicializamos user como null
        // String para la consulta
        String sql = "select * from Usuarios where usuario = ? and claveUsuario = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, claveUsuario);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new Usuarios();
                user.setCodigoUsuario(rs.getInt("codigoUsuario"));
                user.setNombreCompleto(rs.getString("nombreCompleto"));
                user.setUsuario(rs.getString("usuario"));
                user.setCorreoUsuario(rs.getString("correoUsuario"));
                user.setClaveUsuario(rs.getString("claveUsuario"));
                x = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (x == false) {
            user = null;
        }

        return user;
    }
    
    public void setDatosActuales(String u, String c){
        userActual = u;
        contraseniaActual = c;
    }
    
    // Para retornar el id del usuario activo
    public int datosActuales(){
        int id;
        Usuarios user = new Usuarios(); // Inicializamos user como null
        // String para la consulta
        String sql = "select * from Usuarios where usuario = ? and claveUsuario = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userActual);
            ps.setString(2, contraseniaActual);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new Usuarios();
                user.setCodigoUsuario(rs.getInt("codigoUsuario"));
                user.setNombreCompleto(rs.getString("nombreCompleto"));
                user.setUsuario(rs.getString("usuario"));
                user.setCorreoUsuario(rs.getString("correoUsuario"));
                user.setClaveUsuario(rs.getString("claveUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        id = user.getCodigoUsuario();
        return id;
    }
    
    @Override
    public Usuarios buscarUsuarioNombre(String user) {
        String sql = "SELECT * FROM Usuarios WHERE usuario = ?";
        Usuarios nuevoUsuarios = null;

        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();

            if (rs.next()) {
                nuevoUsuarios = new Usuarios();
                nuevoUsuarios.setCodigoUsuario(rs.getInt("codigoUsuario"));
                nuevoUsuarios.setNombreCompleto(rs.getString("nombreCompleto"));
                nuevoUsuarios.setUsuario(rs.getString("usuario"));
                nuevoUsuarios.setCorreoUsuario(rs.getString("correoUsuario"));
                nuevoUsuarios.setClaveUsuario(rs.getString("claveUsuario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nuevoUsuarios;
    }
}
