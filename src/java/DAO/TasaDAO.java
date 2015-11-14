package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TasaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TasaDAO instancia;

    public static TasaDAO getInstancia() {
        if (instancia == null) {
            instancia = new TasaDAO();
        }
        return instancia;
    }

    public void ingresar(Tasa objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTasa(?,?,?)");
            cs.setString(1, objeto.getDescripcion());
            cs.setDouble(2, objeto.getValor());
            cs.setString(3, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Tasa obtener(int id) throws Exception {
        Tasa objeto = new Tasa();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTasa(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTasa(rs.getInt("Idtasa"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setValor(rs.getDouble("Valor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Tasa objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTasa(?,?,?,?)");
            cs.setInt(1, objeto.getIdTasa());
            cs.setString(2, objeto.getDescripcion());
            cs.setDouble(3, objeto.getValor());
            cs.setString(4, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Tasa objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTasa(?,?)");
            cs.setInt(1, objeto.getIdTasa());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Tasa> buscar(Tasa entidad) throws Exception {
        ArrayList<Tasa> lista = new ArrayList<Tasa>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTasa(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Tasa objeto = new Tasa();
                objeto.setIdTasa(rs.getInt("Idtasa"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setValor(rs.getDouble("Valor"));
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
