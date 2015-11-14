package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class PercepcionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static PercepcionDAO instancia;

    public static PercepcionDAO getInstancia() {
        if (instancia == null) {
            instancia = new PercepcionDAO();
        }
        return instancia;
    }

    public void ingresar(Percepcion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsPercepcion(?,?,?)");
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

    public Percepcion obtener(int id) throws Exception {
        Percepcion objeto = new Percepcion();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetPercepcion(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdPercepcion(rs.getInt("Idpercepcion"));
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

    public void editar(Percepcion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdPercepcion(?,?,?,?)");
            cs.setInt(1, objeto.getIdPercepcion());
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

    public void eliminar(Percepcion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarPercepcion(?,?)");
            cs.setInt(1, objeto.getIdPercepcion());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Percepcion> buscar(Percepcion entidad) throws Exception {
        ArrayList<Percepcion> lista = new ArrayList<Percepcion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListPercepcion(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Percepcion objeto = new Percepcion();
                objeto.setIdPercepcion(rs.getInt("Idpercepcion"));
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
