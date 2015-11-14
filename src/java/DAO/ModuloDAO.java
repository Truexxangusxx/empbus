package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ModuloDAO {
private Connection cnn = null;
    private ResultSet rs = null;
    private static ModuloDAO instancia;

    public static ModuloDAO getInstancia() {
        if (instancia == null) {
            instancia = new ModuloDAO();
        }
        return instancia;
    }
    
    public ArrayList<Modulo> BuscarModulo(Modulo modulo) throws Exception {
        ArrayList<Modulo> ListaModulo = new ArrayList<Modulo>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListModulo(?)");
            cs.setString(1, modulo.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Modulo objeto = new Modulo();
                objeto.setIdModulo(rs.getInt("idModulo"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                ListaModulo.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaModulo;
    }    
    
}
