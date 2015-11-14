package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class MonedaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static MonedaDAO instancia;

    public static MonedaDAO getInstancia() {
        if (instancia == null) {
            instancia = new MonedaDAO();
        }
        return instancia;
    }
    
    public ArrayList<Moneda> buscar(Moneda moneda) throws Exception {
        ArrayList<Moneda> lista = new ArrayList<Moneda>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListMoneda(?)");
            cs.setString(1, moneda.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Moneda objeto = new Moneda();
                objeto.setIdMoneda(rs.getInt("idMoneda"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setDescripcionCorta(rs.getString("DescripcionCorta"));
                objeto.setSimbolo(rs.getString("Simbolo"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public Moneda obtenerLocal() throws Exception {
        Moneda objeto = new Moneda();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetMonedaLocal()");
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdMoneda(rs.getInt("idMoneda"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setDescripcionCorta(rs.getString("DescripcionCorta"));
                objeto.setSimbolo(rs.getString("Simbolo"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }
    
}
