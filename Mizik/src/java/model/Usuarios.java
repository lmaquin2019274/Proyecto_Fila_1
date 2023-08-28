//@author lmaquin2019274
package model;

import java.io.InputStream;

public class Usuarios {

    private int CodigoUsuario;
    private String nombreCompleto;
    private String usuario;
    private String correoUsuario;
    private String claveUsuario;
    private InputStream fotoPerfil;

    public Usuarios() {
    }

    public Usuarios(int CodigoUsuario, String nombreCompleto, String usuario, String correoUsuario, String claveUsuario, InputStream fotoPerfil) {
        this.CodigoUsuario = CodigoUsuario;
        this.nombreCompleto = nombreCompleto;
        this.usuario = usuario;
        this.correoUsuario = correoUsuario;
        this.claveUsuario = claveUsuario;
        this.fotoPerfil = fotoPerfil;
    }

    public int getCodigoUsuario() {
        return CodigoUsuario;
    }

    public void setCodigoUsuario(int CodigoUsuario) {
        this.CodigoUsuario = CodigoUsuario;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCorreoUsuario() {
        return correoUsuario;
    }

    public void setCorreoUsuario(String correoUsuario) {
        this.correoUsuario = correoUsuario;
    }

    public String getClaveUsuario() {
        return claveUsuario;
    }

    public void setClaveUsuario(String claveUsuario) {
        this.claveUsuario = claveUsuario;
    }

    public InputStream getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(InputStream fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    @Override
    public String toString() {
        return "Usuarios{" + "CodigoUsuario=" + CodigoUsuario + ", nombreCompleto=" + nombreCompleto + ", usuario=" + usuario + ", correoUsuario=" + correoUsuario + ", claveUsuario=" + claveUsuario + ", fotoPerfil=" + fotoPerfil + '}';
    }

}
