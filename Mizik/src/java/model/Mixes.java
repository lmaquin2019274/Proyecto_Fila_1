//@author lmaquin2019274

package model;

public class Mixes {
    
    private int codigoMix;
    private String nombreMix;
    private String descripcionMix;
    private int cantidadCanciones;
    private int codigoGenero;
    private int codigoCancion;

    public Mixes() {
    }

    public Mixes(int codigoMix, String nombreMix, String descripcionMix, int cantidadCanciones, int codigoGenero, int codigoCancion) {
        this.codigoMix = codigoMix;
        this.nombreMix = nombreMix;
        this.descripcionMix = descripcionMix;
        this.cantidadCanciones = cantidadCanciones;
        this.codigoGenero = codigoGenero;
        this.codigoCancion = codigoCancion;
    }

    public int getCodigoMix() {
        return codigoMix;
    }

    public void setCodigoMix(int codigoMix) {
        this.codigoMix = codigoMix;
    }

    public String getNombreMix() {
        return nombreMix;
    }

    public void setNombreMix(String nombreMix) {
        this.nombreMix = nombreMix;
    }

    public String getDescripcionMix() {
        return descripcionMix;
    }

    public void setDescripcionMix(String descripcionMix) {
        this.descripcionMix = descripcionMix;
    }

    public int getCantidadCanciones() {
        return cantidadCanciones;
    }

    public void setCantidadCanciones(int cantidadCanciones) {
        this.cantidadCanciones = cantidadCanciones;
    }

    public int getCodigoGenero() {
        return codigoGenero;
    }

    public void setCodigoGenero(int codigoGenero) {
        this.codigoGenero = codigoGenero;
    }

    public int getCodigoCancion() {
        return codigoCancion;
    }

    public void setCodigoCancion(int codigoCancion) {
        this.codigoCancion = codigoCancion;
    }
}
