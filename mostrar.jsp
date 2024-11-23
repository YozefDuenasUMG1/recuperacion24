<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="servlet.NewClass"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mostrar </title>
        <link rel="stylesheet" href="styles2.css">
    </head>
    <body>
        <h1>Listado de camiones</h1>
        <div class="mostrardatos">
            <table border="1">
                <thead>
                    <tr>
                        <th scope="col">placa</th>
                        <th scope="col">color</th>
                        <th scope="col">modelo</th>
                        <th scope="col">capacidad</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        try {
                            // Establecer conexión con la base de datos
                            Connection con = NewClass.getConnection();
                            Statement st = con.createStatement();
                            String query = "SELECT placa, color, modelo, capacidad FROM camion";
                            ResultSet rs = st.executeQuery(query);
                            // Iterar sobre los resultados y construir la tabla
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("placa") %></td>
                        <td><%= rs.getString("color") %></td>
                        <td><%= rs.getString("modelo") %></td>
                        <td><%= rs.getString("capacidad") %></td>
                    </tr>
                    <% 
                            }
                            rs.close();
                            st.close();
                            con.close(); // Cerrar la conexión
                        } catch (Exception e) {
                            out.println("Error al consultar los datos: " + e.getMessage());
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>