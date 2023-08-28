//@author lmaquin2019274

package model;

public class Playlist {
    
    private int codigoPlaylist;
    private String nombrePlaylist;
    private String descripcionPlaylist;
    private int cantidadCanciones;
    private int codigoUsuario;
    private String imagen;

    public Playlist() {
    }

    public Playlist(int codigoPlaylist, String nombrePlaylist, String descripcionPlaylist, int cantidadCanciones, int codigoUsuario, String imagen) {
        this.codigoPlaylist = codigoPlaylist;
        this.nombrePlaylist = nombrePlaylist;
        this.descripcionPlaylist = descripcionPlaylist;
        this.cantidadCanciones = cantidadCanciones;
        this.codigoUsuario = codigoUsuario;
        this.imagen = imagen;
    }

    public int getCodigoPlaylist() {
        return codigoPlaylist;
    }

    public void setCodigoPlaylist(int codigoPlaylist) {
        this.codigoPlaylist = codigoPlaylist;
    }

    public String getNombrePlaylist() {
        return nombrePlaylist;
    }

    public void setNombrePlaylist(String nombrePlaylist) {
        this.nombrePlaylist = nombrePlaylist;
    }

    public String getDescripcionPlaylist() {
        return descripcionPlaylist;
    }

    public void setDescripcionPlaylist(String descripcionPlaylist) {
        this.descripcionPlaylist = descripcionPlaylist;
    }

    public int getCantidadCanciones() {
        return cantidadCanciones;
    }

    public void setCantidadCanciones(int cantidadCanciones) {
        this.cantidadCanciones = cantidadCanciones;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    }
