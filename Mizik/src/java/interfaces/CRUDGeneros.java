//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Canciones;
import model.Generos;

public interface CRUDGeneros {
    public List<Generos> listarGeneros();
    public Generos buscarGenero(int id);
    public Generos buscarGeneros(int id);
    public boolean eliminarGenero(int id);
    public List<Canciones> listarCanciones(int id);
}
