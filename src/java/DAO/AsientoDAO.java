package DAO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.Types;

public class AsientoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static AsientoDAO instancia;

    public static AsientoDAO getInstancia() {
        if (instancia == null) {
            instancia = new AsientoDAO();
        }
        return instancia;
    }
    
    public int ingresar(Asiento objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsAsiento(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setString(1, objeto.getPeriodo());
            cs.setInt(2, objeto.getSubdiario().getIdSubdiario());
            cs.setString(3, objeto.getFecha());
            cs.setInt(4, objeto.getSucursal().getIdSucursal());
            cs.setInt(5, objeto.getMoneda().getIdMoneda());
            cs.setDouble(6, objeto.getTipoCambio());
            cs.setString(7, objeto.getGlosa());
            cs.setString(8, objeto.getNumero());
            cs.setString(9, xml);
            cs.registerOutParameter(10, Types.INTEGER);
            cs.setString(11, usuario.getNick());
            cs.setInt(12, 0);
            cs.setInt(13, 0);
            cs.execute();
            id = Integer.parseInt(cs.getObject(10).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public Asiento obtener(int id) throws Exception {
        Asiento objeto = new Asiento();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetAsiento(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdAsiento(rs.getInt("idasiento"));
                objeto.setPeriodo(rs.getString("Periodo"));
                Subdiario sub = new Subdiario();
                sub.setIdSubdiario(rs.getInt("idsubdiario"));
                sub.setDescripcion(rs.getString("DSubdiario"));
                sub.setCodigo(rs.getString("CodSubdiario"));
                objeto.setSubdiario(sub);
                
                objeto.setFecha(rs.getString("Fecha"));
                Sucursal su = new Sucursal();
                su.setDescripcion(rs.getString("DSucursal"));
                su.setIdSucursal(rs.getInt("idSucursal"));
                objeto.setSucursal(su);
                
                Moneda mo = new Moneda();
                mo.setIdMoneda(rs.getInt("idMoneda"));
                mo.setDescripcion(rs.getString("DMoneda"));
                objeto.setMoneda(mo);
                
                objeto.setTipoCambio(rs.getDouble("TipoCambio"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setNumero(rs.getString("Numero"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Asiento objeto, Usuario usuario,String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdAsiento(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdAsiento());
            cs.setString(2, objeto.getPeriodo());
            cs.setInt(3, objeto.getSubdiario().getIdSubdiario());
            cs.setString(4, objeto.getFecha());
            cs.setInt(5, objeto.getSucursal().getIdSucursal());
            cs.setInt(6, objeto.getMoneda().getIdMoneda());
            cs.setDouble(7, objeto.getTipoCambio());
            cs.setString(8, objeto.getGlosa());
            cs.setString(9, objeto.getNumero());
            cs.setString(10, xml);
            cs.setString(11, usuario.getNick());
            cs.setInt(12, 0);
            cs.setInt(13, 0);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Asiento objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarAsiento(?,?)");
            cs.setInt(1, objeto.getIdAsiento());
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
            cs = cnn.prepareCall("call uspGetUltimaAsiento()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idAsiento");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<Asiento> buscar(Asiento entidad) throws Exception {
        ArrayList<Asiento> lista = new ArrayList<Asiento>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListAsiento(?)");
            cs.setString(1, entidad.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                Asiento objeto = new Asiento();
                objeto.setIdAsiento(rs.getInt("idasiento"));
                objeto.setPeriodo(rs.getString("Periodo"));
                Subdiario sub = new Subdiario();
                sub.setIdSubdiario(rs.getInt("idsubdiario"));
                sub.setDescripcion(rs.getString("DSubdiario"));
                sub.setCodigo(rs.getString("CodSubdiario"));
                objeto.setSubdiario(sub);
                
                objeto.setFecha(rs.getString("Fecha"));
                Sucursal su = new Sucursal();
                su.setDescripcion(rs.getString("DSucursal"));
                su.setIdSucursal(rs.getInt("idSucursal"));
                objeto.setSucursal(su);
                
                Moneda mo = new Moneda();
                mo.setIdMoneda(rs.getInt("idMoneda"));
                mo.setDescripcion(rs.getString("DMoneda"));
                objeto.setMoneda(mo);
                
                objeto.setTipoCambio(rs.getDouble("TipoCambio"));
                objeto.setGlosa(rs.getString("Glosa"));
                objeto.setNumero(rs.getString("Numero"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<DetalleAsiento> buscarDetalle(Asiento entidad) throws Exception {
        ArrayList<DetalleAsiento> lista = new ArrayList<DetalleAsiento>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleAsiento(?)");
            cs.setInt(1, entidad.getIdAsiento());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleAsiento objeto = new DetalleAsiento();
                objeto.setIdAsiento(rs.getInt("idasiento"));
                objeto.setIdDetalleAsiento(rs.getInt("IdDetalleAsiento"));
                objeto.setCuenta(new Cuenta(rs.getInt("IdCuenta"), rs.getString("DCuenta"), rs.getString("CodCuenta")));
                objeto.setCentroCosto(new CentroCosto(rs.getInt("IdCentroCosto"), rs.getString("DCentroCosto"), rs.getString("CodCentroCosto")));
                objeto.setCargoMN(rs.getDouble("CargoMN"));
                objeto.setAbonoMN(rs.getDouble("AbonoMN"));
                objeto.setCargoME(rs.getDouble("CargoME"));
                objeto.setAbonoME(rs.getDouble("AbonoME"));
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
