package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ServicioDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ServicioDAO instancia;

    public static ServicioDAO getInstancia() {
        if (instancia == null) {
            instancia = new ServicioDAO();
        }
        return instancia;
    }

    public void ingresar(Servicio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsServicio(?,?,?)");
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

    public Servicio obtener(int id) throws Exception {
        Servicio objeto = new Servicio();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetServicio(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdServicio(rs.getInt("Idservicio"));
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

    public void editar(Servicio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdServicio(?,?,?,?)");
            cs.setInt(1, objeto.getIdServicio());
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

    public void eliminar(Servicio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarServicio(?,?)");
            cs.setInt(1, objeto.getIdServicio());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Servicio> buscar(Servicio entidad) throws Exception {
        ArrayList<Servicio> lista = new ArrayList<Servicio>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListServicio(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Servicio objeto = new Servicio();
                objeto.setIdServicio(rs.getInt("Idservicio"));
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
