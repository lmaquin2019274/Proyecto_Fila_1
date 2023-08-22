//@author lmaquin2019274

package model;

public class Generos {
    
    private int codigoGenero;
    private String nombreGenero;
    private String origen;
    private String descripcion;

    public Generos() {
    }

    public Generos(int codigoGenero, String nombreGenero, String origen, String descripcion) {
        this.codigoGenero = codigoGenero;
        this.nombreGenero = nombreGenero;
        this.origen = origen;
        this.descripcion = descripcion;
    }

    public int getCodigoGenero() {
        return codigoGenero;
    }

    public void setCodigoGenero(int codigoGenero) {
        this.codigoGenero = codigoGenero;
    }

    public String getNombreGenero() {
        return nombreGenero;
    }

    public void setNombreGenero(String nombreGenero) {
        this.nombreGenero = nombreGenero;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
