//@author lmaquin2019274

package model;

import java.util.Date;

public class Album {
    
    private int codigoAlbum;
    private String nombreAlbum;
    private String generoComun;
    private Date fechaLanzamiento;
    private int codigoArtista;

    public Album() {
    }

    public Album(int codigoAlbum, String nombreAlbum, String generoComun, Date fechaLanzamiento, int codigoArtista) {
        this.codigoAlbum = codigoAlbum;
        this.nombreAlbum = nombreAlbum;
        this.generoComun = generoComun;
        this.fechaLanzamiento = fechaLanzamiento;
        this.codigoArtista = codigoArtista;
    }

    public int getCodigoAlbum() {
        return codigoAlbum;
    }

    public void setCodigoAlbum(int codigoAlbum) {
        this.codigoAlbum = codigoAlbum;
    }

    public String getNombreAlbum() {
        return nombreAlbum;
    }

    public void setNombreAlbum(String nombreAlbum) {
        this.nombreAlbum = nombreAlbum;
    }

    public String getGeneroComun() {
        return generoComun;
    }

    public void setGeneroComun(String generoComun) {
        this.generoComun = generoComun;
    }

    public Date getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public void setFechaLanzamiento(Date fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    public int getCodigoArtista() {
        return codigoArtista;
    }

    public void setCodigoArtista(int codigoArtista) {
        this.codigoArtista = codigoArtista;
    }
}
