package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class FamiliaDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static FamiliaDAO instancia;

    public static FamiliaDAO getInstancia() {
        if (instancia == null) {
            instancia = new FamiliaDAO();
        }
        return instancia;
    }

    public void ingresar(Familia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsFamilia(?,?,?,?)");
            cs.setString(1, objeto.getDescripcion());
            cs.setString(2, objeto.getCodigo());
            cs.setString(3, usuario.getNick());
            cs.setInt(4, objeto.getIdCuenta());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Familia obtener(int id) throws Exception {
        Familia objeto = new Familia();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetFamilia(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdFamilia(rs.getInt("Idfamilia"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdCuenta(rs.getInt("idCuenta"));
                objeto.setDCuenta(rs.getString("DCuenta"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Familia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdFamilia(?,?,?,?,?)");
            cs.setInt(1, objeto.getIdFamilia());
            cs.setString(2, objeto.getDescripcion());
            cs.setString(3, objeto.getCodigo());
            cs.setString(4, usuario.getNick());
            cs.setInt(5, objeto.getIdCuenta());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Familia objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarFamilia(?,?)");
            cs.setInt(1, objeto.getIdFamilia());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Familia> buscar(Familia familia) throws Exception {
        ArrayList<Familia> lista = new ArrayList<Familia>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListFamilia(?,?)");
            cs.setString(1, familia.getDescripcion());
            cs.setString(2, familia.getCodigo());
            rs = cs.executeQuery();
            while (rs.next()) {
                Familia objeto = new Familia();
                objeto.setIdFamilia(rs.getInt("Idfamilia"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setIdCuenta(rs.getInt("IdCuenta"));
                objeto.setDCuenta(rs.getString("DCuenta"));
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
