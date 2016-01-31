package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection getConexion() throws Exception {
        Connection con = null;

        String usuario = "root";
        String clave = "123456";
        String url = "jdbc:mysql://localhost:3306/empbus";

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, usuario, clave);

        return con;

    }
}
