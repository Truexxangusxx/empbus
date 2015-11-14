package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class CentroCostoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static CentroCostoDAO instancia;

    public static CentroCostoDAO getInstancia() {
        if (instancia == null) {
            instancia = new CentroCostoDAO();
        }
        return instancia;
    }

    public void ingresar(CentroCosto objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsCentroCosto(?,?,?)");
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

    public CentroCosto obtener(int id) throws Exception {
        CentroCosto objeto = new CentroCosto();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetCentroCosto(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
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

    public void editar(CentroCosto objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdCentroCosto(?,?,?,?)");
            cs.setInt(1, objeto.getIdCentroCosto());
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

    public void eliminar(CentroCosto objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarCentroCosto(?,?)");
            cs.setInt(1, objeto.getIdCentroCosto());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<CentroCosto> buscar(CentroCosto centro) throws Exception {
        ArrayList<CentroCosto> lista = new ArrayList<CentroCosto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListCentroCosto(?,?)");
            cs.setString(1, centro.getDescripcion());
            cs.setString(2, centro.getCodigo());
            rs = cs.executeQuery();
            while (rs.next()) {
                CentroCosto objeto = new CentroCosto();
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
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
