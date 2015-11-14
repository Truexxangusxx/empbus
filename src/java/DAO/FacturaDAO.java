package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class FacturaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static FacturaDAO instancia;

    public static FacturaDAO getInstancia() {
        if (instancia == null) {
            instancia = new FacturaDAO();
        }
        return instancia;
    }

    public void ingresar(Factura objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsFactura(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setString(1, objeto.getPeriodo());
            cs.setString(2, objeto.getNumero());
            cs.setInt(3, objeto.getIdPuntoVenta());
            cs.setInt(4, objeto.getIdTipoVenta());
            cs.setInt(5, objeto.getIdCotizacion());
            cs.setInt(6, objeto.getIdOrdenProduccion());
            cs.setInt(7, objeto.getIdClienteProveedor());
            cs.setString(8, objeto.getDCliente());
            cs.setString(9, objeto.getDocumentoIdentidad());
            cs.setInt(10, objeto.getIdTipoDocumento());
            cs.setString(11, objeto.getSerie());
            cs.setString(12, objeto.getNumeroDocumento());
            cs.setString(13, objeto.getFecha());
            cs.setDouble(14, objeto.getTipoCambio());
            cs.setInt(15, objeto.getIdFormaPago());
            cs.setString(16, objeto.getFechaVencimiento());
            cs.setInt(17, objeto.getIdMoneda());
            cs.setString(18, objeto.getGlosa());
            cs.setDouble(19, objeto.getIgv());
            cs.setDouble(20, objeto.getDPercepcion());
            cs.setInt(21, objeto.getIdPercepcion());
            cs.setInt(22, objeto.getIdServicio());
            cs.setString(23, objeto.getReferencia());
            cs.setString(24, objeto.getSerieGuia());
            cs.setString(25, objeto.getNumeroGuia());
            cs.setString(26, objeto.getDocumento());
            cs.setBoolean(27, objeto.getAplicar());
            cs.setDouble(28, objeto.getImporte());
            cs.setString(29, objeto.getCotizacionOP());
            cs.setString(30, usuario.getNick());
            cs.setString(31, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Factura obtener(int id) throws Exception {
        Factura objeto = new Factura();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetFactura(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdFactura(rs.getInt("Idfactura"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setIdPuntoVenta(rs.getInt("IdpuntoVenta"));
                objeto.setIdTipoVenta(rs.getInt("Idtipoventa"));
                objeto.setIdCotizacion(rs.getInt("Idcotizacion"));
                objeto.setIdOrdenProduccion(rs.getInt("Idordenproduccion"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setDCliente(rs.getString("Dcliente"));
                objeto.setDocumentoIdentidad(rs.getString("Documentoidentidad"));
                objeto.setIdTipoDocumento(rs.getInt("Idtipodocumento"));
                objeto.setSerie(rs.getString("Serie"));
                objeto.setNumeroDocumento(rs.getString("Numerodocumento"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setIdFormaPago(rs.getInt("Idformapago"));
                objeto.setFechaVencimiento(rs.getString("Fechavencimiento"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setIgv(rs.getDouble("Igv"));
                objeto.setDPercepcion(rs.getDouble("Dpercepcion"));
                objeto.setIdServicio(rs.getInt("Idservicio"));
                objeto.setReferencia(rs.getString("Referencia"));
                objeto.setSerieGuia(rs.getString("Serieguia"));
                objeto.setNumeroGuia(rs.getString("Numeroguia"));
                objeto.setDocumento(rs.getString("Documento"));
                objeto.setAplicar(rs.getBoolean("Aplicar"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setCotizacionOP(rs.getString("Cotizacionop"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Factura objeto, Usuario usuario,String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdFactura(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdFactura());
            cs.setString(2, objeto.getPeriodo());
            cs.setString(3, objeto.getNumero());
            cs.setInt(4, objeto.getIdPuntoVenta());
            cs.setInt(5, objeto.getIdTipoVenta());
            cs.setInt(6, objeto.getIdCotizacion());
            cs.setInt(7, objeto.getIdOrdenProduccion());
            cs.setInt(8, objeto.getIdClienteProveedor());
            cs.setString(9, objeto.getDCliente());
            cs.setString(10, objeto.getDocumentoIdentidad());
            cs.setInt(11, objeto.getIdTipoDocumento());
            cs.setString(12, objeto.getSerie());
            cs.setString(13, objeto.getNumeroDocumento());
            cs.setString(14, objeto.getFecha());
            cs.setDouble(15, objeto.getTipoCambio());
            cs.setInt(16, objeto.getIdFormaPago());
            cs.setString(17, objeto.getFechaVencimiento());
            cs.setInt(18, objeto.getIdMoneda());
            cs.setString(19, objeto.getGlosa());
            cs.setDouble(20, objeto.getIgv());
            cs.setDouble(21, objeto.getDPercepcion());
            cs.setInt(22, objeto.getIdPercepcion());
            cs.setInt(23, objeto.getIdServicio());
            cs.setString(24, objeto.getReferencia());
            cs.setString(25, objeto.getSerieGuia());
            cs.setString(26, objeto.getNumeroGuia());
            cs.setString(27, objeto.getDocumento());
            cs.setBoolean(28, objeto.getAplicar());
            cs.setDouble(29, objeto.getImporte());
            cs.setString(30, objeto.getCotizacionOP());
            cs.setString(31, usuario.getNick());
            cs.setString(32, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Factura objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarFactura(?,?)");
            cs.setInt(1, objeto.getIdFactura());
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
            cs = cnn.prepareCall("call uspGetUltimaFactura()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idFactura");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<Factura> buscar(Factura entidad) throws Exception {
        ArrayList<Factura> lista = new ArrayList<Factura>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListFactura(?)");
            cs.setString(1, entidad.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                Factura objeto = new Factura();
                objeto.setIdFactura(rs.getInt("Idfactura"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setDCliente(rs.getString("Dcliente"));
                objeto.setCotizacionOP(rs.getString("Cotizacionop"));
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
