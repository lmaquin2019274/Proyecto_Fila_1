//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.MixeshasCanciones;

public interface CRUDMixesHasCanciones {
    public boolean agregarMixeshasCanciones(MixeshasCanciones mixeshasCanciones);
    public boolean eliminarMixeshasCanciones(int id);
    public List<MixeshasCanciones> listarMixeshasCanciones();
    public MixeshasCanciones buscarMixeshasCanciones(int id);
}
