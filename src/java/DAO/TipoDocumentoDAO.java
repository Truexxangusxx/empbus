package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoDocumentoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoDocumentoDAO instancia;

    public static TipoDocumentoDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoDocumentoDAO();
        }
        return instancia;
    }

    public void ingresar(TipoDocumento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoDocumento(?,?,?)");
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

    public TipoDocumento obtener(int id) throws Exception {
        TipoDocumento objeto = new TipoDocumento();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoDocumento(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoDocumento(rs.getInt("Idtipodocumento"));
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

    public void editar(TipoDocumento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoDocumento(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoDocumento());
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

    public void eliminar(TipoDocumento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoDocumento(?,?)");
            cs.setInt(1, objeto.getIdTipoDocumento());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<TipoDocumento> buscar(TipoDocumento entidad) throws Exception {
        ArrayList<TipoDocumento> lista = new ArrayList<TipoDocumento>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoDocumento(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoDocumento objeto = new TipoDocumento();
                objeto.setIdTipoDocumento(rs.getInt("Idtipodocumento"));
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
