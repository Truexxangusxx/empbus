package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class DetalleFacturaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static DetalleFacturaDAO instancia;

    public static DetalleFacturaDAO getInstancia() {
        if (instancia == null) {
            instancia = new DetalleFacturaDAO();
        }
        return instancia;
    }

    public void ingresar(DetalleFactura objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsDetalleFactura(?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdProducto());
            cs.setInt(2, objeto.getCantidad());
            cs.setDouble(3, objeto.getPrecio());
            cs.setDouble(4, objeto.getSubTotal());
            cs.setInt(5, objeto.getIdFactura());
            cs.setString(6, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public DetalleFactura obtener(int id) throws Exception {
        DetalleFactura objeto = new DetalleFactura();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetDetalleFactura(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdDetalleFactura(rs.getInt("Iddetallefactura"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setSubTotal(rs.getDouble("Subtotal"));
                objeto.setIdFactura(rs.getInt("Idfactura"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(DetalleFactura objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdDetalleFactura(?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdDetalleFactura());
            cs.setInt(2, objeto.getIdProducto());
            cs.setInt(3, objeto.getCantidad());
            cs.setDouble(4, objeto.getPrecio());
            cs.setDouble(5, objeto.getSubTotal());
            cs.setInt(6, objeto.getIdFactura());
            cs.setString(7, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(DetalleFactura objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarDetalleFactura(?,?)");
            cs.setInt(1, objeto.getIdDetalleFactura());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<DetalleFactura> buscar(Factura entidad) throws Exception {
        ArrayList<DetalleFactura> lista = new ArrayList<DetalleFactura>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleFactrua(?)");
            cs.setInt(1, entidad.getIdFactura());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleFactura objeto = new DetalleFactura();
                objeto.setIdDetalleFactura(rs.getInt("Iddetallefactura"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setSubTotal(rs.getDouble("Subtotal"));
                objeto.setIdFactura(rs.getInt("Idfactura"));
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
