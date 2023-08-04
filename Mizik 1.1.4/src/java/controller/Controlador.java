package controller;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javazoom.jl.player.Player;
import model.Favoritos;
import model.Playlist;
import model.Canciones;
import model.Login;
import model.Mixes;
import model.MixeshasCanciones;
import model.PlaylisthasCanciones;
import model.Usuarios;
import modelDAO.CancionesDAO;
import modelDAO.FavoritosDAO;
import modelDAO.LoginDAO;
import modelDAO.MixesDAO;
import modelDAO.PlaylistDAO;
import modelDAO.PlaylisthasCancionesDAO;
import modelDAO.UsuariosDAO;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    String index = "index.jsp";
    String principal = "Principal.jsp";

    //Principal
    String favoritos = "View/favoritos.jsp";
    String playlists = "View/listarPlaylist.jsp";
    String playlist = "View/playlist.jsp";
    String mixes = "View/mixes.jsp";
    String biblioteca = "View/biblioteca.jsp";
    String config = "View/config.jsp";

    //Biblioteca
    String canciones = "View/canciones.jsp";
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
    String addFavoritos = "View/Add/addFavoritos.jsp";
    String addUsuario = "View/Add/addUsuario.jsp";
    String addUsuarioD = "View/Add/addUsuarioD.jsp";
    String addPlaylist = "View/Add/addPlaylist.jsp";
    String addCancionesPlaylist = "View/Add/addCancionesPlaylist.jsp";

    Usuarios nuevoUsuario = new Usuarios();
    PlaylistDAO nuevaPlaylistDAO = new PlaylistDAO();
    Favoritos nuevoFav = new Favoritos();
    FavoritosDAO nuevoFavDAO = new FavoritosDAO();
    UsuariosDAO nuevoUsuarioDAO = new UsuariosDAO();
    PlaylisthasCancionesDAO playhasCancionesDAO = new PlaylisthasCancionesDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("principal")) {
            acceso = principal;
        } else if (action.equalsIgnoreCase("index")) {
            acceso = index;

            //Principal
        } else if (action.equalsIgnoreCase("favoritos")) {
            acceso = favoritos;
        } else if (action.equalsIgnoreCase("biblioteca")) {
            acceso = biblioteca;
        } else if (action.equalsIgnoreCase("playlists")) {
            acceso = playlists;
        } else if (action.equalsIgnoreCase("config")) {
            acceso = config;
        } else if (action.equalsIgnoreCase("mixes")) {
            acceso = mixes;

            // Playlists y mixes
        } else if (action.equalsIgnoreCase("playlist")) {
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
        } else if (action.equalsIgnoreCase("mix")) {
            int mixId = Integer.parseInt(request.getParameter("id"));
            MixesDAO mixDAO = new MixesDAO();
            Mixes mix = mixDAO.buscarMixes(mixId);
            List<MixeshasCanciones> listaMixeshasCanciones = mixDAO.obtenerCancionesDeMix(mixId);

            CancionesDAO cancionesDAO = new CancionesDAO();
            List<Canciones> listaCanciones = new ArrayList<>();

            Set<Integer> cancionesSet = new HashSet<>();
            for (MixeshasCanciones mhc : listaMixeshasCanciones) {
                int codigoCancion = mhc.getCodigoCancion();
                if (!cancionesSet.contains(codigoCancion)) {
                    Canciones cancion = cancionesDAO.buscarCancion(codigoCancion);
                    listaCanciones.add(cancion);
                    cancionesSet.add(codigoCancion);
                }
            }

            request.setAttribute("mix", mix);
            request.setAttribute("canciones", listaCanciones);

            String mixJsp = "View/mix.jsp";
            acceso = mixJsp;

        } else if (action.equalsIgnoreCase("reproducir")) {
            System.out.println("Aquí");

        } //Biblioteca
        else if (action.equalsIgnoreCase("canciones")) {
            acceso = canciones;
        } else if (action.equalsIgnoreCase("album")) {
            acceso = album;
        } else if (action.equalsIgnoreCase("artistas")) {
            acceso = artistas;
        } else if (action.equalsIgnoreCase("genero")) {
            acceso = genero;
        } else if (action.equalsIgnoreCase("mixhas")) {
            acceso = mixhas;
        } else if (action.equalsIgnoreCase("playlisthas")) {
            acceso = playlisthas;
        } //Configuración
        else if (action.equalsIgnoreCase("listarUsuarios")) {
            acceso = listarUsuarios;
        } else if (action.equalsIgnoreCase("HistorialReproduccion")) {
            acceso = HistorialReproduccion;
        } else if (action.equalsIgnoreCase("historialBusqueda")) {
            acceso = historialBusqueda;
        } else if (action.equalsIgnoreCase("login")) {
            acceso = login;
        } //Add
        else if (action.equalsIgnoreCase("addFavoritos")) {
            acceso = addFavoritos;
        } else if (action.equalsIgnoreCase("addUsuario")) {
            acceso = addUsuario;
        } else if (action.equalsIgnoreCase("addUsuarioD")) {
            acceso = addUsuarioD;
        } else if (action.equalsIgnoreCase("addPlaylist")) {
            acceso = addPlaylist;
        } else if (action.equalsIgnoreCase("addCancionesPlaylist")) {
            // Obtener la información de la playlist y agregarla como atributo en la solicitud
            int playlistId = Integer.parseInt(request.getParameter("playlistId"));
            PlaylistDAO playlistDAO = new PlaylistDAO();
            Playlist playlist = playlistDAO.buscarPlaylist(playlistId);
            request.setAttribute("playlist", playlist);
            acceso = addCancionesPlaylist;
        }

        System.out.println("Este es acceso > " + acceso);
        if (!acceso.isEmpty()) {
            System.out.println("Entro");
            request.getRequestDispatcher(acceso).forward(request, response);
        } else {
            request.getRequestDispatcher(acceso).forward(request, response);
        }
    }

    private void agregarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreCompleto = request.getParameter("txtNombre");
        String usuario = request.getParameter("txtUsuario");
        String correoUsuario = request.getParameter("txtCorreo");
        String claveUsuario = request.getParameter("txtClave");
        Usuarios nuevoUsuario = new Usuarios();
        nuevoUsuario.setNombreCompleto(nombreCompleto);
        nuevoUsuario.setUsuario(usuario);
        nuevoUsuario.setCorreoUsuario(correoUsuario);
        nuevoUsuario.setClaveUsuario(claveUsuario);
        boolean exito = nuevoUsuarioDAO.agregarUsuario(nuevoUsuario);
        if (exito) {
            response.sendRedirect("Controlador?menu=Principal&accion=listarUsuarios");
            System.out.println("Se agregó el usuario");
        } else {
            System.out.println("Error al agregar usuario");
            response.sendRedirect("error.jsp");
        }
    }

    private void agregarUsuarioD(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreCompleto = request.getParameter("txtNombre");
        String usuario = request.getParameter("txtUsuario");
        String correoUsuario = request.getParameter("txtCorreo");
        String claveUsuario = request.getParameter("txtClave");
        Usuarios nuevoUsuario = new Usuarios();
        nuevoUsuario.setNombreCompleto(nombreCompleto);
        nuevoUsuario.setUsuario(usuario);
        nuevoUsuario.setCorreoUsuario(correoUsuario);
        nuevoUsuario.setClaveUsuario(claveUsuario);
        boolean exito = nuevoUsuarioDAO.agregarUsuario(nuevoUsuario);
        if (exito) {
            response.sendRedirect("Controlador?menu=Principal&accion=index");
            System.out.println("Se agregó el usuario");
        } else {
            System.out.println("Error al agregar usuario");
            response.sendRedirect("error.jsp");
        }
    }

    private void agregarPlaylist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombrePlaylist = request.getParameter("txtNombrePlaylist");
        String descripcionPlaylist = request.getParameter("txtDescripcionPlaylist");
        int cantidadCanciones = 1;
        int codigoUsuario = (int) request.getSession().getAttribute("codigoUsuario");
        Playlist nuevaPlaylist = new Playlist();
        nuevaPlaylist.setNombrePlaylist(nombrePlaylist);
        nuevaPlaylist.setDescripcionPlaylist(descripcionPlaylist);
        nuevaPlaylist.setCantidadCanciones(cantidadCanciones);
        nuevaPlaylist.setCodigoUsuario(codigoUsuario);
        boolean exito = nuevaPlaylistDAO.agregarPlaylist(nuevaPlaylist);
        if (exito) {
            response.sendRedirect("Controlador?accion=playlists");
            System.out.println("Se agregó la playlist");
        } else {
            System.out.println("Error al agregar playlist");
            response.sendRedirect("error.jsp");
        }

    }

    private void agregarCancionPlaylist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int playlistId = Integer.parseInt(request.getParameter("playlistId"));
        int cancionId = Integer.parseInt(request.getParameter("cancionId"));
        PlaylisthasCanciones playhasCanciones = new PlaylisthasCanciones();
        playhasCanciones.setCodigoPlaylist(playlistId);
        playhasCanciones.setCodigoCancion(cancionId);
        boolean exito = playhasCancionesDAO.agregarPlaylisthasCanciones(playhasCanciones);
        if (exito) {
            response.sendRedirect("Controlador?accion=playlist&id=" + playlistId);
            System.out.println("Se agregó la canción");
        } else {
            System.out.println("Error al agregar canción");
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        String raw = request.getParameter("raw");

        System.out.println("Menu: " + menu); //menu actual
        System.out.println("Accion: " + accion);//accion actual
        System.out.println("raw: "+raw);
        if (menu != null && accion != null) {
            if (menu.equalsIgnoreCase("Principal")) {
                if (accion.equalsIgnoreCase("Login")) {
                    String usuario = request.getParameter("txtUser");
                    String clave = request.getParameter("txtPass");

                    System.out.println("Usuario: " + usuario); //usuario actual
                    System.out.println("Clave: " + clave); //Clave del usuario actual

                    UsuariosDAO usuariosDAO = new UsuariosDAO();
                    Usuarios usuarioAutenticado = usuariosDAO.validar(usuario, clave);

                    if (usuarioAutenticado != null) {
                        int codigoUsuarioAutenticado = usuarioAutenticado.getCodigoUsuario();
                        Login nuevoLogin = new Login();
                        nuevoLogin.setEstadoSesion(true); // Sesión iniciada
                        nuevoLogin.setCodigoUsuario(codigoUsuarioAutenticado);

                        LoginDAO loginDAO = new LoginDAO(); // Se agrega el registro de sesión
                        loginDAO.agregarLogin(nuevoLogin);

                        request.getSession().setAttribute("codigoUsuario", codigoUsuarioAutenticado);
                        response.sendRedirect("Principal.jsp");
                        return;
                    } else {
                        response.sendRedirect("error.jsp");
                        return;
                    }
                }
            } else if (menu != null && menu.equalsIgnoreCase("Add")) {
                if (accion != null && accion.equalsIgnoreCase("AgregarUsuario")) {
                    agregarUsuario(request, response);
                    return;
                } else if (accion != null && accion.equalsIgnoreCase("AgregarUsuarioD")) {
                    agregarUsuarioD(request, response);
                    return;
                } else if (accion != null && accion.equalsIgnoreCase("AgregarPlaylist")) {
                    agregarPlaylist(request, response);
                    return;
                } else if (accion != null && accion.equalsIgnoreCase("agregarCancionPlaylist")) {
                    int playlistId = Integer.parseInt(request.getParameter("playlistId"));
                    System.out.println("Id de la playlist:" + playlistId);

                    PlaylistDAO playlistDAO = new PlaylistDAO();
                    Playlist playlist = playlistDAO.buscarPlaylist(playlistId);
                    request.setAttribute("playlist", playlist);

                    int cancionId = Integer.parseInt(request.getParameter("cancionId"));
                    System.out.println("Id de la canción:" + cancionId);

                    CancionesDAO cancionDao = new CancionesDAO();
                    Canciones cancion = cancionDao.buscarCancion(cancionId);
                    request.setAttribute("Mix", cancion);

                    agregarCancionPlaylist(request, response);
                    return;
                }
            }
        } else {
            response.sendRedirect("error.jsp");
        }

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
