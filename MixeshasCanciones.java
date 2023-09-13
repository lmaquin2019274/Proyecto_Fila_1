//@author lmaquin2019274

package model;

import java.time.LocalDateTime;
import java.util.Date;

public class MixeshasCanciones {
    
    private int codigoMixeshasCanciones;
    private Date fechaMC;
    private LocalDateTime horaMC;
    private int numeroUnico;
    private int codigoCancion;
    private int codigoMix;

    public MixeshasCanciones() {
    }

    public MixeshasCanciones(int codigoMixeshasCanciones, Date fechaMC, LocalDateTime horaMC, int numeroUnico, int codigoCancion, int codigoMix) {
        this.codigoMixeshasCanciones = codigoMixeshasCanciones;
        this.fechaMC = fechaMC;
        this.horaMC = horaMC;
        this.numeroUnico = numeroUnico;
        this.codigoCancion = codigoCancion;
        this.codigoMix = codigoMix;
    }

    public int getCodigoMixeshasCanciones() {
        return codigoMixeshasCanciones;
    }

    public void setCodigoMixeshasCanciones(int codigoMixeshasCanciones) {
        this.codigoMixeshasCanciones = codigoMixeshasCanciones;
    }

    public Date getFechaMC() {
        return fechaMC;
    }

    public void setFechaMC(Date fechaMC) {
        this.fechaMC = fechaMC;
    }

    public LocalDateTime getHoraMC() {
        return horaMC;
    }

    public void setHoraMC(LocalDateTime horaMC) {
        this.horaMC = horaMC;
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

    public int getCodigoMix() {
        return codigoMix;
    }

    public void setCodigoMix(int codigoMix) {
        this.codigoMix = codigoMix;
    }
    
    
}
