//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Mixes;
import model.MixeshasCanciones;

public interface CRUDMixes {
    public boolean eliminarMixes(int id);
    public List<Mixes> listarMixes();
    public Mixes buscarMixes(int id);
    public List<MixeshasCanciones> obtenerCancionesDeMix(int mixId);
}
