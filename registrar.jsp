<%-- 
    Document   : registrar
    Created on : 21 nov 2024, 21:12:29
    Author     : alumno
--%>
<%@page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, servlet.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Camión</title>
        <link rel="stylesheet" href="styles3.css">
    </head>
    <body>
        <h1>Registre un camion</h1>
        <form action="NewServlet" method="post">
            <table>
                <tr>
                    <td><label for="placa">Placa:</label></td>
                    <td><input type="text" name="placa" id="placa" required></td>
                </tr>
                <tr>
                    <td><label for="color">Color:</label></td>
                    <td><input type="text" name="color" id="color" required></td>
                </tr>
                <tr>
                    <td><label for="modelo">Modelo:</label></td>
                    <td><input type="date" name="modelo" id="modelo" required></td>
                </tr>
                <tr>
                    <td><label for="capacidad">Capacidad:</label></td>
                    <td><input type="text" name="capacidad" id="capacidad" required></td>
                </tr>
                <tr>
                    <td><label for="id_transporte">Transporte:</label></td>
                    <td>
                        <select name="id_transporte" id="id_transporte" required>
                            <option value="">Seleccione un transporte</option>
                            <% 
                                try (Connection con = NewClass.getConnection()) {
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT id_transporte, nombre FROM transporte");
                                    while(rs.next()) {
                            %>
                                    <option value="<%= rs.getInt("id_transporte") %>">
                                        <%= rs.getString("nombre") %>
                                    </option>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("Error al cargar transportes: " + e.getMessage());
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">Registrar camion</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>