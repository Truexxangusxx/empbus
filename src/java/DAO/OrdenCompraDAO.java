package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class OrdenCompraDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static OrdenCompraDAO instancia;

    public static OrdenCompraDAO getInstancia() {
        if (instancia == null) {
            instancia = new OrdenCompraDAO();
        }
        return instancia;
    }

    public int ingresar(OrdenCompra objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsOrdenCompra(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdSucursal());
            cs.setInt(2, objeto.getIdFormaPago());
            cs.setInt(3, objeto.getIdMoneda());
            cs.setInt(4, objeto.getIdClienteProveedor());
            cs.setString(5, objeto.getFecha());
            cs.setDouble(6, objeto.getTipoCambio());
            cs.setString(7, objeto.getFechaEntrega());
            cs.setString(8, objeto.getObservaciones());
            cs.setDouble(9, objeto.getIGV());
            cs.setDouble(10, objeto.getSubtotal());
            cs.setDouble(11, objeto.getTotal());
            cs.setString(12, usuario.getNick());
            cs.setString(13, xml);
            cs.registerOutParameter(14, Types.INTEGER);
            cs.setBoolean(15, objeto.getAfecto());
            cs.execute();
            id = Integer.parseInt(cs.getObject(14).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public OrdenCompra obtener(int id) throws Exception {
        OrdenCompra objeto = new OrdenCompra();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetOrdenCompra(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setFechaEntrega(rs.getString("Fechaentrega"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setIGV(rs.getDouble("IGV"));
                objeto.setSubtotal(rs.getDouble("Subtotal"));
                objeto.setTotal(rs.getDouble("Total"));                
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));                
                objeto.setNumero(rs.getString("Numero"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setRucCliente(rs.getString("Ruc"));
                objeto.setAfecto(rs.getBoolean("Afecto"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }
    
    public int ultimoid() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimoIdOrdenCompra()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("Idordencompra");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public void editar(OrdenCompra objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdOrdenCompra(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdOrdenCompra());
            cs.setInt(2, objeto.getIdSucursal());
            cs.setInt(3, objeto.getIdFormaPago());
            cs.setInt(4, objeto.getIdMoneda());
            cs.setInt(5, objeto.getIdClienteProveedor());
            cs.setString(6, objeto.getFecha());
            cs.setDouble(7, objeto.getTipoCambio());
            cs.setString(8, objeto.getFechaEntrega());
            cs.setString(9, objeto.getObservaciones());
            cs.setDouble(10, objeto.getIGV());
            cs.setDouble(11, objeto.getSubtotal());
            cs.setDouble(12, objeto.getTotal());
            cs.setString(13, usuario.getNick());
            cs.setString(14, xml);
            cs.setBoolean(15, objeto.getAfecto());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(OrdenCompra objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarOrdenCompra(?,?)");
            cs.setInt(1, objeto.getIdOrdenCompra());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    public ArrayList<OrdenCompraProducto> obtenerDetalle(int id) throws Exception {
        ArrayList<OrdenCompraProducto> lista = new ArrayList<OrdenCompraProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListOrdenCompraProducto(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                OrdenCompraProducto objeto = new OrdenCompraProducto();
                objeto.setIdOrdenCompraProducto(rs.getInt("IdOrdenCompraProducto"));
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setDUnidadMedida(rs.getString("DUnidadMedida"));
                objeto.setDescuento(rs.getDouble("Descuento"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setPrecioUnitario(rs.getDouble("PrecioUnitario"));                
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    public void aprobar(OrdenCompra objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdAprobarOrdenCompra(?,?)");
            cs.setInt(1, objeto.getIdOrdenCompra());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<OrdenCompra> buscar(OrdenCompra ordencompra) throws Exception {
        ArrayList<OrdenCompra> lista = new ArrayList<OrdenCompra>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListOrdenCompra(?)");
            cs.setString(1, ordencompra.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                OrdenCompra objeto = new OrdenCompra();
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setFechaEntrega(rs.getString("Fechaentrega"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setIGV(rs.getDouble("IGV"));
                objeto.setSubtotal(rs.getDouble("Subtotal"));
                objeto.setTotal(rs.getDouble("Total"));                
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));                
                objeto.setNumero(rs.getString("Numero"));
                objeto.setEstado(rs.getString("Estado"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<ReferenciaCompra> buscarReferencia(OrdenCompra ordencompra) throws Exception {
        ArrayList<ReferenciaCompra> lista = new ArrayList<ReferenciaCompra>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListReferenciaOrdenCompra(?)");
            cs.setInt(1, ordencompra.getIdOrdenCompra());
            rs = cs.executeQuery();
            while (rs.next()) {
                ReferenciaCompra objeto = new ReferenciaCompra();
                objeto.setIdAlmacen(rs.getInt("IdAlmacen"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setIdSucursal(rs.getInt("IdSucursal"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setDAlmacen(rs.getString("DAlmacen"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setDSucursal(rs.getString("DSucursal"));
                objeto.setCodigoProducto(rs.getString("CodigoProducto"));
                objeto.setNumero(rs.getString("Numero"));
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
