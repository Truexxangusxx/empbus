package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoCambioCuentaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoCambioCuentaDAO instancia;

    public static TipoCambioCuentaDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoCambioCuentaDAO();
        }
        return instancia;
    }

    public void ingresar(TipoCambioCuenta objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoCambioCuenta(?,?,?)");
            cs.setString(1, objeto.getDescripcion());
            cs.setString(2, objeto.getCodigo());
            cs.setString(3, usuario);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public TipoCambioCuenta obtener(int id) throws Exception {
        TipoCambioCuenta objeto = new TipoCambioCuenta();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoCambioCuenta(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoCambioCuenta(rs.getInt("idtipocambiocuenta"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(TipoCambioCuenta objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoCambioCuenta(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoCambioCuenta());
            cs.setString(2, objeto.getDescripcion());
            cs.setString(3, objeto.getCodigo());
            cs.setString(4, usuario);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(TipoCambioCuenta objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoCambioCuenta(?)");
            cs.setInt(1, objeto.getIdTipoCambioCuenta());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<TipoCambioCuenta> buscar(TipoCambioCuenta obj) throws Exception {
        ArrayList<TipoCambioCuenta> ListaTipoCambioCuenta = new ArrayList<TipoCambioCuenta>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoCambioCuenta(?)");
            cs.setString(1, obj.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoCambioCuenta objeto = new TipoCambioCuenta();
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoCambioCuenta(rs.getInt("idtipocambiocuenta"));
                ListaTipoCambioCuenta.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaTipoCambioCuenta;
    }
}
