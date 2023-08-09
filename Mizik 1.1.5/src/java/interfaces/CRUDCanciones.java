//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Canciones;

public interface CRUDCanciones {
    public List<Canciones> listarCanciones();
    public Canciones buscarCancion(int id);
    public boolean eliminarCancion(int id);
}
