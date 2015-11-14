package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class EstandarDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static EstandarDAO instancia;

    public static EstandarDAO getInstancia() {
        if (instancia == null) {
            instancia = new EstandarDAO();
        }
        return instancia;
    }

    public void ingresar(String xml, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsEstandar(?,?)");
            cs.setString(1, xml);
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<Estandar> obtener(int id) throws Exception {
        ArrayList<Estandar> lista = new ArrayList<Estandar>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListEstandar(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                Estandar objeto = new Estandar();
                objeto.setIdEstandar(rs.getInt("Idestandar"));
                objeto.setIdProductoPrincipal(rs.getInt("Idproductoprincipal"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigoProductoPrincipal(rs.getString("CodigoProductoPrincipal"));
                objeto.setDProductoPrincipal(rs.getString("DProductoPrincipal"));
                objeto.setCodigoProducto(rs.getString("CodigoProducto"));
                objeto.setDProducto(rs.getString("DProducto"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }

    public void editar(Estandar objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdEstandar(?,?,?,?)");
            cs.setInt(1, objeto.getIdEstandar());
            cs.setInt(2, objeto.getIdProductoPrincipal());
            cs.setInt(3, objeto.getIdProducto());
            cs.setInt(4, objeto.getCantidad());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Estandar objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarEstandar(?)");
            cs.setInt(1, objeto.getIdEstandar());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Estandar> buscar(int id) throws Exception {
        ArrayList<Estandar> lista = new ArrayList<Estandar>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListEstandar(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                Estandar objeto = new Estandar();
                objeto.setIdEstandar(rs.getInt("Idestandar"));
                objeto.setIdProductoPrincipal(rs.getInt("Idproductoprincipal"));
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setCantidad(rs.getInt("Cantidad"));
                objeto.setCodigoProductoPrincipal(rs.getString("CodigoProductoPrincipal"));
                objeto.setDProductoPrincipal(rs.getString("DProductoPrincipal"));
                objeto.setCodigoProducto(rs.getString("CodigoProducto"));
                objeto.setDProducto(rs.getString("DProducto"));
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
