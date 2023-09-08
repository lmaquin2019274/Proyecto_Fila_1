<%-- 
    Document   : addPlaylist
    Created on : 20/07/2023, 11:16:10 PM
    Author     : sebas
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tus Playlists</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
            }
            .form-label {
                font-weight: bold;
            }
            .form-control {
                margin-bottom: 15px;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Nueva Playlist</h1>
            
            <!-- Mostrar el mensaje de error si existe -->
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <form class="form" action="Controlador" method="post">
                <input type="hidden" name="menu" value="Add">
                <div class="form-group">
                    <label class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="txtNombrePlaylist">
                </div>
                <div class="form-group">
                    <label class="form-label">Descripción</label>
                    <input type="text" class="form-control" name="txtDescripcionPlaylist">
                </div>
                <div class="form-group">
                    <label class="form-label">Imagen</label>
                    <div id="image-container" class="d-flex justify-content-center align-items-center" style="width: 200px; height: 200px; border: 1px solid #ccc;">
                        <img id="selected-image" src="img/playlists/kitsune.png" alt="Imagen seleccionada" style="max-width: 100%; max-height: 100%;">
                        <input type="hidden" id="selected-image-name" name="txtImagenPlaylist" value="kitsune.png">
                    </div>
                    <select id="image-selector" class="form-control mt-2">
                        <option value="kitsune.png">Kitsune</option>
                        <option value="pesa.png">Pesa</option>
                        <option value="hoguera.png">Hoguera</option>
                        <option value="pluma.png">Pluma</option>
                        <option value="simbolo.png">Símbolo</option>
                        <option value="sai.png">Sai</option>
                        <option value="peluca.png">Peluca</option>
                        <option value="lagarto.png">Lagarto</option>
                        <option value="pez-dorado.png">Pez dorado</option>
                        <option value="rana.png">Rana</option>
                        <option value="arana.png">Araña</option>
                        <option value="geco.png">Geco</option>
                        <option value="montana-fuji.png">Montaña Fuji</option>
                        <option value="calamar.png">Calamar</option>
                        <option value="bicicleta.png">Bicicleta</option>
                        <option value="sombrero-de-payaso.png">Sombrero de payaso</option>
                        <option value="arbol.png">Árbol</option>
                        <option value="extraterrestre.png">Extraterrestre</option>
                        <option value="libro.png">Libro</option>
                        <option value="corazon.png">Corazón</option>
                    </select>
                </div>
                <script>
                    const imageContainer = document.getElementById("image-container");
                    const selectedImage = document.getElementById("selected-image");
                    const selectedImageName = document.getElementById("selected-image-name");
                    const imageSelector = document.getElementById("image-selector");

                    imageSelector.addEventListener("change", function () {
                        const selectedValue = imageSelector.value;
                        const imagePath = "img/playlists/" + selectedValue;
                        selectedImage.src = imagePath;
                        selectedImageName.value = selectedValue;
                    });
                </script>
                <button type="submit" class="btn btn-primary" name="accion" value="AgregarPlaylist">Agregar</button>
                <button type="submit" class="btn btn-danger" name="accion" value="NoAgregarPlaylist">Cancelar</button>
                
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>