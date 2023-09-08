package org.apache.jsp.View;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Carro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css\" integrity=\"sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"estilo.css\">\n");
      out.write("    <script src=\"app.js\" async></script>\n");
      out.write("    <title>Carrito -- Tienda online</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("    </header>\n");
      out.write("    <section class=\"contenedor\">\n");
      out.write("        <div class=\"contenedor-items\">\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Set de futbolín</span>\n");
      out.write("                <img src=\"img/productos/futbol.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q150,00</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Dinocama</span>\n");
      out.write("                <img src=\"img/productos/dinocama.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q749,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Cepillo de inodoro</span>\n");
      out.write("                <img src=\"img/productos/trump.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q59,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Horno de fusion</span>\n");
      out.write("                <img src=\"img/productos/horno.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q1499,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Set de lapiceros</span>\n");
      out.write("                <img src=\"img/productos/lapiceros.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q35,00</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Casco de gallina</span>\n");
      out.write("                <img src=\"img/productos/gallina.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q149,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Juego de dedos</span>\n");
      out.write("                <img src=\"img/productos/minotauro.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q24,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Cogin de sala</span>\n");
      out.write("                <img src=\"img/productos/cogin.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q29,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Papel higienico</span>\n");
      out.write("                <img src=\"img/productos/obama.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q24,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <span class=\"titulo-item\">Sandalias de verano</span>\n");
      out.write("                <img src=\"img/productos/sandalias.jpg\" alt=\"\" class=\"img-item\">\n");
      out.write("                <span class=\"precio-item\">Q34,50</span>\n");
      out.write("                <button class=\"boton-item\">Agregar al Carrito</button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"carrito\" id=\"carrito\">\n");
      out.write("            <div class=\"header-carrito\">\n");
      out.write("                <h2>Tu Carrito</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"carrito-items\">\n");
      out.write("                <!-- \n");
      out.write("                <div class=\"carrito-item\">\n");
      out.write("                    <img src=\"img/boxengasse.png\" width=\"80px\" alt=\"\">\n");
      out.write("                    <div class=\"carrito-item-detalles\">\n");
      out.write("                        <span class=\"carrito-item-titulo\">Box Engasse</span>\n");
      out.write("                        <div class=\"selector-cantidad\">\n");
      out.write("                            <i class=\"fa-solid fa-minus restar-cantidad\"></i>\n");
      out.write("                            <input type=\"text\" value=\"1\" class=\"carrito-item-cantidad\" disabled>\n");
      out.write("                            <i class=\"fa-solid fa-plus sumar-cantidad\"></i>\n");
      out.write("                        </div>\n");
      out.write("                        <span class=\"carrito-item-precio\">$15.000,00</span>\n");
      out.write("                    </div>\n");
      out.write("                   <span class=\"btn-eliminar\">\n");
      out.write("                        <i class=\"fa-solid fa-trash\"></i>\n");
      out.write("                   </span>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"carrito-item\">\n");
      out.write("                    <img src=\"img/skinglam.png\" width=\"80px\" alt=\"\">\n");
      out.write("                    <div class=\"carrito-item-detalles\">\n");
      out.write("                        <span class=\"carrito-item-titulo\">Skin Glam</span>\n");
      out.write("                        <div class=\"selector-cantidad\">\n");
      out.write("                            <i class=\"fa-solid fa-minus restar-cantidad\"></i>\n");
      out.write("                            <input type=\"text\" value=\"3\" class=\"carrito-item-cantidad\" disabled>\n");
      out.write("                            <i class=\"fa-solid fa-plus sumar-cantidad\"></i>\n");
      out.write("                        </div>\n");
      out.write("                        <span class=\"carrito-item-precio\">$18.000,00</span>\n");
      out.write("                    </div>\n");
      out.write("                   <button class=\"btn-eliminar\">\n");
      out.write("                        <i class=\"fa-solid fa-trash\"></i>\n");
      out.write("                   </button>\n");
      out.write("                </div>\n");
      out.write("                 -->\n");
      out.write("            </div>\n");
      out.write("            <div class=\"carrito-total\">\n");
      out.write("                <div class=\"fila\">\n");
      out.write("                    <strong>Tu Total</strong>\n");
      out.write("                    <span class=\"carrito-precio-total\">\n");
      out.write("                        Q120.000,00\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("                <button class=\"btn-pagar\">Pagar <i class=\"fa-solid fa-bag-shopping\"></i> </button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
