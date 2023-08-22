//@author iiboy2022099

package interfaces;

import java.util.List;
import model.Artistas;
import model.Canciones;

public interface CRUDArtista {
    public List<Artistas> listarArtistas();
    public Artistas buscarArtista(int id);
    public boolean eliminarArtista(int id);
    public List<Canciones> listarCanciones(int id);
}
