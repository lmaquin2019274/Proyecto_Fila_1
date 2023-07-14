
package model;

import java.util.Date;


public class Artistas {
    private int codigoArtista;
    private String nombreArtista;
    private Date fechaNacimiento;
    private String paisNacimiento;

    public Artistas() {
    }

    public Artistas(int codigoArtista, String nombreArtista, Date fechaNacimiento, String paisNacimiento) {
        this.codigoArtista = codigoArtista;
        this.nombreArtista = nombreArtista;
        this.fechaNacimiento = fechaNacimiento;
        this.paisNacimiento = paisNacimiento;
    }

    public int getCodigoArtista() {
        return codigoArtista;
    }

    public void setCodigoArtista(int codigoArtista) {
        this.codigoArtista = codigoArtista;
    }

    public String getNombreArtista() {
        return nombreArtista;
    }

    public void setNombreArtista(String nombreArtista) {
        this.nombreArtista = nombreArtista;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getPaisNacimiento() {
        return paisNacimiento;
    }

    public void setPaisNacimiento(String paisNacimiento) {
        this.paisNacimiento = paisNacimiento;
    }
    
    
            
}
