package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class RentaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static RentaDAO instancia;

    public static RentaDAO getInstancia() {
        if (instancia == null) {
            instancia = new RentaDAO();
        }
        return instancia;
    }

    public void ingresar(Renta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsRenta(?,?,?)");
            cs.setString(1, objeto.getDescripcion());
            cs.setDouble(2, objeto.getValor());
            cs.setString(3, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Renta obtener(int id) throws Exception {
        Renta objeto = new Renta();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetRenta(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdRenta(rs.getInt("Idrenta"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setValor(rs.getDouble("Valor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Renta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdRenta(?,?,?,?)");
            cs.setInt(1, objeto.getIdRenta());
            cs.setString(2, objeto.getDescripcion());
            cs.setDouble(3, objeto.getValor());
            cs.setString(4, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Renta objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarRenta(?,?)");
            cs.setInt(1, objeto.getIdRenta());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Renta> buscar(Renta entidad) throws Exception {
        ArrayList<Renta> lista = new ArrayList<Renta>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListRenta(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Renta objeto = new Renta();
                objeto.setIdRenta(rs.getInt("Idrenta"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setValor(rs.getDouble("Valor"));
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
