package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class SubdiarioDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static SubdiarioDAO instancia;

    public static SubdiarioDAO getInstancia() {
        if (instancia == null) {
            instancia = new SubdiarioDAO();
        }
        return instancia;
    }

    public void ingresar(Subdiario objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsSubdiario(?,?,?)");
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

    public Subdiario obtener(int id) throws Exception {
        Subdiario objeto = new Subdiario();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetSubdiario(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdSubdiario(rs.getInt("idsubdiario"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Subdiario objeto, String usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdSubdiario(?,?,?,?)");
            cs.setInt(1, objeto.getIdSubdiario());
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

    public void eliminar(Subdiario objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarSubdiario(?)");
            cs.setInt(1, objeto.getIdSubdiario());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<Subdiario> buscar(Subdiario obj) throws Exception {
        ArrayList<Subdiario> ListaSubdiario = new ArrayList<Subdiario>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListSubdiario(?)");
            cs.setString(1, obj.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Subdiario objeto = new Subdiario();
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdSubdiario(rs.getInt("idsubdiario"));
                ListaSubdiario.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaSubdiario;
    }
}
