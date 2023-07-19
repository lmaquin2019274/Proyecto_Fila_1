//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.HistorialBusqueda;

public interface CRUDHistorialBusqueda {
    public boolean agregarHistorialBusqueda(HistorialBusqueda historialBusqueda);
    public boolean eliminarHistorialBusqueda(int id);
    public List<HistorialBusqueda> listarHistorialBusqueda();
    public HistorialBusqueda buscarHistorialBusqueda(int id);
}
