//@author lmaquin2019274

package model;

public class Playlist {
    
    private int codigoPlaylist;
    private String nombrePlaylist;
    private String descricionPlaylist;
    private int cantidadCanciones;
    private int codigoUsuario;

    public Playlist() {
    }

    public Playlist(int codigoPlaylist, String nombrePlaylist, String descricionPlaylist, int cantidadCanciones, int codigoUsuario) {
        this.codigoPlaylist = codigoPlaylist;
        this.nombrePlaylist = nombrePlaylist;
        this.descricionPlaylist = descricionPlaylist;
        this.cantidadCanciones = cantidadCanciones;
        this.codigoUsuario = codigoUsuario;
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

    public String getDescricionPlaylist() {
        return descricionPlaylist;
    }

    public void setDescricionPlaylist(String descricionPlaylist) {
        this.descricionPlaylist = descricionPlaylist;
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
}
