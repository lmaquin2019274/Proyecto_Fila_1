package modelDAO;

import configuration.Conexion;
import interfaces.CRUDLogin;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Login;

public class LoginDAO implements CRUDLogin {

    Conexion conect = new Conexion();
    Connection con;
    CallableStatement cs;
    ResultSet rs;
    Login nLogin = new Login();

    @Override
    public boolean agregarLogin(Login login) {
        String sql = "Call sp_AgregarLogin(" + login.getCodigoLogin() + ")";
        try {
            con = conect.getConnection();
            cs = con.prepareCall(sql);
            cs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminarLogin(int id) {
        String sql = "Call sp_EliminarLogin(" + id + ")";
        try {
            con = conect.getConnection();
            cs = con.prepareCall(sql);
            cs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Login> listarLogins() {
        ArrayList<Login> lista = new ArrayList<Login>();
        String sql = "Call sp_ListarLogins()";
        try {
            con = conect.getConnection();
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                Login nuevoLogin = new Login();
                nuevoLogin.setCodigoLogin(rs.getInt("codigoLogin"));
                nuevoLogin.setFechaLogin(rs.getDate("fechaLogin"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaLogin").toLocalTime());
                nuevoLogin.setHoraLogin(localDateTime);
                nuevoLogin.setEstadoSesion(rs.getBoolean("estadoSesion"));
                nuevoLogin.setCodigoUsuario(rs.getInt("codigoUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public Login buscarLogin(int id) {
        String sql = "Call sp_BuscarLogin(" + id + ")";
         try {
            con = conect.getConnection();
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                nLogin.setCodigoLogin(rs.getInt("codigoLogin"));
                nLogin.setFechaLogin(rs.getDate("fechaLogin"));
                LocalDateTime localDateTime = LocalDateTime.of(LocalDate.now(), rs.getTime("horaLogin").toLocalTime());
                nLogin.setHoraLogin(localDateTime);
                nLogin.setEstadoSesion(rs.getBoolean("estadoSesion"));
                nLogin.setCodigoUsuario(rs.getInt("codigoUsuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nLogin;
    }

}
