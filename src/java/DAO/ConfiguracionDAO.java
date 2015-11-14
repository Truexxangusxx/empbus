package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.Types;

public class ConfiguracionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ConfiguracionDAO instancia;

    public static ConfiguracionDAO getInstancia() {
        if (instancia == null) {
            instancia = new ConfiguracionDAO();
        }
        return instancia;
    }

    public int ingresar(Configuracion objeto, Usuario usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsConfiguracion(?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(2, objeto.getSubdiario().getIdSubdiario());
            cs.setInt(3, objeto.getFamilia().getIdFamilia());
            cs.setString(4, objeto.getDescripcion());
            cs.setString(5, usuario.getNick());
            cs.setString(6, xml);
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public Configuracion obtener(int id) throws Exception {
        Configuracion objeto = new Configuracion();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetConfiguracion(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdConfiguracion(rs.getInt("IdConfiguracion"));
                objeto.setFamilia(new Familia(rs.getInt("idfamilia"), rs.getString("dfamilia"), rs.getString("codfamilia")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setSubdiario(new Subdiario(rs.getInt("idSubdiario"), rs.getString("dSubdiario"), rs.getString("codSubdiario")));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Configuracion objeto, Usuario usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdConfiguracion(?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdConfiguracion());
            cs.setInt(2, objeto.getSubdiario().getIdSubdiario());
            cs.setInt(3, objeto.getFamilia().getIdFamilia());
            cs.setString(4, objeto.getDescripcion());
            cs.setString(5, usuario.getNick());
            cs.setString(6, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Configuracion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarConfiguracion(?,?)");
            cs.setInt(1, objeto.getIdConfiguracion());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<Configuracion> buscar(Configuracion entidad) throws Exception {
        ArrayList<Configuracion> lista = new ArrayList<Configuracion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListConfiguracion(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Configuracion objeto = new Configuracion();

                objeto.setIdConfiguracion(rs.getInt("IdConfiguracion"));
                objeto.setFamilia(new Familia(rs.getInt("idfamilia"), rs.getString("dfamilia"), rs.getString("codfamilia")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setSubdiario(new Subdiario(rs.getInt("idSubdiario"), rs.getString("dSubdiario"), rs.getString("codSubdiario")));

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
            cs = cnn.prepareCall("call uspGetUltimaConfiguracion()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idConfiguracion");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public ArrayList<DetalleConfiguracion> buscarDetalleCargo(Configuracion entidad) throws Exception {
        ArrayList<DetalleConfiguracion> lista = new ArrayList<DetalleConfiguracion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleConfiguracionCargo(?)");
            cs.setInt(1, entidad.getIdConfiguracion());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleConfiguracion objeto = new DetalleConfiguracion();

                objeto.setIdConfiguracion(rs.getInt("IdConfiguracion"));
                objeto.setIdDetalleConfiguracion(rs.getInt("idDetalleConfiguracion"));
                objeto.setCuenta(new Cuenta(rs.getInt("idCuenta"), rs.getString("dCuenta"), rs.getString("codCuenta")));
                objeto.setCentroCosto(new CentroCosto(rs.getInt("idCentroCosto"), rs.getString("dCentroCosto"), rs.getString("codCentroCosto")));
                objeto.setCargo(rs.getBoolean("Cargo"));

                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public ArrayList<DetalleConfiguracion> buscarDetalleAbono(Configuracion entidad) throws Exception {
        ArrayList<DetalleConfiguracion> lista = new ArrayList<DetalleConfiguracion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleConfiguracionAbono(?)");
            cs.setInt(1, entidad.getIdConfiguracion());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleConfiguracion objeto = new DetalleConfiguracion();

                objeto.setIdConfiguracion(rs.getInt("IdConfiguracion"));
                objeto.setIdDetalleConfiguracion(rs.getInt("idDetalleConfiguracion"));
                objeto.setCuenta(new Cuenta(rs.getInt("idCuenta"), rs.getString("dCuenta"), rs.getString("codCuenta")));
                objeto.setCentroCosto(new CentroCosto(rs.getInt("idCentroCosto"), rs.getString("dCentroCosto"), rs.getString("codCentroCosto")));
                objeto.setCargo(rs.getBoolean("Cargo"));

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
