//@author lmaquin2019274
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuarios;
import modelDAO.UsuariosDAO;

public class Validar extends HttpServlet {

    UsuariosDAO userDao = new UsuariosDAO();
    Usuarios user = new Usuarios();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Validar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Validar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Captura la petición del usuario
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Login")) {
            // Capturar el usuario y contraseña
            String usuario = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");

            // Validar que los campos no estén vacíos
            if (!usuario.isEmpty() && !pass.isEmpty()) {

                user = userDao.validar(usuario, pass);

                if (user != null) {
                    // Usuario válido, redirigir a la página principal
                    
                    userDao.setDatosActuales(usuario, pass); // Barton: Necesito esto para poder recibir el usuario actual para el filtro
                  
                    request.setAttribute("usuario", user);
                    request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
                } else {
                    
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                System.out.println("Aquí?");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            }
        } else {
            System.out.println("Aquí?");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
