package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class SucursalDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static SucursalDAO instancia;

    public static SucursalDAO getInstancia() {
        if (instancia == null) {
            instancia = new SucursalDAO();
        }
        return instancia;
    }

    public void ingresar(Sucursal objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsSucursal(?,?,?)");
            cs.setString(1, objeto.getDescripcion());
            cs.setString(2, objeto.getDireccion());
            cs.setString(3, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Sucursal obtener(int id) throws Exception {
        Sucursal objeto = new Sucursal();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetSucursal(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setDireccion(rs.getString("Direccion"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Sucursal objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdSucursal(?,?,?,?)");
            cs.setInt(1, objeto.getIdSucursal());
            cs.setString(2, objeto.getDescripcion());
            cs.setString(3, objeto.getDireccion());
            cs.setString(4, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Sucursal objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarSucursal(?,?)");
            cs.setInt(1, objeto.getIdSucursal());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Sucursal> buscar(Sucursal sucursal) throws Exception {
        ArrayList<Sucursal> lista = new ArrayList<Sucursal>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListSucursal(?)");
            cs.setString(1, sucursal.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Sucursal objeto = new Sucursal();
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setDireccion(rs.getString("Direccion"));
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
