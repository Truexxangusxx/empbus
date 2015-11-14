package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoCambioDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoCambioDAO instancia;

    public static TipoCambioDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoCambioDAO();
        }
        return instancia;
    }
    
    public void ingresar(TipoCambio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoCambio(?,?,?,?,?)");
            cs.setInt(1, objeto.getIdMonedaCobra());
            cs.setInt(2, objeto.getIdMonedaPago());
            cs.setDouble(3, objeto.getValor());
            cs.setString(4, objeto.getFecha());
            cs.setString(5, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public TipoCambio obtener(TipoCambio tipocambio) throws Exception {
        TipoCambio objeto = new TipoCambio();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoCambio(?,?)");
            cs.setInt(1, tipocambio.getIdMonedaPago());
            cs.setInt(2, tipocambio.getIdMonedaCobra());
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoCambio(rs.getInt("IdTipoCambio"));
                objeto.setIdMonedaPago(rs.getInt("IdMonedaPago"));
                objeto.setIdMonedaCobra(rs.getInt("IdMonedaCobra"));
                objeto.setDMonedaPago(rs.getString("DMonedaPago"));
                objeto.setDMonedaCobra(rs.getString("DMonedaCobra"));
                objeto.setValor(rs.getDouble("Valor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }
    
    public TipoCambio obtenerTipoCambioPorFecha(String Fecha, int idMonedaPago, int idMonedaCobra) throws Exception {
        TipoCambio objeto = new TipoCambio();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoCambioPorFechaSoles(?,?,?)");
            cs.setString(1, Fecha);
            cs.setInt(2, idMonedaPago);
            cs.setInt(3, idMonedaCobra);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoCambio(rs.getInt("IdTipoCambio"));
                objeto.setIdMonedaPago(rs.getInt("IdMonedaPago"));
                objeto.setIdMonedaCobra(rs.getInt("IdMonedaCobra"));
                objeto.setDMonedaPago(rs.getString("DMonedaPago"));
                objeto.setDMonedaCobra(rs.getString("DMonedaCobra"));
                objeto.setValor(rs.getDouble("Valor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }
    
    public double obtenervalor(int MonedaPago, int MonedaCobro) throws Exception {
        TipoCambio objeto = new TipoCambio();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoCambio(?,?)");
            cs.setInt(1, MonedaPago);
            cs.setInt(2, MonedaCobro);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoCambio(rs.getInt("IdTipoCambio"));
                objeto.setIdMonedaPago(rs.getInt("IdMonedaPago"));
                objeto.setIdMonedaCobra(rs.getInt("IdMonedaCobra"));
                objeto.setDMonedaPago(rs.getString("DMonedaPago"));
                objeto.setDMonedaCobra(rs.getString("DMonedaCobra"));
                objeto.setValor(rs.getDouble("Valor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto.getValor();
    }
    
    public ArrayList<TipoCambio> buscar(TipoCambio entidad) throws Exception {
        ArrayList<TipoCambio> lista = new ArrayList<TipoCambio>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoCambio(?,?,?)");
            cs.setString(1, entidad.getFecha());
            cs.setInt(2, entidad.getIdMonedaPago());
            cs.setInt(3, entidad.getIdMonedaCobra());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoCambio objeto = new TipoCambio();
                objeto.setIdTipoCambio(rs.getInt("IdTipoCambio"));
                objeto.setIdMonedaPago(rs.getInt("IdMonedaPago"));
                objeto.setIdMonedaCobra(rs.getInt("IdMonedaCobra"));
                objeto.setDMonedaPago(rs.getString("DMonedaPago"));
                objeto.setDMonedaCobra(rs.getString("DMonedaCobra"));
                objeto.setValor(rs.getDouble("Valor"));
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
    
    public void eliminar(TipoCambio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoCambio(?,?)");
            cs.setInt(1, objeto.getIdTipoCambio());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public void editar(TipoCambio objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoCambio(?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoCambio());
            cs.setInt(2, objeto.getIdMonedaCobra());
            cs.setInt(3, objeto.getIdMonedaPago());
            cs.setDouble(4, objeto.getValor());
            cs.setString(5, objeto.getFecha());
            cs.setString(6, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    
}
