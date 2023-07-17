//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Album;

public interface CRUDAlbum {
    public List<Album> listarAlbumes();
    public Album buscarAlbum(int id);
    public boolean eliminarAlbum(int id);
}
