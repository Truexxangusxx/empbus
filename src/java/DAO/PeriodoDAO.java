package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class PeriodoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static PeriodoDAO instancia;

    public static PeriodoDAO getInstancia() {
        if (instancia == null) {
            instancia = new PeriodoDAO();
        }
        return instancia;
    }

    public void ingresar(Periodo objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsPeriodo(?,?,?)");
            cs.setInt(1, objeto.getAnio());
            cs.setString(2, objeto.getMes());
            cs.setString(3, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Periodo obtener(int id) throws Exception {
        Periodo objeto = new Periodo();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetPeriodo(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdPeriodo(rs.getInt("Idperiodo"));
                objeto.setAnio(rs.getInt("Anio"));
                objeto.setMes(rs.getString("Mes"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Periodo objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdPeriodo(?,?,?,?)");
            cs.setInt(1, objeto.getIdPeriodo());
            cs.setInt(2, objeto.getAnio());
            cs.setString(3, objeto.getMes());
            cs.setString(4, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Periodo objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarPeriodo(?,?)");
            cs.setInt(1, objeto.getIdPeriodo());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Periodo> buscar(Periodo entidad) throws Exception {
        ArrayList<Periodo> lista = new ArrayList<Periodo>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListPeriodo(?)");
            cs.setBoolean(1, entidad.getActivo());
            rs = cs.executeQuery();
            while (rs.next()) {
                Periodo objeto = new Periodo();
                objeto.setIdPeriodo(rs.getInt("Idperiodo"));
                objeto.setAnio(rs.getInt("Anio"));
                objeto.setMes(rs.getString("Mes"));
                objeto.setActivo(rs.getBoolean("Activo"));
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
