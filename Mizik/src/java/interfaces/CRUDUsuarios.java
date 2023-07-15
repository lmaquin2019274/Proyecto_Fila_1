//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Usuarios;

public interface CRUDUsuarios {
    public boolean agregarUsuario(Usuarios usuario);
    public boolean eliminarUsuario(int id);
    public List<Usuarios> listarUsuarios();
    public boolean editarUsuario(Usuarios usuario);
    public Usuarios buscarUsuario(int id);
}
