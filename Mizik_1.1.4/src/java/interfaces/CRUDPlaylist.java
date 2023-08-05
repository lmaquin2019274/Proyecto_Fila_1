//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Playlist;
import model.PlaylisthasCanciones;

public interface CRUDPlaylist {
    public boolean agregarPlaylist(Playlist playlist);
    public boolean eliminarPlaylist(int id);
    public boolean modificarPlaylist(Playlist playlist);
    public List<Playlist> listarPlaylists();
    public Playlist buscarPlaylist(int id);
    public List<PlaylisthasCanciones> obtenerCancionesDePlaylist(int playlistId);
}
