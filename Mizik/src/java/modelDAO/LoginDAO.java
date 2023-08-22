//@author darevalo2022062

package modelDAO;

import configuration.Conexion;
import interfaces.CRUDLogin;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Login;

public class LoginDAO implements CRUDLogin {

    Conexion conect = new Conexion();
    Connection con;
    CallableStatement cs;
    PreparedStatement ps;
    ResultSet rs;
    Login nLogin = new Login();

    @Override
    public boolean agregarLogin(Login login) {
        String sql = "INSERT INTO Login (fechaLogin, horaLogin, estadoSesion, codigoUsuario) VALUES (now(), now(), ?, ?)";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);

            ps.setBoolean(1, login.isEstadoSesion());
            ps.setInt(2, login.getCodigoUsuario());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
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
        String sql = "Select * from Login";
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
                lista.add(nuevoLogin);
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
