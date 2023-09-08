//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Album;
import model.Canciones;

public interface CRUDAlbum {
    public List<Album> listarAlbumes();
    public Album buscarAlbum(int id);
    public Album buscarAlbumes(int id);
    public boolean eliminarAlbum(int id);
    public List<Canciones> listarCanciones(int id);
}
