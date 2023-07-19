//@author lmaquin2019274

package model;

import java.time.LocalDateTime;
import java.util.Date;

public class HistorialReproduccion {
    
    private int codigoHistorialR;
    private Date fechaHR;
    private LocalDateTime horaHR;
    private String origen;
    private int codigoUsuario;

    public HistorialReproduccion() {
    }

    public HistorialReproduccion(int codigoHistorialR, Date fechaHR, LocalDateTime horaHR, String origen, int codigoUsuario) {
        this.codigoHistorialR = codigoHistorialR;
        this.fechaHR = fechaHR;
        this.horaHR = horaHR;
        this.origen = origen;
        this.codigoUsuario = codigoUsuario;
    }

    public int getCodigoHistorialR() {
        return codigoHistorialR;
    }

    public void setCodigoHistorialR(int codigoHistorialR) {
        this.codigoHistorialR = codigoHistorialR;
    }

    public Date getFechaHR() {
        return fechaHR;
    }

    public void setFechaHR(Date fechaHR) {
        this.fechaHR = fechaHR;
    }

    public LocalDateTime getHoraHR() {
        return horaHR;
    }

    public void setHoraHR(LocalDateTime horaHR) {
        this.horaHR = horaHR;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }
}
