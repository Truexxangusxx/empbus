package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class DetalleProvisionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static DetalleProvisionDAO instancia;

    public static DetalleProvisionDAO getInstancia() {
        if (instancia == null) {
            instancia = new DetalleProvisionDAO();
        }
        return instancia;
    }

    public void ingresar(DetalleProvision objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsDetalleProvision(?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdProvision());
            cs.setInt(2, objeto.getIdIngreso());
            cs.setInt(3, objeto.getIdCuenta());
            cs.setInt(4, objeto.getIdCentroCosto());
            cs.setDouble(5, objeto.getImporte());
            cs.setString(6, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public DetalleProvision obtener(int id) throws Exception {
        DetalleProvision objeto = new DetalleProvision();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetDetalleProvision(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdDetalleProvision(rs.getInt("Iddetalleprovision"));
                objeto.setIdProvision(rs.getInt("Idprovision"));
                objeto.setIdIngreso(rs.getInt("Idingreso"));
                objeto.setIdCuenta(rs.getInt("Idcuenta"));
                objeto.setIdCentroCosto(rs.getInt("Idcentrocosto"));
                objeto.setImporte(rs.getDouble("Importe"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(DetalleProvision objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdDetalleProvision(?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdDetalleProvision());
            cs.setInt(2, objeto.getIdProvision());
            cs.setInt(3, objeto.getIdIngreso());
            cs.setInt(4, objeto.getIdCuenta());
            cs.setInt(5, objeto.getIdCentroCosto());
            cs.setDouble(6, objeto.getImporte());
            cs.setString(7, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(DetalleProvision objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarDetalleProvision(?,?)");
            cs.setInt(1, objeto.getIdDetalleProvision());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<DetalleProvision> buscar(DetalleProvision detalle) throws Exception {
        ArrayList<DetalleProvision> lista = new ArrayList<DetalleProvision>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleProvision(?)");
            cs.setInt(1, detalle.getIdProvision());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleProvision objeto = new DetalleProvision();
                objeto.setIdDetalleProvision(rs.getInt("Iddetalleprovision"));
                objeto.setIdProvision(rs.getInt("Idprovision"));
                objeto.setIdIngreso(rs.getInt("Idingreso"));
                objeto.setDIngreso(rs.getString("DIngreso"));

                Cuenta cuenta = new Cuenta();
                cuenta.setIdCuenta(rs.getInt("Idcuenta"));
                cuenta.setDescripcion(rs.getString("Dcuenta"));
                objeto.setCuenta(cuenta);
                
                CentroCosto centro = new CentroCosto();
                centro.setIdCentroCosto(rs.getInt("Idcentrocosto"));
                centro.setDescripcion(rs.getString("Dcentrocosto"));
                centro.setCodigo(rs.getString("Codigo"));
                objeto.setCentroCosto(centro);
                objeto.setImporte(rs.getDouble("Importe"));
                
                OrdenProduccion op = new OrdenProduccion();
                op.setIdOrdenProduccion(rs.getInt("IdOrdenProduccion"));
                op.setNumero(rs.getString("Dordenproduccion"));
                objeto.setOrdenProduccion(op);
                
                objeto.setDescripcion(rs.getString("Descripcion"));
                
                
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<DetalleProvision> ListarPorOC(OrdenCompra ordencompra, Provision provision) throws Exception {
        ArrayList<DetalleProvision> lista = new ArrayList<DetalleProvision>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleProvisionOC(?,?)");
            cs.setInt(1, ordencompra.getIdOrdenCompra());
            cs.setInt(2, provision.getIdProvision());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleProvision objeto = new DetalleProvision();
                                
                CentroCosto centro = new CentroCosto();
                objeto.setCentroCosto(centro);
                
                objeto.setIdIngreso(rs.getInt("idIngreso"));
                objeto.setReferencia(rs.getString("Referencia"));
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
}
