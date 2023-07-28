//@author lmaquin2019274

package model;

import java.time.LocalDateTime;
import java.util.Date;

public class Login {
    
    private int codigoLogin;
    private Date fechaLogin;
    private LocalDateTime horaLogin;
    private boolean estadoSesion;
    private int codigoUsuario;

    public Login() {
    }

    public Login(int codigoLogin, Date fechaLogin, LocalDateTime horaLogin, boolean estadoSesion, int codigoUsuario) {
        this.codigoLogin = codigoLogin;
        this.fechaLogin = fechaLogin;
        this.horaLogin = horaLogin;
        this.estadoSesion = estadoSesion;
        this.codigoUsuario = codigoUsuario;
    }

    public int getCodigoLogin() {
        return codigoLogin;
    }

    public void setCodigoLogin(int codigoLogin) {
        this.codigoLogin = codigoLogin;
    }

    public Date getFechaLogin() {
        return fechaLogin;
    }

    public void setFechaLogin(Date fechaLogin) {
        this.fechaLogin = fechaLogin;
    }

    public LocalDateTime getHoraLogin() {
        return horaLogin;
    }

    public void setHoraLogin(LocalDateTime horaLogin) {
        this.horaLogin = horaLogin;
    }

    public boolean isEstadoSesion() {
        return estadoSesion;
    }

    public void setEstadoSesion(boolean estadoSesion) {
        this.estadoSesion = estadoSesion;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }
}
