//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Canciones;
import model.Favoritos;

public interface CRUDFavoritos {
    public boolean agregarFavoritos(Favoritos favoritos);
    public boolean eliminarFavoritos(int id);
    public List<Canciones> listarFavoritos(int codigoUsuario);
    public Favoritos buscarFavoritos(int id);
}
