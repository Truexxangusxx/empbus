package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class SalidaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static SalidaDAO instancia;

    public static SalidaDAO getInstancia() {
        if (instancia == null) {
            instancia = new SalidaDAO();
        }
        return instancia;
    }

    public int ingresar(Salida objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsSalida(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getIdAlmacen());
            cs.setInt(3, objeto.getIdTipoMovimiento());
            cs.setInt(4, objeto.getIdPedido());
            /*cs.setInt(5, objeto.getIdClienteProveedor());*/
            cs.setInt(5, objeto.getEmpleado().getIdEmpleado());
            cs.setInt(6, objeto.getIdMoneda());
            cs.setString(7, objeto.getFecha());
            cs.setString(8, objeto.getNumero());
            cs.setDouble(9, objeto.getTipoCambio());
            cs.setString(10, objeto.getObservaciones());
            cs.setDouble(11, objeto.getTipoCambioMoneda());
            cs.setString(12, usuario.getNick());
            cs.setString(13, xml);
            cs.setInt(14, objeto.getIdSubdiario());
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public Salida obtener(int id) throws Exception {
        Salida objeto = new Salida();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetSalida(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdSalida(rs.getInt("Idsalida"));
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
                objeto.setIdPedido(rs.getInt("Idpedido"));
                Empleado empleado = new Empleado();
                empleado.setIdEmpleado(rs.getInt("IdEmpleado"));
                empleado.setNombre(rs.getString("DEmpleado"));
                objeto.setEmpleado(empleado);
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setTipoCambioMoneda(rs.getDouble("Tipocambiomoneda"));
                objeto.setDAlmacen(rs.getString("DAlmacen"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDPedido(rs.getString("DOrdenProduccion"));
                objeto.setIdSubdiario(rs.getInt("idsubdiario"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Salida objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdSalida(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdSalida());
            cs.setInt(2, objeto.getIdAlmacen());
            cs.setInt(3, objeto.getIdTipoMovimiento());
            cs.setInt(4, objeto.getIdPedido());            
            cs.setInt(5, objeto.getEmpleado().getIdEmpleado());
            cs.setInt(6, objeto.getIdMoneda());
            cs.setString(7, objeto.getFecha());
            cs.setString(8, objeto.getNumero());
            cs.setDouble(9, objeto.getTipoCambio());
            cs.setString(10, objeto.getObservaciones());
            cs.setDouble(11, objeto.getTipoCambioMoneda());
            cs.setString(12, usuario.getNick());
            cs.setString(13, xml);
            cs.setInt(14, objeto.getIdSubdiario());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Salida objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarSalida(?,?)");
            cs.setInt(1, objeto.getIdSalida());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public int obtenerUltimo() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimaSalida()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("Idsalida");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
public ArrayList<Salida> buscar(Salida salida) throws Exception {
        ArrayList<Salida> lista = new ArrayList<Salida>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListSalida(?,?)");
            cs.setString(1, salida.getNumero());
            cs.setInt(2, salida.getIdPedido());
            rs = cs.executeQuery();
            while (rs.next()) {
                Salida objeto = new Salida();
                objeto.setIdSalida(rs.getInt("Idsalida"));
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
                objeto.setIdPedido(rs.getInt("IdPedido"));
                Empleado empleado = new Empleado();
                empleado.setIdEmpleado(rs.getInt("IdEmpleado"));
                empleado.setNombre(rs.getString("DEmpleado"));
                objeto.setEmpleado(empleado);
                
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setTipoCambioMoneda(rs.getDouble("Tipocambiomoneda"));
                objeto.setDAlmacen(rs.getString("DAlmacen"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDPedido(rs.getString("DPedido"));
                objeto.setDTipoMovimiento(rs.getString("DTipoMovimiento"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }    
public ArrayList<SalidaProducto> buscarDetalle(Salida salida) throws Exception {
        ArrayList<SalidaProducto> lista = new ArrayList<SalidaProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListSalidaProducto(?)");
            cs.setInt(1, salida.getIdSalida());
            rs = cs.executeQuery();
            while (rs.next()) {
                SalidaProducto objeto = new SalidaProducto();
                objeto.setIdSalidaProducto(rs.getInt("IdSalidaProducto"));
                objeto.setIdSalida(rs.getInt("Idsalida"));
                objeto.setIdCentroCosto(rs.getInt("IdCentroCosto"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setDUnidadMedida(rs.getString("DUnidadMedida"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setEstandar(rs.getInt("Estandar"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setPrecio(rs.getDouble("Precio"));
                objeto.setStock(rs.getInt("Stock"));
                
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
