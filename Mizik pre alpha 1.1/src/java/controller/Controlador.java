package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Favoritos;
import model.Playlist;
import model.Canciones;
import model.PlaylisthasCanciones;
import model.Usuarios;
import modelDAO.CancionesDAO;
import modelDAO.FavoritosDAO;
import modelDAO.PlaylistDAO;
import modelDAO.UsuariosDAO;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    
    //Principal
    String favoritos = "View/favoritos.jsp";
    String playlists = "View/listarPlaylist.jsp";
    String playlist = "View/playlist.jsp";
    String mixes = "View/mixes.jsp";
    String biblioteca = "View/biblioteca.jsp";
    String config = "View/config.jsp";
    
    //Biblioteca
    String canciones ="View/canciones.jsp";
    String artistas = "View/listarArtistas.jsp";
    String album = "View/albumListar.jsp";
    String genero = "View/generoListar.jsp";
    String mixhas = "View/MixeshasCanciones.jsp";
    String playlisthas = "View/listPlaylisthasCanciones.jsp";
    
    //Configuración
    String listarUsuarios = "View/listarUsuarios.jsp";
    String HistorialReproduccion = "View/historialReproduccion.jsp";
    String historialBusqueda = "View/historialBusqueda.jsp";
    String login = "View/login.jsp";
            
    //Add
    String addFavoritos = "View/addFavoritos.jsp";
    String addUsuarios = "View/addUsuarios.jsp";
    
    Usuarios nuevoUsuario = new Usuarios();
    UsuariosDAO nuevoUsurioDAO = new UsuariosDAO();
    Favoritos nuevoFav = new Favoritos();
    FavoritosDAO nuevoFavDAO = new FavoritosDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if(menu.equals("Principal")){
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        
        //Principal
        if (action.equalsIgnoreCase("favoritos")){
            acceso = favoritos;
        }else if(action.equalsIgnoreCase("biblioteca")){
            acceso = biblioteca;
        }else if(action.equalsIgnoreCase("playlists")){
            acceso = playlists;
        }else if(action.equalsIgnoreCase("config")){
            acceso = config;
        }else if(action.equalsIgnoreCase("mixes")){
            acceso = mixes;
        }else if (action.equalsIgnoreCase("playlist")) {
            int playlistId = Integer.parseInt(request.getParameter("id"));
            PlaylistDAO playlistDAO = new PlaylistDAO();
            Playlist playlist = playlistDAO.buscarPlaylist(playlistId);
            List<PlaylisthasCanciones> listaPlaylisthasCanciones = playlistDAO.obtenerCancionesDePlaylist(playlistId);

            CancionesDAO cancionesDAO = new CancionesDAO();
            List<Canciones> listaCanciones = new ArrayList<>();

            Set<Integer> cancionesSet = new HashSet<>();
            for (PlaylisthasCanciones phc : listaPlaylisthasCanciones) {
                int codigoCancion = phc.getCodigoCancion();
                if (!cancionesSet.contains(codigoCancion)) {
                    Canciones cancion = cancionesDAO.buscarCancion(codigoCancion);
                    listaCanciones.add(cancion);
                    cancionesSet.add(codigoCancion);
                }
            }

            request.setAttribute("playlist", playlist);
            request.setAttribute("canciones", listaCanciones);

            String playlistJsp = "View/playlist.jsp";
            acceso = playlistJsp;
        }

        //Biblioteca
        else if(action.equalsIgnoreCase("canciones")){
            acceso = canciones;
        }else if(action.equalsIgnoreCase("album")){
            acceso = album;
        }else if(action.equalsIgnoreCase("artistas")){
            acceso = artistas;
        }else if(action.equalsIgnoreCase("genero")){
            acceso = genero;
        }else if(action.equalsIgnoreCase("mixhas")){
            acceso = mixhas;
        }else if(action.equalsIgnoreCase("playlisthas")){
            acceso = playlisthas;
        }
        //Configuración
        else if (action.equalsIgnoreCase("listarUsuarios")){
            acceso = listarUsuarios;
        }else if(action.equalsIgnoreCase("HistorialReproduccion")){
            acceso = HistorialReproduccion;
        }else if(action.equalsIgnoreCase("historialBusqueda")){
            acceso = historialBusqueda;
        }else if(action.equalsIgnoreCase("login")){
            acceso = login;
        }
        
        //Add
        else if(action.equalsIgnoreCase("addFavoritos")){
            acceso = addFavoritos;
        }else if (action.equalsIgnoreCase("addUsuarios")){
            acceso = addUsuarios;
        }
        
        request.getRequestDispatcher(acceso).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
