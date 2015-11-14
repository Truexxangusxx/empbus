package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class AporteDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static AporteDAO instancia;

    public static AporteDAO getInstancia() {
        if (instancia == null) {
            instancia = new AporteDAO();
        }
        return instancia;
    }

    public void ingresar(Aporte objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsAporte(?,?,?)");
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

    public Aporte obtener(int id) throws Exception {
        Aporte objeto = new Aporte();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetAporte(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdAporte(rs.getInt("Idaporte"));
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

    public void editar(Aporte objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdAporte(?,?,?,?)");
            cs.setInt(1, objeto.getIdAporte());
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

    public void eliminar(Aporte objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarAporte(?,?)");
            cs.setInt(1, objeto.getIdAporte());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Aporte> buscar(Aporte entidad) throws Exception {
        ArrayList<Aporte> lista = new ArrayList<Aporte>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListAporte(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Aporte objeto = new Aporte();
                objeto.setIdAporte(rs.getInt("Idaporte"));
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
