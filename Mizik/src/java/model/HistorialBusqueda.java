//@author lmaquin2019274

package model;

import java.time.LocalDateTime;
import java.util.Date;

public class HistorialBusqueda {
    
    private int codigoHistorialB;
    private Date fechaHB;
    private LocalDateTime horaHB;
    private String palabraBuscada;
    private int codigoUsuario;

    public HistorialBusqueda() {
    }

    public HistorialBusqueda(int codigoHistorialB, Date fechaHB, LocalDateTime horaHB, String palabraBuscada, int codigoUsuario) {
        this.codigoHistorialB = codigoHistorialB;
        this.fechaHB = fechaHB;
        this.horaHB = horaHB;
        this.palabraBuscada = palabraBuscada;
        this.codigoUsuario = codigoUsuario;
    }

    public int getCodigoHistorialB() {
        return codigoHistorialB;
    }

    public void setCodigoHistorialB(int codigoHistorialB) {
        this.codigoHistorialB = codigoHistorialB;
    }

    public Date getFechaHB() {
        return fechaHB;
    }

    public void setFechaHB(Date fechaHB) {
        this.fechaHB = fechaHB;
    }

    public LocalDateTime getHoraHB() {
        return horaHB;
    }

    public void setHoraHB(LocalDateTime horaHB) {
        this.horaHB = horaHB;
    }

    public String getPalabraBuscada() {
        return palabraBuscada;
    }

    public void setPalabraBuscada(String palabraBuscada) {
        this.palabraBuscada = palabraBuscada;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }
}
