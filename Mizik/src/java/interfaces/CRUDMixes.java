//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Mixes;

public interface CRUDMixes {
    public boolean eliminarMixes(int id);
    public List<Mixes> listarMixes();
    public Mixes buscarMixes(int id);
}
