package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoVentaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoVentaDAO instancia;

    public static TipoVentaDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoVentaDAO();
        }
        return instancia;
    }

    public void ingresar(TipoVenta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoVenta(?,?,?)");
            cs.setString(1, objeto.getDescripcion());
            cs.setString(2, objeto.getCodigo());
            cs.setString(3, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public TipoVenta obtener(int id) throws Exception {
        TipoVenta objeto = new TipoVenta();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoVenta(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoVenta(rs.getInt("Idtipoventa"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(TipoVenta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoVenta(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoVenta());
            cs.setString(2, objeto.getDescripcion());
            cs.setString(3, objeto.getCodigo());
            cs.setString(4, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(TipoVenta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoVenta(?,?)");
            cs.setInt(1, objeto.getIdTipoVenta());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
        public ArrayList<TipoVenta> buscar(TipoVenta entidad) throws Exception {
        ArrayList<TipoVenta> lista = new ArrayList<TipoVenta>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoVenta(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoVenta objeto = new TipoVenta();
                objeto.setIdTipoVenta(rs.getInt("Idtipoventa"));
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
