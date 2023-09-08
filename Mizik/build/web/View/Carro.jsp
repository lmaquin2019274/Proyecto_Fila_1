<%-- 
    Document   : Carro
    Created on : 23/08/2023, 11:33:15 AM
    Author     : informatica
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="Css/estilo.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
        <title>Mizik® for everyone</title>
    </head>
    <body>


        <header>
            <div class="icon_menu">
                <a href="Controlador?accion=principal">
                    <i class="fa-solid fa-circle-left" style="color: #454545;"></i>
                </a>
            </div>
            <div class="title_header">
                <h1>.    De compras con Mizik</h1>
            </div>
        </header>

        <main style="margin-top: 80px">
            <section class="contenedor">
                <div class="contenedor-items">
                    <div class="item">
                        <span class="titulo-item">Chaqueta</span>
                        <img src="img/productos/chaqueta.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$60,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Gorra</span>
                        <img src="img/productos/gorra.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$25,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Suéter</span>
                        <img src="img/productos/sueter.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$50,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Hoddie negro</span>
                        <img src="img/productos/hoodie.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$50,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Hoddie blanco</span>
                        <img src="img/productos/blanco.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$50,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Camisa</span>
                        <img src="img/productos/camisa.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$35,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Case Samsung</span>
                        <img src="img/productos/samsu.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$30,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                    <div class="item">
                        <span class="titulo-item">Case Apple</span>
                        <img src="img/productos/aifon.png" height="180px" alt="" class="img-item">
                        <span class="precio-item">$30,00</span>
                        <button class="boton-item">Agregar al Carrito</button>
                    </div>
                </div>

                <div class="carrito" id="carrito">
                    <div class="header-carrito">
                        <h2>Tu Carrito</h2>
                    </div>

                    <div class="carrito-items">
                        <!-- 
                        <div class="carrito-item">
                            <img src="img/boxengasse.png" width="80px" alt="">
                            <div class="carrito-item-detalles">
                                <span class="carrito-item-titulo">Box Engasse</span>
                                <div class="selector-cantidad">
                                    <i class="fa-solid fa-minus restar-cantidad"></i>
                                    <input type="text" value="1" class="carrito-item-cantidad" disabled>
                                    <i class="fa-solid fa-plus sumar-cantidad"></i>
                                </div>
                                <span class="carrito-item-precio">$15.000,00</span>
                            </div>
                           <span class="btn-eliminar">
                                <i class="fa-solid fa-trash"></i>
                           </span>
                        </div>
                        <div class="carrito-item">
                            <img src="img/skinglam.png" width="80px" alt="">
                            <div class="carrito-item-detalles">
                                <span class="carrito-item-titulo">Skin Glam</span>
                                <div class="selector-cantidad">
                                    <i class="fa-solid fa-minus restar-cantidad"></i>
                                    <input type="text" value="3" class="carrito-item-cantidad" disabled>
                                    <i class="fa-solid fa-plus sumar-cantidad"></i>
                                </div>
                                <span class="carrito-item-precio">$18.000,00</span>
                            </div>
                           <button class="btn-eliminar">
                                <i class="fa-solid fa-trash"></i>
                           </button>
                        </div>
                        -->
                    </div>
                    <div class="carrito-total">
                        <div class="fila">
                            <strong>Tu Total</strong>
                            <span class="carrito-precio-total">
                                Q120.000,00
                            </span>
                        </div>
                        <button class="btn-pagar">Pagar <i class="fa-solid fa-bag-shopping"></i> </button>
                    </div>
                </div>
            </section>
        </main>
    </body>
    <script src="js/app.js"></script>
</html>