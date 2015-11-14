package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class CaracteristicaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static CaracteristicaDAO instancia;

    public static CaracteristicaDAO getInstancia() {
        if (instancia == null) {
            instancia = new CaracteristicaDAO();
        }
        return instancia;
    }
    
    public ArrayList<CotizacionCaracteristicas> listar() throws Exception {
        ArrayList<CotizacionCaracteristicas> lista = new ArrayList<CotizacionCaracteristicas>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListCaracteristicaCotizacion()");
            rs = cs.executeQuery();
            while (rs.next()) {
                CotizacionCaracteristicas objeto = new CotizacionCaracteristicas();
                objeto.setIdCaracteristicas(rs.getInt("IdCaracteristicas"));
                objeto.setDCaracteristicas(rs.getString("DCaracteristicas"));
                objeto.setDTipoCaracteristica(rs.getString("DTipoCaracteristica"));
                objeto.setEstado(false);
                objeto.setValor("");
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
