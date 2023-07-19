//@author iiboy2022099

package interfaces;

import java.util.List;
import model.Artistas;

public interface CRUDArtista {
    public List<Artistas> listarArtistas();
    public Artistas buscarArtista(int id);
    public boolean eliminarArtista(int id);
}
