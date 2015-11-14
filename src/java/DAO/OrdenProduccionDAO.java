package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class OrdenProduccionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static OrdenProduccionDAO instancia;

    public static OrdenProduccionDAO getInstancia() {
        if (instancia == null) {
            instancia = new OrdenProduccionDAO();
        }
        return instancia;
    }

    public int ingresar(OrdenProduccion objeto, Usuario usuario) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsOrdenProduccion(?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getIdSucursal());
            cs.setInt(3, objeto.getIdProducto());
            cs.setInt(4, objeto.getIdTipoOrdenProduccion());
            cs.setString(5, objeto.getFecha());
            cs.setString(6, objeto.getFechaInicio());
            cs.setString(7, objeto.getFechaTermino());
            cs.setString(8, objeto.getObservaciones());
            cs.setDouble(9, objeto.getMonto());
            cs.setString(10, usuario.getNick());
            cs.setInt(11, objeto.getIdCentroCosto());
            cs.setInt(12, objeto.getIdClienteProveedor());
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public OrdenProduccion obtener(int id) throws Exception {
        OrdenProduccion objeto = new OrdenProduccion();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetOrdenProduccion(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdOrdenProduccion(rs.getInt("Idordenproduccion"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setIdCotizacion(rs.getInt("Idcotizacion"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFechaInicio(rs.getString("Fechainicio"));
                objeto.setFechaTermino(rs.getString("Fechatermino"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDProductoPrincipal(rs.getString("DProductoPrincipal"));
                objeto.setDCotizacion(rs.getString("DCotizacion"));
                objeto.setDSucursal(rs.getString("DSucursal"));
                objeto.setIdTipoOrdenProduccion(rs.getInt("IdTipoOrdenProduccion"));
                objeto.setIdCentroCosto(rs.getInt("IdCentroCosto"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setIdClienteProveedor(rs.getInt("IdClienteProveedor"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(OrdenProduccion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdOrdenProduccion(?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdOrdenProduccion());
            cs.setInt(2, objeto.getIdSucursal());
            cs.setInt(3, objeto.getIdProducto());
            cs.setString(4, objeto.getFecha());
            cs.setString(5, objeto.getNumero());
            cs.setString(6, objeto.getFechaInicio());
            cs.setString(7, objeto.getFechaTermino());
            cs.setString(8, objeto.getObservaciones());
            cs.setDouble(9, objeto.getMonto());
            cs.setString(10, usuario.getNick());
            cs.setInt(11, objeto.getIdCentroCosto());
            cs.setInt(12, objeto.getIdClienteProveedor());            
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(OrdenProduccion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarOrdenProduccion(?,?)");
            cs.setInt(1, objeto.getIdOrdenProduccion());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public int ultimoid() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimoIdOrdenProduccion()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idOrdenProduccion");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<OrdenProduccion> buscar(OrdenProduccion orden) throws Exception {
        ArrayList<OrdenProduccion> lista = new ArrayList<OrdenProduccion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListOrdenProduccion(?)");
            cs.setString(1, orden.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                OrdenProduccion objeto = new OrdenProduccion();
                objeto.setIdOrdenProduccion(rs.getInt("Idordenproduccion"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setIdCotizacion(rs.getInt("Idcotizacion"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFechaInicio(rs.getString("Fechainicio"));
                objeto.setFechaTermino(rs.getString("Fechatermino"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDProductoPrincipal(rs.getString("DProductoPrincipal"));
                objeto.setDCotizacion(rs.getString("DCotizacion"));
                objeto.setDSucursal(rs.getString("DSucursal"));
                objeto.setIdTipoOrdenProduccion(rs.getInt("IdTipoOrdenProduccion"));
                objeto.setIdCentroCosto(rs.getInt("IdCentroCosto"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setIdClienteProveedor(rs.getInt("IdClienteProveedor"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<ReferenciaMaterialesOP> buscarReferenciaMateriales(OrdenProduccion ordenproduccion) throws Exception {
        ArrayList<ReferenciaMaterialesOP> lista = new ArrayList<ReferenciaMaterialesOP>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListReferenciaMaterialesOP(?)");
            cs.setInt(1, ordenproduccion.getIdOrdenProduccion());
            rs = cs.executeQuery();
            while (rs.next()) {
                ReferenciaMaterialesOP objeto = new ReferenciaMaterialesOP();
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
    
    public ArrayList<Estandar> buscarEstandar(OrdenProduccion ordenproduccion) throws Exception {
        ArrayList<Estandar> lista = new ArrayList<Estandar>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListEstandarPorOP(?)");
            cs.setInt(1, ordenproduccion.getIdOrdenProduccion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Estandar objeto = new Estandar();
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
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
    
    public ArrayList<ReferenciaServiciosOP> buscarReferenciaServicios(OrdenProduccion ordenproduccion) throws Exception {
        ArrayList<ReferenciaServiciosOP> lista = new ArrayList<ReferenciaServiciosOP>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListReferenciaServiciosOP(?)");
            cs.setInt(1, ordenproduccion.getIdOrdenProduccion());
            rs = cs.executeQuery();
            while (rs.next()) {
                ReferenciaServiciosOP objeto = new ReferenciaServiciosOP();
                objeto.setIdOrdenServicio(rs.getInt("IdOrdenServicio"));
                objeto.setIdCentroCosto(rs.getInt("IdCentroCosto"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDOrdenServicio(rs.getString("DOrdenServicio"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setImporte(rs.getDouble("Importe"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public int GenerarPedido(Pedido objeto, Usuario usuario, String xml) throws Exception {
       int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdGenerarPedido(?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);            
            cs.setInt(2, objeto.getIdCentroCosto());
            cs.setInt(3, objeto.getIdOrdenProduccion());
            cs.setInt(4, objeto.getIdEmpleado());
            cs.setString(5, objeto.getEstado());
            cs.setString(6, objeto.getNumero());
            cs.setString(7, objeto.getFecha());
            cs.setString(8, usuario.getNick());
            cs.setString(9, xml);
            cs.setString(10, objeto.getObservaciones());
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
}
