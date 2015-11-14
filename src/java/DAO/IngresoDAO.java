package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.*;

public class IngresoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static IngresoDAO instancia;

    public static IngresoDAO getInstancia() {
        if (instancia == null) {
            instancia = new IngresoDAO();
        }
        return instancia;
    }

    public int ingresar(Ingreso objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsIngreso(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getIdAlmacen());
            cs.setInt(3, objeto.getIdTipoMovimiento());
            cs.setInt(4, objeto.getIdOrdenCompra());
            cs.setInt(5, objeto.getIdClienteProveedor());
            cs.setInt(6, objeto.getIdMoneda());
            cs.setString(7, objeto.getFecha());
            cs.setString(8, objeto.getNumero());
            cs.setDouble(9, objeto.getTipoCambio());
            cs.setString(10, objeto.getGuiaRemision());
            cs.setString(11, objeto.getFacturaProveedor());
            cs.setString(12, objeto.getFechaDocumento());
            cs.setString(13, objeto.getProvisionCompra());
            cs.setDouble(14, objeto.getTipoCambioMoneda());
            cs.setDouble(15, objeto.getMonto());
            cs.setString(16, objeto.getObservaciones());
            cs.setString(17, usuario.getNick());
            cs.setString(18, xml);
            cs.setInt(19, objeto.getIdSubdiario());
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public Ingreso obtener(int id) throws Exception {
        Ingreso objeto = new Ingreso();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetIngreso(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdIngreso(rs.getInt("Idingreso"));
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setGuiaRemision(rs.getString("Guiaremision"));
                objeto.setFacturaProveedor(rs.getString("Facturaproveedor"));
                objeto.setFechaDocumento(rs.getString("Fechadocumento"));
                objeto.setProvisionCompra(rs.getString("Provisioncompra"));
                objeto.setTipoCambioMoneda(rs.getDouble("Tipocambiomoneda"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setDAlmacen(rs.getString("DAlmacen"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDOrdenCompra(rs.getString("DOrdenCompra"));
                objeto.setIdSubdiario(rs.getInt("idsubdiario"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Ingreso objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdIngreso(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdIngreso());
            cs.setInt(2, objeto.getIdAlmacen());
            cs.setInt(3, objeto.getIdTipoMovimiento());
            cs.setInt(4, objeto.getIdOrdenCompra());
            cs.setInt(5, objeto.getIdClienteProveedor());
            cs.setInt(6, objeto.getIdMoneda());
            cs.setString(7, objeto.getFecha());
            cs.setString(8, objeto.getNumero());
            cs.setDouble(9, objeto.getTipoCambio());
            cs.setString(10, objeto.getGuiaRemision());
            cs.setString(11, objeto.getFacturaProveedor());
            cs.setString(12, objeto.getFechaDocumento());
            cs.setString(13, objeto.getProvisionCompra());
            cs.setDouble(14, objeto.getTipoCambioMoneda());
            cs.setDouble(15, objeto.getMonto());
            cs.setString(16, objeto.getObservaciones());
            cs.setString(17, usuario.getNick());
            cs.setString(18, xml);
            cs.setInt(19, objeto.getIdSubdiario());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Ingreso objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarIngreso(?,?)");
            cs.setInt(1, objeto.getIdIngreso());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Ingreso> buscar(Ingreso ingreso) throws Exception {
        ArrayList<Ingreso> lista = new ArrayList<Ingreso>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListIngreso(?)");
            cs.setString(1, ingreso.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                Ingreso objeto = new Ingreso();
                objeto.setIdIngreso(rs.getInt("Idingreso"));
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setGuiaRemision(rs.getString("Guiaremision"));
                objeto.setFacturaProveedor(rs.getString("Facturaproveedor"));
                objeto.setFechaDocumento(rs.getString("Fechadocumento"));
                objeto.setProvisionCompra(rs.getString("Provisioncompra"));
                objeto.setTipoCambioMoneda(rs.getDouble("Tipocambiomoneda"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setDAlmacen(rs.getString("DAlmacen"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDOrdenCompra(rs.getString("DOrdenCompra"));
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
    
    public ArrayList<Ingreso> buscarPorOC(Ingreso ingreso) throws Exception {
        ArrayList<Ingreso> lista = new ArrayList<Ingreso>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListIngresoPorOC(?,?)");
            cs.setString(1, ingreso.getNumero());
            cs.setInt(2, ingreso.getIdOrdenCompra());
            rs = cs.executeQuery();
            while (rs.next()) {
                Ingreso objeto = new Ingreso();
                objeto.setIdIngreso(rs.getInt("Idingreso"));
                objeto.setIdAlmacen(rs.getInt("Idalmacen"));
                objeto.setIdTipoMovimiento(rs.getInt("Idtipomovimiento"));
                objeto.setIdOrdenCompra(rs.getInt("Idordencompra"));
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setIdMoneda(rs.getInt("Idmoneda"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setTipoCambio(rs.getDouble("Tipocambio"));
                objeto.setGuiaRemision(rs.getString("Guiaremision"));
                objeto.setFacturaProveedor(rs.getString("Facturaproveedor"));
                objeto.setFechaDocumento(rs.getString("Fechadocumento"));
                objeto.setProvisionCompra(rs.getString("Provisioncompra"));
                objeto.setTipoCambioMoneda(rs.getDouble("Tipocambiomoneda"));
                objeto.setMonto(rs.getDouble("Monto"));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setDAlmacen(rs.getString("DAlmacen"));
                objeto.setDClienteProveedor(rs.getString("DClienteProveedor"));
                objeto.setDMoneda(rs.getString("DMoneda"));
                objeto.setDOrdenCompra(rs.getString("DOrdenCompra"));
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
    
    public ArrayList<IngresoProducto> buscardetalle(Ingreso ingreso) throws Exception {
        ArrayList<IngresoProducto> lista = new ArrayList<IngresoProducto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListIngresoProducto(?)");
            cs.setInt(1, ingreso.getIdIngreso());
            rs = cs.executeQuery();
            while (rs.next()) {
                IngresoProducto objeto = new IngresoProducto();
                objeto.setIdIngresoProducto(rs.getInt("IdIngresoProducto"));
                objeto.setIdCentroCosto(rs.getInt("IdCentroCosto"));
                objeto.setIdIngreso(rs.getInt("IdIngreso"));
                objeto.setIdProducto(rs.getInt("IdProducto"));
                objeto.setDCentroCosto(rs.getString("DCentroCosto"));
                objeto.setDProducto(rs.getString("DProducto"));
                objeto.setDUnidadMedida(rs.getString("DUnidadMedida"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setImporte(rs.getDouble("Importe"));
                objeto.setPrecio(rs.getDouble("Precio"));
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
            cs = cnn.prepareCall("call uspGetUltimoIngreso()");
            rs = cs.executeQuery();
            while (rs.next()) {
                IngresoProducto objeto = new IngresoProducto();
                id = rs.getInt("idIngreso");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
}
