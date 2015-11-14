package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoMovimientoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoMovimientoDAO instancia;

    public static TipoMovimientoDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoMovimientoDAO();
        }
        return instancia;
    }

    public void ingresar(TipoMovimiento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoMovimiento(?,?,?)");
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

    public TipoMovimiento obtener(int id) throws Exception {
        TipoMovimiento objeto = new TipoMovimiento();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoMovimiento(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
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

    public void editar(TipoMovimiento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoMovimiento(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoMovimiento());
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

    public void eliminar(TipoMovimiento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoMovimiento(?,?)");
            cs.setInt(1, objeto.getIdTipoMovimiento());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<TipoMovimiento> buscar(TipoMovimiento tipo) throws Exception {
        ArrayList<TipoMovimiento> lista = new ArrayList<TipoMovimiento>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoMovimiento(?)");
            cs.setString(1, tipo.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoMovimiento objeto = new TipoMovimiento();
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
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
