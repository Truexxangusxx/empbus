package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class AlmacenDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static AlmacenDAO instancia;

    public static AlmacenDAO getInstancia() {
        if (instancia == null) {
            instancia = new AlmacenDAO();
        }
        return instancia;
    }

    public void ingresar(Almacen objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsAlmacen(?,?,?,?)");
            cs.setInt(1, objeto.getIdSucursal());
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

    public Almacen obtener(int id) throws Exception {
        Almacen objeto = new Almacen();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetAlmacen(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
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

    public void editar(Almacen objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdAlmacen(?,?,?,?,?)");
            cs.setInt(1, objeto.getIdAlmacen());
            cs.setInt(2, objeto.getIdSucursal());
            cs.setString(3, objeto.getDescripcion());
            cs.setString(4, objeto.getCodigo());
            cs.setString(5, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Almacen objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarAlmacen(?,?)");
            cs.setInt(1, objeto.getIdAlmacen());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Almacen> buscar(Almacen almacen) throws Exception {
        ArrayList<Almacen> lista = new ArrayList<Almacen>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListAlmacen(?)");
            cs.setString(1, almacen.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Almacen objeto = new Almacen();
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setDSucursal(rs.getString("DSucursal"));
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
