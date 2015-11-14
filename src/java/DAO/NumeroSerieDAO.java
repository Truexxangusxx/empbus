package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class NumeroSerieDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static NumeroSerieDAO instancia;

    public static NumeroSerieDAO getInstancia() {
        if (instancia == null) {
            instancia = new NumeroSerieDAO();
        }
        return instancia;
    }
    
    public NumeroSerie obtener(NumeroSerie numeroserie) throws Exception {
        NumeroSerie objeto = new NumeroSerie();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetNumeroSerie(?)");
            cs.setString(1, numeroserie.getDocumento());
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setNumero(rs.getString("Numero"));
                objeto.setSerie(rs.getString("Serie"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }
    
}
