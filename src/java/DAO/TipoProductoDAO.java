package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoProductoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoProductoDAO instancia;

    public static TipoProductoDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoProductoDAO();
        }
        return instancia;
    }

    public void ingresar(TipoProducto objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoProducto(?,?,?)");
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

    public TipoProducto obtener(int id) throws Exception {
        TipoProducto objeto = new TipoProducto();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoProducto(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoProducto(rs.getInt("idtipoproducto"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(TipoProducto objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoProducto(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoProducto());
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

    public void eliminar(TipoProducto objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoProducto(?)");
            cs.setInt(1, objeto.getIdTipoProducto());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<TipoProducto> buscar(TipoProducto obj) throws Exception {
        ArrayList<TipoProducto> ListaTipoProducto = new ArrayList<TipoProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoProducto(?)");
            cs.setString(1, obj.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoProducto objeto = new TipoProducto();
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoProducto(rs.getInt("idtipoproducto"));
                ListaTipoProducto.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaTipoProducto;
    }
    
    
}
