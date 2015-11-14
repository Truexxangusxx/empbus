package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class PedidoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static PedidoDAO instancia;

    public static PedidoDAO getInstancia() {
        if (instancia == null) {
            instancia = new PedidoDAO();
        }
        return instancia;
    }

    public int ingresar(Pedido objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsPedido(?,?,?,?,?,?,?,?,?,?)");
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

    public Pedido obtener(int id) throws Exception {
        Pedido objeto = new Pedido();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetPedido(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdPedido(rs.getInt("Idpedido"));
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
                objeto.setIdOrdenProduccion(rs.getInt("Idordenproduccion"));
                objeto.setIdEmpleado(rs.getInt("Idempleado"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDEmpleado(rs.getString("DEmpleado"));
                objeto.setDOrdenProduccion(rs.getString("DOrdenProduccion"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setObservaciones(rs.getString("Observaciones"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Pedido objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdPedido(?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdPedido());
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
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Pedido objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarPedido(?,?)");
            cs.setInt(1, objeto.getIdPedido());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Pedido> buscar(Pedido pedido) throws Exception {
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListPedido(?)");
            cs.setString(1, pedido.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                Pedido objeto = new Pedido();
                objeto.setIdPedido(rs.getInt("Idpedido"));
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
                objeto.setIdOrdenProduccion(rs.getInt("Idordenproduccion"));
                objeto.setIdEmpleado(rs.getInt("Idempleado"));
                objeto.setEstado(rs.getString("Estado"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDEmpleado(rs.getString("DEmpleado"));
                objeto.setDOrdenProduccion(rs.getString("DOrdenProduccion"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFecha(rs.getString("Fecha"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public int obtenerUltimo() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimoPedido()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("Idpedido");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<PedidoProducto> buscardetalle(Pedido pedido) throws Exception {
        ArrayList<PedidoProducto> lista = new ArrayList<PedidoProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListPedidoProducto(?)");
            cs.setInt(1, pedido.getIdPedido());
            rs = cs.executeQuery();
            while (rs.next()) {
                PedidoProducto objeto = new PedidoProducto();
                objeto.setIdPedidoProducto(rs.getInt("IdPedidoProducto"));
                objeto.setIdPedido(rs.getInt("Idpedido"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigoProducto(rs.getString("CodigoProducto"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setGlosa(rs.getString("Glosa"));                
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
