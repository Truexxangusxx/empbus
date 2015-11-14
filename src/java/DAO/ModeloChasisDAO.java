package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ModeloChasisDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ModeloChasisDAO instancia;

    public static ModeloChasisDAO getInstancia() {
        if (instancia == null) {
            instancia = new ModeloChasisDAO();
        }
        return instancia;
    }
    
    public ArrayList<ModeloChasis> buscar(ModeloChasis modelochasis) throws Exception {
        ArrayList<ModeloChasis> lista = new ArrayList<ModeloChasis>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListModeloChasis(?)");
            cs.setString(1, modelochasis.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                ModeloChasis objeto = new ModeloChasis();
                objeto.setIdModeloChasis(rs.getInt("IdModeloChasis"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
}
