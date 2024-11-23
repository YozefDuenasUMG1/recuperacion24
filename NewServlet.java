/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;


@WebServlet("/NewServlet")
public class NewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Recibir los parámetros del formulario
            String placa = request.getParameter("placa");
            String color = request.getParameter("color");
            String modelo = request.getParameter("modelo");
            String capacidad = request.getParameter("capacidad");
            
            // Validar que id_transporte no sea null
            String idTransporteStr = request.getParameter("id_transporte");
            if (idTransporteStr == null || idTransporteStr.trim().isEmpty()) {
                throw new IllegalArgumentException("El ID de transporte es requerido");
            }
            int id_transporte = Integer.parseInt(idTransporteStr);

            // Continuar con la inserción
            try (Connection con = NewClass.getConnection()) {
                String query = "INSERT INTO camion (placa, color, modelo, capacidad, id_transporte) "
                             + "VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pst = con.prepareStatement(query)) {
                    pst.setString(1, placa);
                    pst.setString(2, color);
                    pst.setString(3, modelo);
                    pst.setString(4, capacidad);      
                    pst.setInt(5, id_transporte);
                    pst.executeUpdate();
                }
            }
            response.sendRedirect("registrar.jsp");
            
        } catch (NumberFormatException e) {
            response.getWriter().println("Error: El ID de transporte debe ser un número válido");
        } catch (IllegalArgumentException e) {
            response.getWriter().println("Error: " + e.getMessage());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error al registrar: " + e.getMessage());
        }
    }
}