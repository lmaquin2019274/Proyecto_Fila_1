package controller;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.net.URL;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javazoom.jl.player.Player;
import model.Album;
import model.Artistas;
import model.Favoritos;
import model.Playlist;
import model.Canciones;
import model.Generos;
import model.HistorialBusqueda;
import model.HistorialReproduccion;
import model.Login;
import model.Mixes;
import model.MixeshasCanciones;
import model.PlaylisthasCanciones;
import model.Usuarios;
import modelDAO.AlbumDAO;
import modelDAO.ArtistasDAO;
import modelDAO.CancionesDAO;
import modelDAO.FavoritosDAO;
import modelDAO.GeneroDAO;
import modelDAO.HistorialBusquedaDAO;
import modelDAO.HistorialReproduccionDAO;
import modelDAO.LoginDAO;
import modelDAO.MixesDAO;
import modelDAO.PlaylistDAO;
import modelDAO.PlaylisthasCancionesDAO;
import modelDAO.UsuariosDAO;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    String index = "index.jsp";
    String principal = "Principal.jsp";
    String cancion = "View/cancion.jsp";

    //Principal
    String favoritos = "View/favoritos.jsp";
    String playlists = "View/listarPlaylist.jsp";
    String playlist = "View/playlist.jsp";
    String mixes = "View/mixes.jsp";
    String mix = "View/mix.jsp";
    String biblioteca = "View/biblioteca.jsp";
    String config = "View/config.jsp";

    //Biblioteca
    String canciones = "View/canciones.jsp";
    String artistas = "View/listarArtistas.jsp";
    String artista = "View/Canciones/artista.jsp";
    String albumes = "View/albumListar.jsp";
    String genero = "View/generoListar.jsp";
    String mixhas = "View/MixeshasCanciones.jsp";
    String playlisthas = "View/listPlaylisthasCanciones.jsp";

    //Configuración
    String listarUsuarios = "View/listarUsuarios.jsp";
    String HistorialReproduccion = "View/historialReproduccion.jsp";
    String historialBusqueda = "View/historialBusqueda.jsp";
    String login = "View/login.jsp";
    String expirado = "View/expirado.jsp";
    String configPerfil = "View/ConfigUsuario.jsp";

    //Add
    String addFavoritos = "View/Add/addFavoritos.jsp";
    String addUsuario = "View/Add/addUsuario.jsp";
    String addUsuarioD = "View/Add/addUsuarioD.jsp";
    String addPlaylist = "View/Add/addPlaylist.jsp";
    String addCancionesPlaylist = "View/Add/addCancionesPlaylist.jsp";
    
    ArtistasDAO artistaDAO = new ArtistasDAO();
    AlbumDAO albumDAO = new AlbumDAO();
    GeneroDAO generoDAO = new GeneroDAO();

    Usuarios nuevoUsuario = new Usuarios();
    UsuariosDAO nuevoUsuarioDAO = new UsuariosDAO();
    
    CancionesDAO cancionesDAO = new CancionesDAO();
    Canciones cancione = new Canciones();
    
    Playlist play = new Playlist();
    PlaylistDAO nuevaPlaylistDAO = new PlaylistDAO();
    
    PlaylisthasCanciones playc = new PlaylisthasCanciones();
    PlaylisthasCancionesDAO playcDAO = new PlaylisthasCancionesDAO();
    
    HistorialBusqueda hb = new HistorialBusqueda();
    HistorialBusquedaDAO hbDAO = new HistorialBusquedaDAO();
    
    HistorialReproduccion hr = new HistorialReproduccion();
    HistorialReproduccionDAO hrDAO = new HistorialReproduccionDAO();
    
    Favoritos nuevoFav = new Favoritos();
    FavoritosDAO nuevoFavDAO = new FavoritosDAO();
    
    static int codUsuario;

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
            
            UsuariosDAO usuario = new UsuariosDAO();
            boolean x = false;

            ResultSet rs = usuario.fijarImagen(codUsuario);

            try {
                if (rs.next()) {
                    InputStream i = rs.getBinaryStream("fotoPerfil");
                    if (i == null) {

                    } else {
                        x = true;
                        rs.beforeFirst();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (x == true) {
                try {
                    if (rs.next()) {
                        response.setContentType("image/png");
                        InputStream imageI = rs.getBinaryStream("fotoPerfil");
                        ByteArrayOutputStream byteArray = new ByteArrayOutputStream();
                        byte[] buffer = new byte[9096];
                        int bytesRead;
                        while ((bytesRead = imageI.read(buffer)) != -1) {
                            byteArray.write(buffer, 0, bytesRead);
                        }

                        request.setAttribute("imgUser", byteArray.toByteArray());

                        imageI.close();
                        byteArray.close();

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {

                response.setContentType("image/png");

                String imagePath = getServletContext().getRealPath("/img/usuario.png");

                try {

                    InputStream imageInputStream = new FileInputStream(imagePath);

                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[9096];
                    int bytesRead;
                    while ((bytesRead = imageInputStream.read(buffer)) != -1) {
                        byteArrayOutputStream.write(buffer, 0, bytesRead);
                    }

                    request.setAttribute("imgUser", byteArrayOutputStream.toByteArray());
                    imageInputStream.close();
                    byteArrayOutputStream.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            
            acceso = principal;
        } else if (action.equalsIgnoreCase("index")) {
            acceso = index;

            //Principal
        } else if (action.equalsIgnoreCase("favoritos")) {
            
            Object codigoUsuarioObj = request.getSession().getAttribute("codigoUsuario");
            int idUsuario = 0; // Valor predeterminado o manejo de error si no es posible obtener el código de usuario

            if (codigoUsuarioObj != null && codigoUsuarioObj instanceof Integer) {
                idUsuario = (int) codigoUsuarioObj;
            } else {
                request.getRequestDispatcher("View/expirado.jsp").forward(request, response);
            }
            
            List<Canciones> listaCancionesFavoritas = nuevoFavDAO.listarFavoritos(idUsuario);
            request.setAttribute("canciones", listaCancionesFavoritas);
            
            acceso = favoritos;
        } else if (action.equalsIgnoreCase("biblioteca")) {
            acceso = biblioteca;
        } else if (action.equalsIgnoreCase("playlists")) {
            Object codigoUsuarioObj = request.getSession().getAttribute("codigoUsuario");
            int idUsuario = 0; // Valor predeterminado o manejo de error si no es posible obtener el código de usuario

            if (codigoUsuarioObj != null && codigoUsuarioObj instanceof Integer) {
                idUsuario = (int) codigoUsuarioObj;
            } else {
                request.getRequestDispatcher("View/expirado.jsp").forward(request, response);
            }
            List<Playlist> playlists = nuevaPlaylistDAO.listarPlaylists(idUsuario);
            request.setAttribute("playlists", playlists);
            acceso = "View/listarPlaylist.jsp";
        } else if (action.equalsIgnoreCase("config")) {
            acceso = config;
        } else if (action.equalsIgnoreCase("mixes")) {
            
            acceso = mixes;

            // Playlists, mixes, artistas, álbumes y géneros
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
            System.out.println("playlist: "+playlist);
            System.out.println("canciones: "+listaCanciones);

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
            System.out.println("canciones: "+listaCanciones);
            
            String mixJsp = "View/mix.jsp";
            acceso = mixJsp;

        } else if (action.equalsIgnoreCase("artista")) {
            int codigoArtista = Integer.parseInt(request.getParameter("id"));
            Artistas artista = artistaDAO.buscarArtista(codigoArtista);
            
            CancionesDAO cancionesDAO = new CancionesDAO();
            List<Canciones> listaCanciones = artistaDAO.listarCanciones(codigoArtista);

            List<Canciones> nuevasCanciones = new ArrayList<>();
                for (Canciones can : listaCanciones) {
                    int codigoCancion = can.getCodigoCancion();
                    Canciones cancion = cancionesDAO.buscarCancion(codigoCancion);
                    nuevasCanciones.add(cancion);
                }
                listaCanciones.addAll(nuevasCanciones);
            
            request.setAttribute("artista", artista);
            request.setAttribute("canciones", listaCanciones);
            acceso = "View/Canciones/artista.jsp";
        } else if (action.equalsIgnoreCase("album")) {
            int codigoAlbum = Integer.parseInt(request.getParameter("id"));
            Album album = albumDAO.buscarAlbum(codigoAlbum);
            
            CancionesDAO cancionesDAO = new CancionesDAO();
            List<Canciones> listaCanciones = albumDAO.listarCanciones(codigoAlbum);

            List<Canciones> nuevasCanciones = new ArrayList<>();
                for (Canciones can : listaCanciones) {
                    int codigoCancion = can.getCodigoCancion();
                    Canciones cancion = cancionesDAO.buscarCancion(codigoCancion);
                    nuevasCanciones.add(cancion);
                }
                listaCanciones.addAll(nuevasCanciones);
            
            request.setAttribute("album", album);
            request.setAttribute("canciones", listaCanciones);
            acceso = "View/Canciones/album.jsp";
        } else if (action.equalsIgnoreCase("generoCancion")) {
            int codigoGenero = Integer.parseInt(request.getParameter("id"));
            Generos genero = generoDAO.buscarGenero(codigoGenero);
            
            CancionesDAO cancionesDAO = new CancionesDAO();
            List<Canciones> listaCanciones = albumDAO.listarCanciones(codigoGenero);

            List<Canciones> nuevasCanciones = new ArrayList<>();
                for (Canciones can : listaCanciones) {
                    int codigoCancion = can.getCodigoCancion();
                    Canciones cancion = cancionesDAO.buscarCancion(codigoCancion);
                    nuevasCanciones.add(cancion);
                }
                listaCanciones.addAll(nuevasCanciones);
            
            request.setAttribute("genero", genero);
            request.setAttribute("canciones", listaCanciones);
            acceso = "View/Canciones/genero.jsp";
        } else if (action.equalsIgnoreCase("reproducir")) {
            System.out.println("Aquí");

        } //Biblioteca
        else if (action.equalsIgnoreCase("canciones")) {
            acceso = canciones;
        } else if (action.equalsIgnoreCase("albumes")) {
            acceso = albumes;
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
            Object codigoUsuarioObj = request.getSession().getAttribute("codigoUsuario");
            int idUsuario = 0; // Valor predeterminado o manejo de error si no es posible obtener el código de usuario

            if (codigoUsuarioObj != null && codigoUsuarioObj instanceof Integer) {
                idUsuario = (int) codigoUsuarioObj;
            } else {
                request.getRequestDispatcher("View/expirado.jsp").forward(request, response);
            }
            List<HistorialReproduccion> historialReproduccion = hrDAO.listarHistorialReproduccion(idUsuario);
            request.setAttribute("historialReproduccion", historialReproduccion);
            acceso = "View/historialReproduccion.jsp";
        } else if (action.equalsIgnoreCase("historialBusqueda")) {
            acceso = historialBusqueda;
            Object codigoUsuarioObj = request.getSession().getAttribute("codigoUsuario");
            int idUsuario = 0; // Valor predeterminado o manejo de error si no es posible obtener el código de usuario

            if (codigoUsuarioObj != null && codigoUsuarioObj instanceof Integer) {
                idUsuario = (int) codigoUsuarioObj;
            } else {
                request.getRequestDispatcher("View/expirado.jsp").forward(request, response);
            }
            List<HistorialBusqueda> historialBusqueda = hbDAO.listarHistorialBusqueda(idUsuario);
            request.setAttribute("historialBusqueda", historialBusqueda);
            acceso = "View/historialBusqueda.jsp";
        } else if (action.equalsIgnoreCase("login")) {
            acceso = login;
        }else if (action.equalsIgnoreCase("configPerfil")) {

            acceso = configPerfil;

        }else if (action.equalsIgnoreCase("cerrarSesion")) {
            cerrarSesion(request, response);
            return;
        } else if (action.equalsIgnoreCase("expirado")) {
            acceso = expirado;
        } //Add
         else if (action.equalsIgnoreCase("addUsuario")) {
            acceso = addUsuario;
        } else if (action.equalsIgnoreCase("addUsuarioD")) {
            acceso = addUsuarioD;
        } else if (action.equalsIgnoreCase("addPlaylist")) {
            acceso = addPlaylist;
        } else if (action.equalsIgnoreCase("addCancionesPlaylist")) {
            // Obtener la información de la playlist y agregarla como atributo en la solicitud
            int playlistId = Integer.parseInt(request.getParameter("playlistId"));
            Playlist playlist = nuevaPlaylistDAO.buscarPlaylist(playlistId);
            request.setAttribute("playlist", playlist);
            acceso = addCancionesPlaylist;
        }
        //Delete
        else if(action.equalsIgnoreCase("eliminarUsuario")){
            int usuarioId = Integer.parseInt(request.getParameter("id"));
            nuevoUsuario.setCodigoUsuario(usuarioId);
            nuevoUsuarioDAO.eliminarUsuario(usuarioId);
            acceso=listarUsuarios;
        } else if(action.equalsIgnoreCase("eliminarPlaylist")){
            int playlistId = Integer.parseInt(request.getParameter("id"));
            play.setCodigoPlaylist(playlistId);
            nuevaPlaylistDAO.eliminarPlaylist(playlistId);
            acceso=playlists;
        } else if(action.equalsIgnoreCase("eliminarCancionPlaylist")){
            int canId = Integer.parseInt(request.getParameter("cancionId"));
            int playcId = Integer.parseInt(request.getParameter("playlistId"));

            PlaylisthasCanciones playlisthasCanciones = playcDAO.buscarIdPlaylisthasCanciones(canId, playcId);

            if (playlisthasCanciones != null) {
                int codigoPlayC = playlisthasCanciones.getCodigoPlaylist(); // Obtener el código de playlist del objeto

                playcDAO.eliminarPlaylisthasCanciones(playlisthasCanciones.getCodigoPlaylisthasCanciones());

                response.sendRedirect("Controlador?accion=playlist&id=" + playcId);
                System.out.println("codigo playhasc: " + codigoPlayC);
                System.out.println("Se eliminó la canción");
            } else {
                // Manejar el caso donde no se encuentra la entrada en la tabla
                System.out.println("No se encontró la entrada en la tabla PlaylisthasCanciones");
            }

            return;
        }else if(action.equalsIgnoreCase("eliminarBusqueda")){
            int busquedaId = Integer.parseInt(request.getParameter("id"));
            hb.setCodigoHistorialB(busquedaId);
            hbDAO.eliminarHistorialBusqueda(busquedaId);
            acceso=historialBusqueda;
        } else if(action.equalsIgnoreCase("eliminarReproduccion")){
            int reproduccionId = Integer.parseInt(request.getParameter("id"));
            hr.setCodigoHistorialR(reproduccionId);
            hrDAO.eliminarHistorialReproduccion(reproduccionId);
            acceso=HistorialReproduccion;
        } else if(action.equalsIgnoreCase("eliminarFav")){
            int cancionId = Integer.parseInt(request.getParameter("id"));
            int codigoUsuario = (int) request.getSession().getAttribute("codigoUsuario");
            nuevoFavDAO.eliminarFavoritos(cancionId, codigoUsuario);
            response.sendRedirect("Controlador?accion=favoritos");
            return;
        }
        
        // otros
        else if (action.equalsIgnoreCase("cancion")){
            int codigoCancion = Integer.parseInt(request.getParameter("id"));
            int codigoUsuario = (int) request.getSession().getAttribute("codigoUsuario");
            Canciones song = cancionesDAO.buscarCancion(codigoCancion);
            hrDAO.agregarHistorialReproduccion(codigoUsuario, codigoCancion);
            request.setAttribute("cancion", song);
            request.setAttribute("usuario", codigoUsuario);
            acceso=cancion;
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

        Usuarios existingUsuario = nuevoUsuarioDAO.buscarUsuarioNombre(usuario);

        if (existingUsuario == null) {
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
        } else {
            request.setAttribute("errorMessage", "El nombre de usuario ya existe");
            // Redireccionar a tu JSP con el mensaje de error
            request.getRequestDispatcher("View/Add/addUsuario.jsp").forward(request, response);
        }
    }

    private void agregarUsuarioD(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String nombreCompleto = request.getParameter("txtNombre");
        String usuario = request.getParameter("txtUsuario");
        String correoUsuario = request.getParameter("txtCorreo");
        String claveUsuario = request.getParameter("txtClave");

        Usuarios existingUsuario = nuevoUsuarioDAO.buscarUsuarioNombre(usuario);

        if (existingUsuario == null) {
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
        } else {
            request.setAttribute("errorMessage", "El nombre de usuario ya existe");
            // Redireccionar a tu JSP con el mensaje de error
            request.getRequestDispatcher("View/Add/addUsuario.jsp").forward(request, response);
        }
    }

    private void agregarPlaylist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombrePlaylist = request.getParameter("txtNombrePlaylist");
        String descripcionPlaylist = request.getParameter("txtDescripcionPlaylist");
        String imagen = request.getParameter("txtImagenPlaylist");
        int cantidadCanciones = 1;
        int codigoUsuario = (int) request.getSession().getAttribute("codigoUsuario");
        Playlist nuevaPlaylist = new Playlist();
        nuevaPlaylist.setNombrePlaylist(nombrePlaylist);
        nuevaPlaylist.setDescripcionPlaylist(descripcionPlaylist);
        nuevaPlaylist.setCantidadCanciones(cantidadCanciones);
        nuevaPlaylist.setCodigoUsuario(codigoUsuario);
        nuevaPlaylist.setImagen(imagen);
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
        boolean exito = playcDAO.agregarPlaylisthasCanciones(playhasCanciones);
        if (exito) {
            response.sendRedirect("Controlador?accion=playlist&id=" + playlistId);
            System.out.println("Se agregó la canción");
        } else {
            System.out.println("Error al agregar canción");
            response.sendRedirect("error.jsp");
        }
    }
    
    
    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codigoUsuario = (int) request.getSession().getAttribute("codigoUsuario");

        Login nuevoLogin = new Login();
        nuevoLogin.setEstadoSesion(false); // Sesión cerrada
        nuevoLogin.setCodigoUsuario(codigoUsuario);

        LoginDAO loginDAO = new LoginDAO();
        loginDAO.agregarLogin(nuevoLogin);
        
        request.getSession().invalidate();

        response.sendRedirect("index.jsp");
    }

    private void agregarFavorito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCancion = Integer.parseInt(request.getParameter("idCancion"));
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        FavoritosDAO favDAO = new FavoritosDAO();
        favDAO.agregarFavoritos(idUsuario, idCancion);

    }

    private void eliminarFavorito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCancion = Integer.parseInt(request.getParameter("idCancion"));
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        FavoritosDAO favDAO = new FavoritosDAO();
        favDAO.eliminarFavoritos(idCancion, idUsuario);

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
                        response.sendRedirect("Controlador?accion=principal");
                        return;
                    }
                     else {
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
                } else if (accion != null && accion.equalsIgnoreCase("NoAgregarPlaylist")) {
                    request.getRequestDispatcher("View/listarPlaylist.jsp").forward(request, response);
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
        } else if (menu.equalsIgnoreCase("fotoPerfil")) {
                UsuariosDAO usuarioDAO = new UsuariosDAO();

                switch (accion) {
                    case "Subir":
                        Part filePart = request.getPart("imagen");
                        InputStream img = filePart.getInputStream();
                        System.out.println("Osea Si entra pe: " + codUsuario + " " + img);
                        usuarioDAO.agregarFotoPerfil(codUsuario, img);
                        ResultSet rs = usuarioDAO.fijarImagen(codUsuario);

                        try {

                            if (rs.next()) {
                                response.setContentType("image/png");
                                InputStream imageI = rs.getBinaryStream("fotoPerfil");
                                ByteArrayOutputStream byteArray = new ByteArrayOutputStream();
                                byte[] buffer = new byte[9096];
                                int bytesRead;
                                while ((bytesRead = imageI.read(buffer)) != -1) {

                                    byteArray.write(buffer, 0, bytesRead);
                                    request.setAttribute("imgUser", byteArray.toByteArray());
                                    imageI.close();
                                    byteArray.close();
                                }
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        request.getRequestDispatcher("Principal.jsp").forward(request, response);
                        break;
                    }
                    request.getRequestDispatcher("Principal.jsp").forward(request, response);

            } else if (menu.equalsIgnoreCase("Favoritos")) {
                if (accion.equalsIgnoreCase("AgregarFavorito")) {
                    agregarFavorito(request, response);
                    return;
                } else if (accion.equalsIgnoreCase("EliminarFavorito")) {
                    eliminarFavorito(request, response);
                    return;
                }
            }
        
      else {
            response.sendRedirect("error.jsp");
        }

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
