package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class UnidadMedidaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static UnidadMedidaDAO instancia;

    public static UnidadMedidaDAO getInstancia() {
        if (instancia == null) {
            instancia = new UnidadMedidaDAO();
        }
        return instancia;
    }

    public ArrayList<UnidadMedida> Listar(UnidadMedida unidadmedida) throws Exception {
        ArrayList<UnidadMedida> Lista = new ArrayList<UnidadMedida>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListUnidadMedida(?)");
            cs.setString(1, unidadmedida.getSimbolo());
            rs = cs.executeQuery();
            while (rs.next()) {
                UnidadMedida objeto = new UnidadMedida();
                objeto.setIdUnidadMedida(rs.getInt("Idunidadmedida"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setSimbolo(rs.getString("Simbolo"));
                Lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return Lista;
    }
}
