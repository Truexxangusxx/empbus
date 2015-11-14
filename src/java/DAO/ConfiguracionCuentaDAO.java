package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.Types;

public class ConfiguracionCuentaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ConfiguracionCuentaDAO instancia;

    public static ConfiguracionCuentaDAO getInstancia() {
        if (instancia == null) {
            instancia = new ConfiguracionCuentaDAO();
        }
        return instancia;
    }

    public int ingresar(ConfiguracionCuenta objeto, Usuario usuario) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsConfiguracionCuenta(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getCuenta().getIdCuenta());
            cs.setString(3, objeto.getDescripcion());
            cs.setInt(4, objeto.getIdTipoConfiguracionCuenta());
            cs.setBoolean(5, objeto.isExigeCC());
            cs.setInt(6, objeto.getIdClase());
            cs.setInt(7, objeto.getIdNaturaleza());
            cs.setInt(8, objeto.getIdMoneda());
            cs.setInt(9, objeto.getIdTipoAuxiliar());
            cs.setInt(10, objeto.getIdAjuste());
            cs.setInt(11, objeto.getIdTipoCambioCuenta());
            cs.setInt(12, objeto.getCargo().getIdCuenta());
            cs.setInt(13, objeto.getAbono().getIdCuenta());
            cs.setString(14, usuario.getNick());
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public ConfiguracionCuenta obtener(int id) throws Exception {
        ConfiguracionCuenta objeto = new ConfiguracionCuenta();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetConfiguracionCuenta(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdConfiguracionCuenta(rs.getInt("IdConfiguracionCuenta"));
                objeto.setCuenta(new Cuenta(rs.getInt("idcuenta"), rs.getString("dcuenta"), rs.getString("codcuenta")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setIdTipoConfiguracionCuenta(rs.getInt("IdTipoConfiguracionCuenta"));
                objeto.setExigeCC(rs.getBoolean("ExigeCC"));
                objeto.setIdClase(rs.getInt("IdClase"));
                objeto.setIdNaturaleza(rs.getInt("IdNaturaleza"));
                objeto.setIdMoneda(rs.getInt("IdMoneda"));
                objeto.setIdTipoAuxiliar(rs.getInt("IdTipoAuxiliar"));
                objeto.setIdAjuste(rs.getInt("IdAjuste"));
                objeto.setIdTipoCambioCuenta(rs.getInt("IdTipoCambioCuenta"));
                objeto.setCargo(new Cuenta(rs.getInt("idcuentacargo"), rs.getString("dcargo"), rs.getString("codcargo")));
                objeto.setAbono(new Cuenta(rs.getInt("idcuentaabono"), rs.getString("dabono"), rs.getString("codabono")));

            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(ConfiguracionCuenta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdConfiguracionCuenta(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdConfiguracionCuenta());
            cs.setInt(2, objeto.getCuenta().getIdCuenta());
            cs.setString(3, objeto.getDescripcion());
            cs.setInt(4, objeto.getIdTipoConfiguracionCuenta());
            cs.setBoolean(5, objeto.isExigeCC());
            cs.setInt(6, objeto.getIdClase());
            cs.setInt(7, objeto.getIdNaturaleza());
            cs.setInt(8, objeto.getIdMoneda());
            cs.setInt(9, objeto.getIdTipoAuxiliar());
            cs.setInt(10, objeto.getIdAjuste());
            cs.setInt(11, objeto.getIdTipoCambioCuenta());
            cs.setInt(12, objeto.getCargo().getIdCuenta());
            cs.setInt(13, objeto.getAbono().getIdCuenta());
            cs.setString(14, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(ConfiguracionCuenta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarConfiguracionCuenta(?,?)");
            cs.setInt(1, objeto.getIdConfiguracionCuenta());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }


    public ArrayList<ConfiguracionCuenta> buscar(ConfiguracionCuenta entidad) throws Exception {
        ArrayList<ConfiguracionCuenta> lista = new ArrayList<ConfiguracionCuenta>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListConfiguracionCuenta(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                ConfiguracionCuenta objeto = new ConfiguracionCuenta();
                
                objeto.setIdConfiguracionCuenta(rs.getInt("IdConfiguracionCuenta"));
                objeto.setCuenta(new Cuenta(rs.getInt("idcuenta"), rs.getString("dcuenta"), rs.getString("codcuenta")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setIdTipoConfiguracionCuenta(rs.getInt("IdTipoConfiguracionCuenta"));
                objeto.setExigeCC(rs.getBoolean("ExigeCC"));
                objeto.setIdClase(rs.getInt("IdClase"));
                objeto.setIdNaturaleza(rs.getInt("IdNaturaleza"));
                objeto.setIdMoneda(rs.getInt("IdMoneda"));
                objeto.setIdTipoAuxiliar(rs.getInt("IdTipoAuxiliar"));
                objeto.setIdAjuste(rs.getInt("IdAjuste"));
                objeto.setIdTipoCambioCuenta(rs.getInt("IdTipoCambioCuenta"));
                objeto.setCargo(new Cuenta(rs.getInt("idcuentacargo"), rs.getString("dcargo"), rs.getString("codcargo")));
                objeto.setAbono(new Cuenta(rs.getInt("idcuentaabono"), rs.getString("dabono"), rs.getString("codabono")));
                
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
            cs = cnn.prepareCall("call uspGetUltimaConfiguracionCuenta()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idConfiguracionCuenta");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
}
