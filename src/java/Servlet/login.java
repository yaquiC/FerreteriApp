/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MINEDUCYT
 */
@WebServlet("/login")
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        // Simulación de validación (luego se conectara con la BD)
        if ("admin".equals(usuario) && "1234".equals(password)) {
            // Guardamos el usuario en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            // redirigirse al menú principal
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Credenciales incorrectas"); // Si falla muestra error
        }
    }
}
