//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.PlaylisthasCanciones;

public interface CRUDPlaylisthasCanciones {
    public boolean agregarPlaylisthasCanciones(PlaylisthasCanciones playlisthasCanciones);
    public boolean eliminarPlaylisthasCanciones(int id);
    public List<PlaylisthasCanciones> listarPlaylisthasCanciones();
    public PlaylisthasCanciones buscarPlaylisthasCanciones(int id);
}
