//@author lmaquin2019274

package model;

public class Favoritos {
    
    private int codigoFav;
    private int cantidadCanciones;
    private String duracionTotal;
    private int cantidadArtistas;
    private int codigoUsario;
    private int codigoCancion;

    public Favoritos() {
    }

    public Favoritos(int codigoFav, int cantidadCanciones, String duracionTotal, int cantidadArtistas, int codigoUsario, int codigoCancion) {
        this.codigoFav = codigoFav;
        this.cantidadCanciones = cantidadCanciones;
        this.duracionTotal = duracionTotal;
        this.cantidadArtistas = cantidadArtistas;
        this.codigoUsario = codigoUsario;
        this.codigoCancion = codigoCancion;
    }

    public int getCodigoFav() {
        return codigoFav;
    }

    public void setCodigoFav(int codigoFav) {
        this.codigoFav = codigoFav;
    }

    public int getCantidadCanciones() {
        return cantidadCanciones;
    }

    public void setCantidadCanciones(int cantidadCanciones) {
        this.cantidadCanciones = cantidadCanciones;
    }

    public String getDuracionTotal() {
        return duracionTotal;
    }

    public void setDuracionTotal(String duracionTotal) {
        this.duracionTotal = duracionTotal;
    }

    public int getCantidadArtistas() {
        return cantidadArtistas;
    }

    public void setCantidadArtistas(int cantidadArtistas) {
        this.cantidadArtistas = cantidadArtistas;
    }

    public int getCodigoUsario() {
        return codigoUsario;
    }

    public void setCodigoUsario(int codigoUsario) {
        this.codigoUsario = codigoUsario;
    }

    public int getCodigoCancion() {
        return codigoCancion;
    }

    public void setCodigoCancion(int codigoCancion) {
        this.codigoCancion = codigoCancion;
    }

    
}
