package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class OrdenServicioDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static OrdenServicioDAO instancia;

    public static OrdenServicioDAO getInstancia() {
        if (instancia == null) {
            instancia = new OrdenServicioDAO();
        }
        return instancia;
    }

    public int ingresar(OrdenServicio objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsOrdenServicio(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getIdCentroCosto());
            cs.setInt(3, objeto.getIdFormaPago());
            cs.setInt(4, objeto.getIdMoneda());
            cs.setInt(5, objeto.getIdClienteProveedor());
            cs.setString(6, objeto.getFecha());
            cs.setDouble(7, objeto.getTipoCambio());
            cs.setString(8, objeto.getFechaEntrega());
            cs.setString(9, objeto.getObservaciones());
            cs.setDouble(10, objeto.getIGV());
            cs.setDouble(11, objeto.getSubtotal());
            cs.setDouble(12, objeto.getMonto());
            cs.setString(13, objeto.getNumero());
            cs.setString(14, usuario.getNick());
            cs.setString(15, xml);
            cs.setInt(16, objeto.getIdSucursal());
            cs.setBoolean(17, objeto.getAfecto());
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public OrdenServicio obtener(int id) throws Exception {
        OrdenServicio objeto = new OrdenServicio();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetOrdenServicio(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdOrdenServicio(rs.getInt("Idordenservicio"));                
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setFechaEntrega(rs.getString("Fechaentrega"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setIGV(rs.getDouble("IGV"));
                objeto.setSubtotal(rs.getDouble("Subtotal"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setDFormaPago(rs.getString("DFormaPago"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDSucursal(rs.getString("DSucursal"));
                objeto.setIdSucursal(rs.getInt("IdSucursal"));
                objeto.setRucProveedor(rs.getString("rucProveedor"));
                objeto.setAfecto(rs.getBoolean("Afecto"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(OrdenServicio objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdOrdenServicio(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdOrdenServicio());
            cs.setInt(2, objeto.getIdCentroCosto());
            cs.setInt(3, objeto.getIdFormaPago());
            cs.setInt(4, objeto.getIdMoneda());
            cs.setInt(5, objeto.getIdClienteProveedor());
            cs.setString(6, objeto.getFecha());
            cs.setDouble(7, objeto.getTipoCambio());
            cs.setString(8, objeto.getFechaEntrega());
            cs.setString(9, objeto.getObservaciones());
            cs.setDouble(10, objeto.getIGV());
            cs.setDouble(11, objeto.getSubtotal());
            cs.setDouble(12, objeto.getMonto());
            cs.setString(13, objeto.getNumero());
            cs.setString(14, usuario.getNick());
            cs.setString(15, xml);
            cs.setInt(16, objeto.getIdSucursal());
            cs.setBoolean(17, objeto.getAfecto());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(OrdenServicio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarOrdenServicio(?,?)");
            cs.setInt(1, objeto.getIdOrdenServicio());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public int ultimoID() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimoIdOrdenServicio()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idOrdenServicio");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<OrdenServicioProducto> obtenerDetalle(int id) throws Exception {
        ArrayList<OrdenServicioProducto> lista = new ArrayList<OrdenServicioProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListOrdenServicioProducto(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                OrdenServicioProducto objeto = new OrdenServicioProducto();
                objeto.setIdOrdenServicioProducto(rs.getInt("IdOrdenServicioProducto"));
                objeto.setIdOrdenServicio(rs.getInt("Idordenservicio"));
                objeto.setIdOrdenProduccion(rs.getInt("IdOrdenProduccion"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setImporte(rs.getInt("Importe"));
                objeto.setDOrdenProduccion(rs.getString("DOrdenProduccion"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setDUnidadMedida(rs.getString("DUnidadMedida"));
                objeto.setDescuento(rs.getDouble("Descuento"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setPrecioUnitario(rs.getInt("PrecioUnitario"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<OrdenServicio> buscar(OrdenServicio ordenservicio) throws Exception {
        ArrayList<OrdenServicio> lista = new ArrayList<OrdenServicio>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListOrdenServicio(?)");
            cs.setString(1, ordenservicio.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                OrdenServicio objeto = new OrdenServicio();
                objeto.setIdOrdenServicio(rs.getInt("Idordenservicio"));                
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setFechaEntrega(rs.getString("Fechaentrega"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setIGV(rs.getDouble("IGV"));
                objeto.setSubtotal(rs.getDouble("Subtotal"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setDFormaPago(rs.getString("DFormaPago"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDSucursal(rs.getString("DSucursal"));
                objeto.setAfecto(rs.getBoolean("Afecto"));
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
