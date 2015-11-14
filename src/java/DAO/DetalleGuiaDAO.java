package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class DetalleGuiaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static DetalleGuiaDAO instancia;

    public static DetalleGuiaDAO getInstancia() {
        if (instancia == null) {
            instancia = new DetalleGuiaDAO();
        }
        return instancia;
    }

    public void ingresar(DetalleGuia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsDetalleGuia(?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdProducto());
            cs.setInt(2, objeto.getCantidad());
            cs.setDouble(3, objeto.getPrecio());
            cs.setDouble(4, objeto.getSubTotal());
            cs.setInt(5, objeto.getIdGuia());
            cs.setString(6, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public DetalleGuia obtener(int id) throws Exception {
        DetalleGuia objeto = new DetalleGuia();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetDetalleGuia(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdDetalleGuia(rs.getInt("Iddetalleguia"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setSubTotal(rs.getDouble("Subtotal"));
                objeto.setIdGuia(rs.getInt("Idguia"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(DetalleGuia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdDetalleGuia(?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdDetalleGuia());
            cs.setInt(2, objeto.getIdProducto());
            cs.setInt(3, objeto.getCantidad());
            cs.setDouble(4, objeto.getPrecio());
            cs.setDouble(5, objeto.getSubTotal());
            cs.setInt(6, objeto.getIdGuia());
            cs.setString(7, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(DetalleGuia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarDetalleGuia(?,?)");
            cs.setInt(1, objeto.getIdDetalleGuia());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<DetalleGuia> buscar(Guia entidad) throws Exception {
        ArrayList<DetalleGuia> lista = new ArrayList<DetalleGuia>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleGuia(?)");
            cs.setInt(1, entidad.getIdGuia());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleGuia objeto = new DetalleGuia();
                objeto.setIdDetalleGuia(rs.getInt("Iddetalleguia"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setSubTotal(rs.getDouble("Subtotal"));
                objeto.setIdGuia(rs.getInt("Idguia"));
                objeto.setDProducto(rs.getString("DProducto"));
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
