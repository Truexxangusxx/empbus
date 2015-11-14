package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoOrdenProduccionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoOrdenProduccionDAO instancia;

    public static TipoOrdenProduccionDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoOrdenProduccionDAO();
        }
        return instancia;
    }

    public ArrayList<TipoOrdenProduccion> listar(TipoOrdenProduccion tipo) throws Exception {
        ArrayList<TipoOrdenProduccion> lista = new ArrayList<TipoOrdenProduccion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoOrdenProduccion(?)");
            cs.setString(1, tipo.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoOrdenProduccion objeto = new TipoOrdenProduccion();
                objeto.setIdTipoOrdenProduccion(rs.getInt("IdTipoOrdenProduccion"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
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
