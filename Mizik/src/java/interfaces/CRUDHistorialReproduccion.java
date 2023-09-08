//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.HistorialReproduccion;

public interface CRUDHistorialReproduccion {
    public boolean agregarHistorialReproduccion(int userId, int songId);
    public boolean eliminarHistorialReproduccion(int id);
    public List<HistorialReproduccion> listarHistorialReproduccion(int codigoUsuario);
    public HistorialReproduccion buscarHistorialReproduccion(int id);
}
