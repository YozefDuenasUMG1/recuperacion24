/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class NewClass {
    private static final String URL = "jdbc:mysql://localhost:3306/sistema_transporte";
    private static final String USER = "root";
    private static final String PASSWORD = "12345678";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Cargar el driver
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}