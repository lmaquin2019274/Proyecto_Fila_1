package org.apache.jsp.View;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import model.Generos;
import java.util.List;
import modelDAO.GeneroDAO;

public final class generoListar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Biblioteca</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div>\r\n");
      out.write("            <h1>Géneros</h1>\r\n");
      out.write("            <a href=\"Controlador?accion=biblioteca\">🢀</a><br>\r\n");
      out.write("            <table border=\"2\">\r\n");
      out.write("                <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th>Id</th>\r\n");
      out.write("                        <th>Nombre</th>\r\n");
      out.write("                        <th>Origen</th>\r\n");
      out.write("                        <th>Descripción</th>\r\n");
      out.write("                        <th>Acciones</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("\r\n");
      out.write("                ");

                    GeneroDAO dao = new GeneroDAO();
                    List<Generos> listaGenero = dao.listarGeneros();
                    Iterator<Generos> iterator = listaGenero.iterator();
                    Generos g = null;
                    while (iterator.hasNext()) {
                        g = iterator.next();

                
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>");
      out.print( g.getCodigoGenero());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( g.getNombreGenero());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( g.getOrigen());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( g.getDescripcion());
      out.write("</td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <a href=\"\">Buscar</a>\r\n");
      out.write("                            <a href=\"\">Eliminar</a>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                </tbody>\r\n");
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
