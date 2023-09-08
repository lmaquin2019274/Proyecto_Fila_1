//Ejecutar función en el evento click
document.getElementById("btn_open").addEventListener("click", open_close_menu);

//Declaramos variables
var side_menu = document.getElementById("menu_side");
var btn_open = document.getElementById("btn_open");
var body = document.getElementById("body");

//Evento para mostrar y ocultar menú
function open_close_menu() {
    body.classList.toggle("body_move");
    side_menu.classList.toggle("menu_side_move");
}

//Si el ancho de la página es menor a 760px, ocultará el menú al recargar la página

if (window.innerWidth < 760) {

    body.classList.add("body_move");
    side_menu.classList.add("menu_side_move");
}

//Haciendo el menú responsive(adaptable)

window.addEventListener("resize", function () {

    if (window.innerWidth > 760) {

        body.classList.remove("body_move");
        side_menu.classList.remove("menu_side_move");
    }

    if (window.innerWidth < 760) {

        body.classList.add("body_move");
        side_menu.classList.add("menu_side_move");
    }

});

// Agregar eventos click a las pestañas del menú
var inicioTab = document.getElementById("inicio");
var bibliotecaTab = document.getElementById("biblioteca");
var buscarTab = document.getElementById("buscar");
var opcionesTab = document.getElementById("opciones");
var tiendaTab = document.getElementById("tienda");

document.getElementById("btn_open").addEventListener("click", open_close_menu);

document.getElementById("inicio-tab").addEventListener("click", function () {
    showTab(inicioTab);
});

document.getElementById("biblioteca-tab").addEventListener("click", function () {
    showTab(bibliotecaTab);
});

document.getElementById("buscar-tab").addEventListener("click", function () {
    showTab(buscarTab);
});

document.getElementById("opciones-tab").addEventListener("click", function () {
    showTab(opcionesTab);
});

document.getElementById("tienda-tab").addEventListener("click", function () {
    showTab(tiendaTab);
});

function showTab(tab) {
    // Ocultar todas las pestañas primero
    inicioTab.style.display = "none";
    bibliotecaTab.style.display = "none";
    buscarTab.style.display = "none";
    opcionesTab.style.display = "none";
    tiendaTab.style.display = "none";

    // Mostrar la pestaña seleccionada
    tab.style.display = "block";

    // Cerrar el menú lateral si se está visualizando en un dispositivo móvil
    if (window.innerWidth < 760) {
        body.classList.remove("body_move");
        side_menu.classList.remove("menu_side_move");
    }
}

// Agregar eventos click a las pestañas del menú
var inicioTab = document.getElementById("inicio");
var bibliotecaTab = document.getElementById("biblioteca");
var buscarTab = document.getElementById("buscar");
var opcionesTab = document.getElementById("opciones");
var tiendaTab = document.getElementById("tienda");

document.getElementById("btn_open").addEventListener("click", open_close_menu);

document.getElementById("inicio-tab").addEventListener("click", function () {
    showTab(inicioTab, this);
});

document.getElementById("biblioteca-tab").addEventListener("click", function () {
    showTab(bibliotecaTab, this);
});

document.getElementById("buscar-tab").addEventListener("click", function () {
    showTab(buscarTab, this);
});

document.getElementById("opciones-tab").addEventListener("click", function () {
    showTab(opcionesTab, this);
});

document.getElementById("tienda-tab").addEventListener("click", function () {
    showTab(tiendaTab);
});

function showTab(tab, tabLink) {
    // Ocultar todas las pestañas primero
    inicioTab.style.display = "none";
    bibliotecaTab.style.display = "none";
    buscarTab.style.display = "none";
    opcionesTab.style.display = "none";
    tiendaTab.style.display = "none";

    // Mostrar la pestaña seleccionada
    tab.style.display = "block";

    // Eliminar la clase "selected" de todas las opciones del menú
    var allTabs = document.querySelectorAll(".options_menu a");
    for (var i = 0; i < allTabs.length; i++) {
        allTabs[i].classList.remove("selected");
    }

    // Agregar clase "selected" solo a la opción seleccionada
    tabLink.classList.add("selected");

    // Cerrar el menú lateral si se está visualizando en un dispositivo móvil
    if (window.innerWidth < 760) {
        body.classList.remove("body_move");
        side_menu.classList.remove("menu_side_move");
    }
}