//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Generos;

public interface CRUDGeneros {
    public List<Generos> listarGeneros();
    public Generos buscarGenero(int id);
    public boolean eliminarGenero(int id);
}
