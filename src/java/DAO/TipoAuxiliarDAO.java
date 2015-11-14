package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoAuxiliarDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoAuxiliarDAO instancia;

    public static TipoAuxiliarDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoAuxiliarDAO();
        }
        return instancia;
    }

    public void ingresar(TipoAuxiliar objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoAuxiliar(?,?,?)");
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

    public TipoAuxiliar obtener(int id) throws Exception {
        TipoAuxiliar objeto = new TipoAuxiliar();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoAuxiliar(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoAuxiliar(rs.getInt("idtipoauxiliar"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(TipoAuxiliar objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoAuxiliar(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoAuxiliar());
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

    public void eliminar(TipoAuxiliar objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoAuxiliar(?)");
            cs.setInt(1, objeto.getIdTipoAuxiliar());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<TipoAuxiliar> buscar(TipoAuxiliar obj) throws Exception {
        ArrayList<TipoAuxiliar> ListaTipoAuxiliar = new ArrayList<TipoAuxiliar>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoAuxiliar(?)");
            cs.setString(1, obj.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoAuxiliar objeto = new TipoAuxiliar();
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdTipoAuxiliar(rs.getInt("idtipoauxiliar"));
                ListaTipoAuxiliar.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaTipoAuxiliar;
    }
}
