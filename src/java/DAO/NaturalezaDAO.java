package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class NaturalezaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static NaturalezaDAO instancia;

    public static NaturalezaDAO getInstancia() {
        if (instancia == null) {
            instancia = new NaturalezaDAO();
        }
        return instancia;
    }

    public void ingresar(Naturaleza objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsNaturaleza(?,?,?)");
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

    public Naturaleza obtener(int id) throws Exception {
        Naturaleza objeto = new Naturaleza();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetNaturaleza(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdNaturaleza(rs.getInt("idnaturaleza"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Naturaleza objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdNaturaleza(?,?,?,?)");
            cs.setInt(1, objeto.getIdNaturaleza());
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

    public void eliminar(Naturaleza objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarNaturaleza(?)");
            cs.setInt(1, objeto.getIdNaturaleza());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<Naturaleza> buscar(Naturaleza obj) throws Exception {
        ArrayList<Naturaleza> ListaNaturaleza = new ArrayList<Naturaleza>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListNaturaleza(?)");
            cs.setString(1, obj.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Naturaleza objeto = new Naturaleza();
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdNaturaleza(rs.getInt("idnaturaleza"));
                ListaNaturaleza.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaNaturaleza;
    }
}
