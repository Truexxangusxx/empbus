package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class CotizacionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static CotizacionDAO instancia;

    public static CotizacionDAO getInstancia() {
        if (instancia == null) {
            instancia = new CotizacionDAO();
        }
        return instancia;
    }

    public int ingresar(Cotizacion objeto, String Usuario, String xml, String xmlCarcateristicas) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsCotizacion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdClienteProveedor());
            cs.setInt(2, objeto.getIdModeloChasis());
            cs.setString(3, objeto.getFecha());
            cs.setInt(4, objeto.getNumeroChasis());
            cs.setInt(5, objeto.getNumeroAsientos());
            cs.setInt(6, objeto.getNumeroParabrisas());
            cs.setString(7, objeto.getVentanas());
            cs.setString(8, objeto.getTipoCarroceria());
            cs.setString(9, objeto.getColorFondo());
            cs.setString(10, objeto.getColorArtes());
            cs.setString(11, objeto.getColorOtros());
            cs.setString(12, objeto.getObservaciones());
            cs.setString(13, Usuario);
            cs.setString(14, xml);
            cs.setString(15, xmlCarcateristicas);
            cs.registerOutParameter(16, Types.INTEGER);
            cs.setDouble(17, objeto.getMonto());
            cs.setDouble(18, objeto.getProducto().getIdProducto());
            cs.setDouble(19, objeto.getCentrocosto().getIdCentroCosto());
            cs.execute();
            id = Integer.parseInt(cs.getObject(16).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public Cotizacion obtener(int id) throws Exception {
        Cotizacion objeto = new Cotizacion();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetCotizacion(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdCotizacion(rs.getInt("Idcotizacion"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setIdModeloChasis(rs.getInt("Idmodelochasis"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumeroChasis(rs.getInt("Numerochasis"));
                objeto.setNumeroAsientos(rs.getInt("Numeroasientos"));
                objeto.setNumeroParabrisas(rs.getInt("Numeroparabrisas"));
                objeto.setVentanas(rs.getString("Ventanas"));
                objeto.setTipoCarroceria(rs.getString("Tipocarroceria"));
                objeto.setColorFondo(rs.getString("Colorfondo"));
                objeto.setColorArtes(rs.getString("Colorartes"));
                objeto.setColorOtros(rs.getString("Colorotros"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setSerie(rs.getString("Serie"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setMonto(rs.getDouble("Monto"));
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setDescripcion(rs.getString("DProducto"));
                producto.setCodigo(rs.getString("CodigoProducto"));
                objeto.setProducto(producto);
                CentroCosto centro = new CentroCosto();
                centro.setIdCentroCosto(rs.getInt("idCentroCosto"));
                centro.setDescripcion(rs.getString("DCentroCosto"));
                objeto.setCentrocosto(centro);
                objeto.setRuc(rs.getString("Ruc"));
                objeto.setDModeloChasis(rs.getString("DModeloChasis"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Cotizacion objeto, String Usuario, String xml, String xmlCarcateristicas) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdCotizacion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdCotizacion());
            cs.setInt(2, objeto.getIdClienteProveedor());
            cs.setInt(3, objeto.getIdModeloChasis());
            cs.setString(4, objeto.getFecha());
            cs.setInt(5, objeto.getNumeroChasis());
            cs.setInt(6, objeto.getNumeroAsientos());
            cs.setInt(7, objeto.getNumeroParabrisas());
            cs.setString(8, objeto.getVentanas());
            cs.setString(9, objeto.getTipoCarroceria());
            cs.setString(10, objeto.getColorFondo());
            cs.setString(11, objeto.getColorArtes());
            cs.setString(12, objeto.getColorOtros());
            cs.setString(13, objeto.getObservaciones());
            cs.setString(14, Usuario);            
            cs.setString(15, xml);
            cs.setString(16, xmlCarcateristicas);
            cs.setDouble(17, objeto.getMonto());
            cs.setDouble(18, objeto.getProducto().getIdProducto());
            cs.setDouble(19, objeto.getCentrocosto().getIdCentroCosto());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Cotizacion objeto, String Usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarCotizacion(?,?)");
            cs.setInt(1, objeto.getIdCotizacion());
            cs.setString(2, Usuario);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Cotizacion> buscar(Cotizacion cotizacion) throws Exception {
        ArrayList<Cotizacion> lista = new ArrayList<Cotizacion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListCotizacion(?,?)");
            cs.setInt(1, cotizacion.getIdClienteProveedor());
            cs.setString(2, cotizacion.getSerie());
            rs = cs.executeQuery();
            while (rs.next()) {
                Cotizacion objeto = new Cotizacion();
                objeto.setIdCotizacion(rs.getInt("Idcotizacion"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setIdModeloChasis(rs.getInt("Idmodelochasis"));
                objeto.setDModeloChasis(rs.getString("DModeloChasis"));
                objeto.setSerie(rs.getString("Serie"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumeroChasis(rs.getInt("Numerochasis"));                
                objeto.setTipoCarroceria(rs.getString("Tipocarroceria"));
                objeto.setNumeroAsientos(rs.getInt("NumeroAsientos"));
                objeto.setNumeroParabrisas(rs.getInt("NumeroParabrisas"));
                objeto.setVentanas(rs.getString("Ventanas"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setColorFondo(rs.getString("ColorFondo"));                
                objeto.setColorArtes(rs.getString("ColorArtes"));
                objeto.setColorOtros(rs.getString("ColorOtros"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<CotizacionProducto> obtenerCotizacionProducto(Cotizacion cotizacion) throws Exception {
        ArrayList<CotizacionProducto> lista = new ArrayList<CotizacionProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListCotizacionProducto(?)");
            cs.setInt(1, cotizacion.getIdCotizacion());
            rs = cs.executeQuery();
            while (rs.next()) {
                CotizacionProducto objeto = new CotizacionProducto();
                objeto.setIdCotizacionProducto(rs.getInt("idCotizacionProducto"));
                objeto.setIdCotizacion(rs.getInt("IdCotizacion"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setSubTotal(rs.getDouble("SubTotal"));
                objeto.setCodigoProducto(rs.getString("CodigoProducto"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public int id() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimoIdCotizacion()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idCotizacion");                
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<CotizacionCaracteristicas> obtenerCotizacionCaracteristicas(Cotizacion cotizacion) throws Exception {
        ArrayList<CotizacionCaracteristicas> lista = new ArrayList<CotizacionCaracteristicas>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListCotizacionCaracteristicas(?)");
            cs.setInt(1, cotizacion.getIdCotizacion());
            rs = cs.executeQuery();
            while (rs.next()) {
                CotizacionCaracteristicas objeto = new CotizacionCaracteristicas();
                objeto.setIdCotizacionCaracteristicas(rs.getInt("IdCotizacionCaracteristicas"));
                objeto.setIdCotizacion(rs.getInt("IdCotizacion"));
                objeto.setIdCaracteristicas(rs.getInt("IdCaracteristicas"));
                objeto.setValor(rs.getString("Valor"));
                objeto.setEstado(rs.getBoolean("Estado"));
                objeto.setDCaracteristicas(rs.getString("DCaracteristicas"));
                objeto.setDTipoCaracteristica(rs.getString("DTipoCaracteristica"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public void aprobar(Cotizacion objeto, String Usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdAprobarCotizacion(?,?)");
            cs.setInt(1, objeto.getIdCotizacion());
            cs.setString(2, Usuario);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
}
