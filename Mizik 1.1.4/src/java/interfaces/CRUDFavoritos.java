//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Favoritos;

public interface CRUDFavoritos {
    public boolean agregarFavoritos(Favoritos favoritos);
    public boolean eliminarFavoritos(int id);
    public List<Favoritos> listarFavoritos();
    public Favoritos buscarFavoritos(int id);
}
