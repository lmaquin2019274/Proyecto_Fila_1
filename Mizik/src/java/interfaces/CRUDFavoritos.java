//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Canciones;
import model.Favoritos;

public interface CRUDFavoritos {
    public boolean agregarFavoritos(int idUsuario, int idCancion);
    public boolean eliminarFavoritos(int idCancion, int idUser);
    public List<Canciones> listarFavoritos(int codigoUsuario);
    public Favoritos buscarFavoritos(int idCancion, int idUsuario);
}
