package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class GuiaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static GuiaDAO instancia;

    public static GuiaDAO getInstancia() {
        if (instancia == null) {
            instancia = new GuiaDAO();
        }
        return instancia;
    }

    public void ingresar(Guia objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsGuia(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setString(1, objeto.getPeriodo());
            cs.setString(2, objeto.getNumero());
            cs.setString(3, objeto.getFecha());
            cs.setDouble(4, objeto.getTipoCambio());
            cs.setString(5, objeto.getSerie());
            cs.setString(6, objeto.getNumeroDocumento());
            cs.setInt(7, objeto.getIdTipoMovimiento());
            cs.setString(8, objeto.getReferencia());
            cs.setInt(9, objeto.getIdOrdenProduccion());
            cs.setInt(10, objeto.getIdClienteProveedor());
            cs.setInt(11, objeto.getIdAlmacen());
            cs.setString(12, objeto.getObservaciones());
            cs.setString(13, usuario.getNick());
            cs.setString(14, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Guia obtener(int id) throws Exception {
        Guia objeto = new Guia();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetGuia(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdGuia(rs.getInt("Idguia"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setSerie(rs.getString("Serie"));
                objeto.setNumeroDocumento(rs.getString("Numerodocumento"));
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
                objeto.setReferencia(rs.getString("Referencia"));
                objeto.setIdOrdenProduccion(rs.getInt("Idordenproduccion"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setDOrdenProduccion(rs.getString("DOrdenProduccion"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Guia objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdGuia(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdGuia());
            cs.setString(2, objeto.getPeriodo());
            cs.setString(3, objeto.getNumero());
            cs.setString(4, objeto.getFecha());
            cs.setDouble(5, objeto.getTipoCambio());
            cs.setString(6, objeto.getSerie());
            cs.setString(7, objeto.getNumeroDocumento());
            cs.setInt(8, objeto.getIdTipoMovimiento());
            cs.setString(9, objeto.getReferencia());
            cs.setInt(10, objeto.getIdOrdenProduccion());
            cs.setInt(11, objeto.getIdClienteProveedor());
            cs.setInt(12, objeto.getIdAlmacen());
            cs.setString(13, objeto.getObservaciones());
            cs.setString(14, usuario.getNick());
            cs.setString(15, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Guia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarGuia(?,?)");
            cs.setInt(1, objeto.getIdGuia());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public int UltimoID() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimaGuia()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idGuia");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
}
