package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ListaPrecioDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ListaPrecioDAO instancia;

    public static ListaPrecioDAO getInstancia() {
        if (instancia == null) {
            instancia = new ListaPrecioDAO();
        }
        return instancia;
    }

    public void ingresar(ListaPrecio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsListaPrecio(?,?,?,?,?)");
            cs.setInt(1, objeto.getIdProducto());
            cs.setDouble(2, objeto.getPrecio());
            cs.setDouble(3, objeto.getTipoCambio());
            cs.setString(4, objeto.getFecha());
            cs.setString(5, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ListaPrecio obtener(int id) throws Exception {
        ListaPrecio objeto = new ListaPrecio();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetListaPrecio(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdListaPrecio(rs.getInt("Idlistaprecio"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setEstado(rs.getBoolean("Estado"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(ListaPrecio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdListaPrecio(?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdListaPrecio());
            cs.setInt(2, objeto.getIdProducto());
            cs.setDouble(3, objeto.getPrecio());
            cs.setDouble(4, objeto.getTipoCambio());
            cs.setString(5, objeto.getFecha());
            cs.setBoolean(6, objeto.getEstado());
            cs.setString(7, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(ListaPrecio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarListaPrecio(?,?)");
            cs.setInt(1, objeto.getIdListaPrecio());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<ListaPrecio> buscar(ListaPrecio lp) throws Exception {
        ArrayList<ListaPrecio> lista = new ArrayList<ListaPrecio>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListListaPrecio(?,?)");
            cs.setInt(1, lp.getIdProducto());
            cs.setBoolean(2, lp.getEstado());
            rs = cs.executeQuery();
            while (rs.next()) {
                ListaPrecio objeto = new ListaPrecio();
                objeto.setIdListaPrecio(rs.getInt("Idlistaprecio"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setEstado(rs.getBoolean("Estado"));
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
