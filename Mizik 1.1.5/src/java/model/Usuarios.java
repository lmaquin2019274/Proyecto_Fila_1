//@author lmaquin2019274

package model;

public class Usuarios {
    
    private int CodigoUsuario;
    private String nombreCompleto;
    private String usuario;
    private String correoUsuario;
    private String claveUsuario;

    public Usuarios() {
    }

    public Usuarios(int CodigoUsuario, String nombreCompleto, String usuario, String correoUsuario, String claveUsuario) {
        this.CodigoUsuario = CodigoUsuario;
        this.nombreCompleto = nombreCompleto;
        this.usuario = usuario;
        this.correoUsuario = correoUsuario;
        this.claveUsuario = claveUsuario;
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

    @Override
    public String toString() {
        return "Usuarios{" + "CodigoUsuario=" + CodigoUsuario + ", nombreCompleto=" + nombreCompleto + ", usuario=" + usuario + ", correoUsuario=" + correoUsuario + ", claveUsuario=" + claveUsuario + '}';
    }
    
    
}
