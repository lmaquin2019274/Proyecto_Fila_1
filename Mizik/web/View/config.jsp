<%-- 
    Document   : config
    Created on : 23/07/2023, 04:13:03 PM
    Author     : luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Css/nosotrosCss.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
        <title>Mizik for everyone</title>
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }



            header {
                background-color: #f0f0f0;
                padding: 10px;
                display: flex;
                align-items: center;
            }



            .icon_menu {
                margin-right: 20px;
            }



            .title_header {
                flex: 1;
            }



            main {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin: 20px;
            }



            .image-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 10px;
            }



            .content-wrapper {
                margin-bottom: 10px;
            }



            .link {
                text-align: center;
                color: #333;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="icon_menu">
                <a href="Controlador?accion=principal">
                    <i class="fa-solid fa-circle-left" style="color: #454545;"></i>
                </a>
            </div>
            <div class="title_header">
                <h1>Un poco de Mizik</h1>
            </div>
        </header>
        <main style="margin-top: 80px">
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/lmaquin.jpeg" alt="lmaquin" width="130">
                    </a>
                </div>
                <a class="link">Luciano Maquin</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/dalvarez.jpeg" alt="dalvarez" width="130">
                    </a>
                </div>
                <a class="link">Diego Álvarez</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/jmatias.jpeg" alt="jmatias" width="130">
                    </a>
                </div>
                <a class="link">José Matías</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/sistacuy.jpeg" alt="sistacuy" width="130">
                    </a>
                </div>
                <a class="link">Sebastián Istacuy</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/darevalo.jpeg" alt="darevalo" width="130">
                    </a>
                </div>
                <a class="link">David Arévalo</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/dmarroquin.jpeg" alt="dmarroquin" width="130">
                    </a>
                </div>
                <a class="link">Diego Marroquin</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/dbarton.jpeg" alt="dbarton" width="130">
                    </a>
                </div>
                <a class="link">Diego Barton</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/amax.png" alt="amax" width="130">
                    </a>
                </div>
                <a class="link">Alejandro Max</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/iiboy.jpeg" alt="iiboy" width="130">
                    </a>
                </div>
                <a class="link">Ignacio Iboy</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/jlopez.png" alt="jlopez" width="130">
                    </a>
                </div>
                <a class="link">Iván López</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/plopez.png" alt="plopez" width="130">
                    </a>
                </div>
                <a class="link">Pedro López</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/smaeda.png" alt="smaeda" width="130">
                    </a>
                </div>
                <a class="link">Santiago Maeda</a>
            </div>
            <div class="image-container">
                <div class="content-wrapper">
                    <a>
                        <img src="img/developer/bmarroquin.png" alt="bmarroquin" width="130">
                    </a>
                </div>
                <a class="link">Brandon Marroquin</a>
            </div>
        </main>
    </body>
</html>
