package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ProvisionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ProvisionDAO instancia;

    public static ProvisionDAO getInstancia() {
        if (instancia == null) {
            instancia = new ProvisionDAO();
        }
        return instancia;
    }

    public void ingresar(Provision objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsProvision(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setString(1, objeto.getPeriodo());
            cs.setString(2, objeto.getFecha());
            cs.setInt(3, objeto.getIdOrdenCompra());
            cs.setInt(4, objeto.getIdOrdenServicio());
            cs.setString(5, objeto.getServicioCompra());
            cs.setInt(6, objeto.getIdSucursal());
            cs.setInt(7, objeto.getIdTipoCompra());
            cs.setString(8, objeto.getCodigo());
            cs.setString(9, objeto.getRazonSocial());
            cs.setString(10, objeto.getRuc());
            cs.setString(11, objeto.getGlosa());
            cs.setString(12, objeto.getTipoDocumento());
            cs.setString(13, objeto.getSerie());
            cs.setString(14, objeto.getNumeroDocumento());
            cs.setString(15, objeto.getFechaDocumento());
            cs.setInt(16, objeto.getIdFormaPago());
            cs.setString(17, objeto.getFechaVencimiento());
            cs.setInt(18, objeto.getIdMoneda());
            cs.setDouble(19, objeto.getTipoCambio());
            cs.setDouble(20, objeto.getTipoAdquisicion());
            cs.setDouble(21, objeto.getIgv());
            cs.setDouble(22, objeto.getPercepcion());
            cs.setDouble(23, objeto.getRenta());
            cs.setDouble(24, objeto.getAporte());
            cs.setDouble(25, objeto.getTasa());
            cs.setDouble(26, objeto.getImporte());
            cs.setDouble(27, objeto.getBaseAfecta());
            cs.setDouble(28, objeto.getInafecto());
            cs.setDouble(29, objeto.getIgvDocumento());
            cs.setDouble(30, objeto.getPercepcionAfecta());
            cs.setDouble(31, objeto.getRentaAfecta());
            cs.setDouble(32, objeto.getAportePension());
            cs.setDouble(33, objeto.getTotal());
            cs.setString(34, usuario.getNick());
            cs.setString(35, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Provision obtener(int id) throws Exception {
        Provision objeto = new Provision();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetProvision(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdProvision(rs.getInt("Idprovision"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdOrdenServicio(rs.getInt("Idordenservicio"));
                objeto.setServicioCompra(rs.getString("Serviciocompra"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setIdTipoCompra(rs.getInt("Idtipocompra"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setRazonSocial(rs.getString("Razonsocial"));
                objeto.setRuc(rs.getString("Ruc"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setTipoDocumento(rs.getString("Tipodocumento"));
                objeto.setSerie(rs.getString("Serie"));
                objeto.setNumeroDocumento(rs.getString("Numerodocumento"));
                objeto.setFechaDocumento(rs.getString("Fechadocumento"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setFechaVencimiento(rs.getString("Fechavencimiento"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setTipoAdquisicion(rs.getDouble("Tipoadquisicion"));
                objeto.setIgv(rs.getDouble("Igv"));
                objeto.setPercepcion(rs.getDouble("Percepcion"));
                objeto.setRenta(rs.getDouble("Renta"));
                objeto.setAporte(rs.getDouble("Aporte"));
                objeto.setTasa(rs.getDouble("Tasa"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setBaseAfecta(rs.getDouble("Baseafecta"));
                objeto.setInafecto(rs.getDouble("Inafecto"));
                objeto.setIgvDocumento(rs.getDouble("Igvdocumento"));
                objeto.setPercepcionAfecta(rs.getDouble("Percepcionafecta"));
                objeto.setRentaAfecta(rs.getDouble("Rentaafecta"));
                objeto.setAportePension(rs.getDouble("Aportepension"));
                objeto.setTotal(rs.getDouble("Total"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Provision objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdProvision(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdProvision());
            cs.setString(2, objeto.getFecha());
            cs.setInt(3, objeto.getIdOrdenCompra());
            cs.setInt(4, objeto.getIdOrdenServicio());
            cs.setString(5, objeto.getServicioCompra());
            cs.setInt(6, objeto.getIdSucursal());
            cs.setInt(7, objeto.getIdTipoCompra());
            cs.setString(8, objeto.getCodigo());
            cs.setString(9, objeto.getRazonSocial());
            cs.setString(10, objeto.getRuc());
            cs.setString(11, objeto.getGlosa());
            cs.setString(12, objeto.getTipoDocumento());
            cs.setString(13, objeto.getSerie());
            cs.setString(14, objeto.getNumeroDocumento());
            cs.setString(15, objeto.getFechaDocumento());
            cs.setInt(16, objeto.getIdFormaPago());
            cs.setString(17, objeto.getFechaVencimiento());
            cs.setInt(18, objeto.getIdMoneda());
            cs.setDouble(19, objeto.getTipoCambio());
            cs.setDouble(20, objeto.getTipoAdquisicion());
            cs.setDouble(21, objeto.getIgv());
            cs.setDouble(22, objeto.getPercepcion());
            cs.setDouble(23, objeto.getRenta());
            cs.setDouble(24, objeto.getAporte());
            cs.setDouble(25, objeto.getTasa());
            cs.setDouble(26, objeto.getImporte());
            cs.setDouble(27, objeto.getBaseAfecta());
            cs.setDouble(28, objeto.getInafecto());
            cs.setDouble(29, objeto.getIgvDocumento());
            cs.setDouble(30, objeto.getPercepcionAfecta());
            cs.setDouble(31, objeto.getRentaAfecta());
            cs.setDouble(32, objeto.getAportePension());
            cs.setDouble(33, objeto.getTotal());
            cs.setString(34, usuario.getNick());
            cs.setString(35, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Provision objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarProvision(?)");
            cs.setInt(1, objeto.getIdProvision());
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
            cs = cnn.prepareCall("call uspGetUltimoIdProvision()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idProvision");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<Provision> buscar(Provision provision) throws Exception {
        ArrayList<Provision> lista = new ArrayList<Provision>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListProvision(?)");
            cs.setString(1, provision.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                Provision objeto = new Provision();
                objeto.setIdProvision(rs.getInt("Idprovision"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdOrdenServicio(rs.getInt("Idordenservicio"));
                objeto.setServicioCompra(rs.getString("Serviciocompra"));
                objeto.setIdSucursal(rs.getInt("Idsucursal"));
                objeto.setIdTipoCompra(rs.getInt("Idtipocompra"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setRazonSocial(rs.getString("Razonsocial"));
                objeto.setRuc(rs.getString("Ruc"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setTipoDocumento(rs.getString("Tipodocumento"));
                objeto.setSerie(rs.getString("Serie"));
                objeto.setNumeroDocumento(rs.getString("Numerodocumento"));
                objeto.setFechaDocumento(rs.getString("Fechadocumento"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setFechaVencimiento(rs.getString("Fechavencimiento"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setTipoAdquisicion(rs.getDouble("Tipoadquisicion"));
                objeto.setIgv(rs.getDouble("Igv"));
                objeto.setPercepcion(rs.getDouble("Percepcion"));
                objeto.setRenta(rs.getDouble("Renta"));
                objeto.setAporte(rs.getDouble("Aporte"));
                objeto.setTasa(rs.getDouble("Tasa"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setBaseAfecta(rs.getDouble("Baseafecta"));
                objeto.setInafecto(rs.getDouble("Inafecto"));
                objeto.setIgvDocumento(rs.getDouble("Igvdocumento"));
                objeto.setPercepcionAfecta(rs.getDouble("Percepcionafecta"));
                objeto.setRentaAfecta(rs.getDouble("Rentaafecta"));
                objeto.setAportePension(rs.getDouble("Aportepension"));
                objeto.setTotal(rs.getDouble("Total"));
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
