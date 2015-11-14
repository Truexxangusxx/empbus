package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoConfiguracionCuentaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoConfiguracionCuentaDAO instancia;

    public static TipoConfiguracionCuentaDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoConfiguracionCuentaDAO();
        }
        return instancia;
    }

    public void ingresar(TipoConfiguracionCuenta objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoConfiguracionCuenta(?,?,?)");
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

    public TipoConfiguracionCuenta obtener(int id) throws Exception {
        TipoConfiguracionCuenta objeto = new TipoConfiguracionCuenta();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoConfiguracionCuenta(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoConfiguracionCuenta(rs.getInt("idtipoconfiguracioncuenta"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(TipoConfiguracionCuenta objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoConfiguracionCuenta(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoConfiguracionCuenta());
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

    public void eliminar(TipoConfiguracionCuenta objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoConfiguracionCuenta(?)");
            cs.setInt(1, objeto.getIdTipoConfiguracionCuenta());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<TipoConfiguracionCuenta> buscar(TipoConfiguracionCuenta obj) throws Exception {
        ArrayList<TipoConfiguracionCuenta> ListaTipoConfiguracionCuenta = new ArrayList<TipoConfiguracionCuenta>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoConfiguracionCuenta(?)");
            cs.setString(1, obj.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoConfiguracionCuenta objeto = new TipoConfiguracionCuenta();
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoConfiguracionCuenta(rs.getInt("idtipoconfiguracioncuenta"));
                ListaTipoConfiguracionCuenta.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaTipoConfiguracionCuenta;
    }
}
