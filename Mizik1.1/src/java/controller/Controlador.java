package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Favoritos;
import model.Playlist;
import modelDAO.FavoritosDAO;
import modelDAO.PlaylistDAO;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    
    String favoritos = "view/favoritos.jsp";
    String add = "view/addFavoritos.jsp";
    String addPlaylist = "view/addPlaylist.jsp";
    String listarPlaylist = "view/listarPlaylist.jsp";
    Favoritos nuevoFav = new Favoritos();
    FavoritosDAO nuevoFavDAO = new FavoritosDAO();
    Playlist nuevaPlaylist = new Playlist();
    PlaylistDAO nuevaPlaylistDAO = new PlaylistDAO();
    
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
        if (action.equalsIgnoreCase("favoritos")){
            acceso = favoritos;
        }else if(action.equalsIgnoreCase("add")){
            acceso = add;
        }else if(action.equalsIgnoreCase("Agregar")){
                int cantidadCanciones = parseInt(request.getParameter("txtCantidadCanciones"));
                String duracionTotal = request.getParameter("txtDuracionTotal");
                int cantidadArtistas = parseInt(request.getParameter("txtCantidadArtistas"));
                int codigoUsario = parseInt(request.getParameter("txtCodigoUsario"));
                int codigoCancion = parseInt(request.getParameter("txtCodigoCancion"));
                nuevoFav.setCantidadCanciones(cantidadCanciones);
                nuevoFav.setDuracionTotal(duracionTotal);
                nuevoFav.setCantidadArtistas(cantidadArtistas);
                nuevoFav.setCodigoUsario(codigoUsario);
                nuevoFav.setCodigoCancion(codigoCancion);
                nuevoFavDAO.agregarFavoritos(nuevoFav);
                acceso = favoritos;
        }
        
        if (action.equalsIgnoreCase("Playlist")) {
            acceso = listarPlaylist;
        } else if (action.equalsIgnoreCase("addPlaylist")) {
            acceso = addPlaylist;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String nombrePlaylist = request.getParameter("txtNombrePlaylist");
            String descripcionPlaylist = request.getParameter("txtDescripcionPlaylist");
            int cantidadCanciones = Integer.parseInt(request.getParameter("txtCantidadCanciones"));
            int codigoUsuario = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
            nuevaPlaylist.setNombrePlaylist(nombrePlaylist);
            nuevaPlaylist.setDescricionPlaylist(descripcionPlaylist);
            nuevaPlaylist.setCantidadCanciones(cantidadCanciones);
            nuevaPlaylist.setCodigoUsuario(codigoUsuario);
            nuevaPlaylistDAO.agregarPlaylist(nuevaPlaylist);
        }
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
