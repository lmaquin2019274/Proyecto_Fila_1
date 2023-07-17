//@author lmaquin2019274

package model;

public class Canciones {
    
    private int codigoCancion;
    private String nombreCancion;
    private String nombreRaw;
    private String duracion;
    private int codigoGenero;
    private int codigoArtista;
    private int codigoAlbum;

    public Canciones() {
    }

    public Canciones(int codigoCancion, String nombreCancion, String nombreRaw, String duracion, int codigoGenero, int codigoArtista, int codigoAlbum) {
        this.codigoCancion = codigoCancion;
        this.nombreCancion = nombreCancion;
        this.nombreRaw = nombreRaw;
        this.duracion = duracion;
        this.codigoGenero = codigoGenero;
        this.codigoArtista = codigoArtista;
        this.codigoAlbum = codigoAlbum;
    }

    public int getCodigoCancion() {
        return codigoCancion;
    }

    public void setCodigoCancion(int codigoCancion) {
        this.codigoCancion = codigoCancion;
    }

    public String getNombreCancion() {
        return nombreCancion;
    }

    public void setNombreCancion(String nombreCancion) {
        this.nombreCancion = nombreCancion;
    }

    public String getNombreRaw() {
        return nombreRaw;
    }

    public void setNombreRaw(String nombreRaw) {
        this.nombreRaw = nombreRaw;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public int getCodigoGenero() {
        return codigoGenero;
    }

    public void setCodigoGenero(int codigoGenero) {
        this.codigoGenero = codigoGenero;
    }

    public int getCodigoArtista() {
        return codigoArtista;
    }

    public void setCodigoArtista(int codigoArtista) {
        this.codigoArtista = codigoArtista;
    }

    public int getCodigoAlbum() {
        return codigoAlbum;
    }

    public void setCodigoAlbum(int codigoAlbum) {
        this.codigoAlbum = codigoAlbum;
    }
}
