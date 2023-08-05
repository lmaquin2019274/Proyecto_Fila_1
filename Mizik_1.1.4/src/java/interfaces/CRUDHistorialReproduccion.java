//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.HistorialReproduccion;

public interface CRUDHistorialReproduccion {
    public boolean agregarHistorialReproduccion(HistorialReproduccion historialReproduccion);
    public boolean eliminarHistorialReproduccion(int id);
    public List<HistorialReproduccion> listarHistorialReproduccion();
    public HistorialReproduccion buscarHistorialReproduccion(int id);
}
