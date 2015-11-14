package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.Types;

public class ConfiguracionAlmacenDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ConfiguracionAlmacenDAO instancia;

    public static ConfiguracionAlmacenDAO getInstancia() {
        if (instancia == null) {
            instancia = new ConfiguracionAlmacenDAO();
        }
        return instancia;
    }

    public int ingresar(ConfiguracionAlmacen objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsConfiguracionAlmacen(?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getFamilia().getIdFamilia());
            cs.setString(3, objeto.getDescripcion());
            cs.setInt(4, objeto.getCuentaExistencias().getIdCuenta());
            cs.setInt(5, objeto.getCuentaCompras().getIdCuenta());
            cs.setInt(6, objeto.getCuentaVariacionExistencias().getIdCuenta());
            cs.setInt(7, objeto.getCuentaTransferencia().getIdCuenta());
            cs.setInt(8, objeto.getCuentaProducto().getIdCuenta());
            cs.setInt(9, objeto.getCuentaVariacionProducto().getIdCuenta());
            cs.setString(10, usuario.getNick());
            cs.setString(11, xml);
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public ConfiguracionAlmacen obtener(int id) throws Exception {
        ConfiguracionAlmacen objeto = new ConfiguracionAlmacen();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetConfiguracionAlmacen(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdConfiguracionAlmacen(rs.getInt("IdConfiguracionAlmacen"));
                objeto.setFamilia(new Familia(rs.getInt("idfamilia"), rs.getString("dfamilia"), rs.getString("codfamilia")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCuentaExistencias(new Cuenta(rs.getInt("idCuentaExistencias"), rs.getString("dCuentaExistencias"), rs.getString("codCuentaExistencias")));
                objeto.setCuentaCompras(new Cuenta(rs.getInt("idCuentaCompras"), rs.getString("dCuentaCompras"), rs.getString("codCuentaCompras")));
                objeto.setCuentaVariacionExistencias(new Cuenta(rs.getInt("idCuentaVariacionExistencias"), rs.getString("dCuentaVariacionExistencias"), rs.getString("codCuentaVariacionExistencias")));
                objeto.setCuentaTransferencia(new Cuenta(rs.getInt("idCuentaTransferencia"), rs.getString("dCuentaTransferencia"), rs.getString("codCuentaTransferencia")));
                objeto.setCuentaProducto(new Cuenta(rs.getInt("idCuentaProducto"), rs.getString("dCuentaProducto"), rs.getString("codCuentaProducto")));
                objeto.setCuentaVariacionProducto(new Cuenta(rs.getInt("idCuentaVariacionProducto"), rs.getString("dCuentaVariacionProducto"), rs.getString("codCuentaVariacionProducto")));

            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(ConfiguracionAlmacen objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdConfiguracionAlmacen(?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdConfiguracionAlmacen());
            cs.setInt(2, objeto.getFamilia().getIdFamilia());
            cs.setString(3, objeto.getDescripcion());
            cs.setInt(4, objeto.getCuentaExistencias().getIdCuenta());
            cs.setInt(5, objeto.getCuentaCompras().getIdCuenta());
            cs.setInt(6, objeto.getCuentaVariacionExistencias().getIdCuenta());
            cs.setInt(7, objeto.getCuentaTransferencia().getIdCuenta());
            cs.setInt(8, objeto.getCuentaProducto().getIdCuenta());
            cs.setInt(9, objeto.getCuentaVariacionProducto().getIdCuenta());
            cs.setString(10, usuario.getNick());
            cs.setString(11, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(ConfiguracionAlmacen objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarConfiguracionAlmacen(?,?)");
            cs.setInt(1, objeto.getIdConfiguracionAlmacen());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }


    public ArrayList<ConfiguracionAlmacen> buscar(ConfiguracionAlmacen entidad) throws Exception {
        ArrayList<ConfiguracionAlmacen> lista = new ArrayList<ConfiguracionAlmacen>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListConfiguracionAlmacen(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                ConfiguracionAlmacen objeto = new ConfiguracionAlmacen();
                
                objeto.setIdConfiguracionAlmacen(rs.getInt("IdConfiguracionAlmacen"));
                objeto.setFamilia(new Familia(rs.getInt("idfamilia"), rs.getString("dfamilia"), rs.getString("codfamilia")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCuentaExistencias(new Cuenta(rs.getInt("idCuentaExistencias"), rs.getString("dCuentaExistencias"), rs.getString("codCuentaExistencias")));
                objeto.setCuentaCompras(new Cuenta(rs.getInt("idCuentaCompras"), rs.getString("dCuentaCompras"), rs.getString("codCuentaCompras")));
                objeto.setCuentaVariacionExistencias(new Cuenta(rs.getInt("idCuentaVariacionExistencias"), rs.getString("dCuentaVariacionExistencias"), rs.getString("codCuentaVariacionExistencias")));
                objeto.setCuentaTransferencia(new Cuenta(rs.getInt("idCuentaTransferencia"), rs.getString("dCuentaTransferencia"), rs.getString("codCuentaTransferencia")));
                objeto.setCuentaProducto(new Cuenta(rs.getInt("idCuentaProducto"), rs.getString("dCuentaProducto"), rs.getString("codCuentaProducto")));
                objeto.setCuentaVariacionProducto(new Cuenta(rs.getInt("idCuentaVariacionProducto"), rs.getString("dCuentaVariacionProducto"), rs.getString("codCuentaVariacionProducto")));
                
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public int UltimoID() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimaConfiguracionAlmacen()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idConfiguracionAlmacen");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<DetalleConfiguracionAlmacen> buscarDetalle(ConfiguracionAlmacen entidad) throws Exception {
        ArrayList<DetalleConfiguracionAlmacen> lista = new ArrayList<DetalleConfiguracionAlmacen>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleConfiguracionAlmacen(?)");
            cs.setInt(1, entidad.getIdConfiguracionAlmacen());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleConfiguracionAlmacen objeto = new DetalleConfiguracionAlmacen();
                
                objeto.setIdConfiguracionAlmacen(rs.getInt("IdConfiguracionAlmacen"));
                objeto.setCuenta(new Cuenta(rs.getInt("idCuenta"), rs.getString("dCuenta"), rs.getString("codCuenta")));
                objeto.setCentroCosto(new CentroCosto(rs.getInt("idCentroCosto"), rs.getString("dCentroCosto"), rs.getString("codCentroCosto")));
                
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
