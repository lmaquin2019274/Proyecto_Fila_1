<%-- 
    Document   : Principal
    Created on : 19/07/2023, 03:19:20 PM
    Author     : luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mizikCss.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
        <title>Mizik® for everyone</title>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
    </head>
    <body id="body">
        <header>
            <div class="icon_menu">
                <i class="fa-solid fa-bars" style="color: #3f4529;" id="btn_open"></i>
            </div>
            <div class="title_header">
                <h1>.                 Mizik®</h1>
            </div>
        </header>
        
        <div class="menu_side" id="menu_side">
            <div class="name_page">
                <img src="img/logo.png" alt="14" width="26"/>
                <h4>Mizik®</h4>
            </div>
            <div class="options_menu">
                <a href="#" id="inicio-tab" class="selected">
                    <div class="option">
                        <i class="fa-solid fa-house" style="color: #f7c607;" title="Inicio"></i>
                        <h4>Inicio</h4>
                    </div>
                </a>
                
                <a href="#" id="biblioteca-tab">
                    <div class="option">
                        <i class="fa-solid fa-music" style="color: #f7c607;" title="Biblioteca"></i>
                        <h4>Biblioteca</h4>
                    </div>
                </a>
                
                <a href="#" id="buscar-tab">
                    <div class="option">
                        <i class="fa-solid fa-magnifying-glass" style="color: #f7c607;" title="Buscar"></i>
                        <h4>Buscar</h4>
                    </div>
                </a>
                
                <a href="#" id="opciones-tab">
                    <div class="option">
                        <i class="fa-solid fa-gear" style="color: #f7c607;" title="Opciones"></i>
                        <h4>Opciones</h4>
                    </div>
                </a>
            </div>
        </div>
        
        <main>
            <div id="inicio">
                <h1>Buenos días</h1>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=mixes">
                            <i class="fa-solid fa-radio" style="color: #632783;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=mixes">Mixes del día</a>
                </div>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=artistas">
                            <i class="fa-solid fa-icons" style="color: #2e741d;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=artistas">Explora diferentes artistas</a>
                </div>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=albumes">
                            <i class="fa-solid fa-record-vinyl" style="color: #2b6895;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=albumes">Los mejores álbumes</a>
                </div>
            </div>
            <div id="biblioteca" style="display: none;">
                <h1>Biblioteca</h1>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=favoritos">
                            <i class="fa-solid fa-heart" style="color: #cc0005;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=favoritos">Tus favoritos</a>
                </div>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=playlists">
                            <i class="fa-solid fa-music" style="color: #f5c607;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=playlists">Tus playlist</a>
                </div>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=biblioteca">
                            <i class="fa-solid fa-sliders" style="color: #606060;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=biblioteca">Otros</a>
                </div>
                
            </div>
            <div id="buscar" style="display: none;">
                <h1>Buscar</h1>
                <div class="search-bar">
                    <input type="text" name="txtBuscar" placeholder="Busca canciones, artistas y álbumes">
                    <div class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
                </div>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=canciones">
                            <i class="fa-solid fa-headphones-simple" style="color: #8c1253;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=canciones">Canciones guardadas</a>
                </div>
                <div class="image_biblioteca">
                    <div class="content_biblioteca">
                        <a href="Controlador?accion=genero">
                            <i class="fa-solid fa-compact-disc" style="color: #7684b4;"></i>
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=genero">Géneros musicales</a>
                </div>
            </div>
            <div id="opciones" style="display: none;">
                <h1>Opciones</h1>
                <br>
                <div class="image-container">
                    <div class="content-wrapper">
                        <a href="Controlador?accion=listarUsuarios">
                            <img src="img/Usuarios.svg" alt="Usuarios" width="30">
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=listarUsuarios">Usuarios</a>
                </div>
                <div class="image-container">
                    <div class="content-wrapper">
                        <a href="Controlador?accion=historialBusqueda">
                            <img src="img/historialBusqueda.svg" alt="historialBusqueda" width="30">
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=historialBusqueda">Historial de búsquedas</a>
                </div>
                <div class="image-container">
                    <div class="content-wrapper">
                        <a href="Controlador?accion=HistorialReproduccion">
                            <img src="img/historialReproduccion.svg" alt="HistorialReproduccion" width="30">
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=HistorialReproduccion">Historial de reproducciones</a>
                </div>
                <div class="image-container">
                    <div class="content-wrapper">
                        <a href="Controlador?accion=login">
                            <img src="img/registroLogin.svg" alt="login" width="30">
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=login">Registro de login</a>
                </div>
                <div class="image-container">
                    <div class="content-wrapper">
                        <a href="Controlador?accion=index">
                            <img src="img/signOut.svg" alt="signOut" width="30">
                        </a>
                    </div>
                    <a class="link" href="Controlador?accion=index">Cerrar Sesión</a>
                </div>
                <a class="link_nosotros" href="Controlador?accion=config">Sobre nosotros</a><br>
            </div>
        </main>
        
    </body>
    
    <script src="js/script.js"></script>
    
</html>
