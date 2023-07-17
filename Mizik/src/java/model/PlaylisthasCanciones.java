//@author lmaquin2019274
        
package model;

import java.time.LocalDateTime;
import java.util.Date;

public class PlaylisthasCanciones {
    
    private int codigoPlaylisthasCanciones;
    private Date fechaPC;
    private LocalDateTime horaPC;
    private int numeroUnico;
    private int codigoCancion;
    private int codigoPlaylist;

    public PlaylisthasCanciones() {
    }

    public PlaylisthasCanciones(int codigoPlaylisthasCanciones, Date fechaPC, LocalDateTime horaPC, int numeroUnico, int codigoCancion, int codigoPlaylist) {
        this.codigoPlaylisthasCanciones = codigoPlaylisthasCanciones;
        this.fechaPC = fechaPC;
        this.horaPC = horaPC;
        this.numeroUnico = numeroUnico;
        this.codigoCancion = codigoCancion;
        this.codigoPlaylist = codigoPlaylist;
    }

    public int getCodigoPlaylisthasCanciones() {
        return codigoPlaylisthasCanciones;
    }

    public void setCodigoPlaylisthasCanciones(int codigoPlaylisthasCanciones) {
        this.codigoPlaylisthasCanciones = codigoPlaylisthasCanciones;
    }

    public Date getFechaPC() {
        return fechaPC;
    }

    public void setFechaPC(Date fechaPC) {
        this.fechaPC = fechaPC;
    }

    public LocalDateTime getHoraPC() {
        return horaPC;
    }

    public void setHoraPC(LocalDateTime horaPC) {
        this.horaPC = horaPC;
    }

    public int getNumeroUnico() {
        return numeroUnico;
    }

    public void setNumeroUnico(int numeroUnico) {
        this.numeroUnico = numeroUnico;
    }

    public int getCodigoCancion() {
        return codigoCancion;
    }

    public void setCodigoCancion(int codigoCancion) {
        this.codigoCancion = codigoCancion;
    }

    public int getCodigoPlaylist() {
        return codigoPlaylist;
    }

    public void setCodigoPlaylist(int codigoPlaylist) {
        this.codigoPlaylist = codigoPlaylist;
    }
}
