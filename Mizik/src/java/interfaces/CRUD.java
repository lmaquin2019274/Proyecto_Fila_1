package interfaces;

import java.util.List;
import model.Artistas;
// importar todos los model

public interface CRUD {
    
    public List listar();
    public Artistas list (int id);
    public boolean eliminar (int id);
    
}
