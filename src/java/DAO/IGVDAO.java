package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class IGVDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static IGVDAO instancia;

    public static IGVDAO getInstancia() {
        if (instancia == null) {
            instancia = new IGVDAO();
        }
        return instancia;
    }

    public IGV obtener() throws Exception {
        IGV objeto = new IGV();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetIGV()");
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdIGV(rs.getInt("IdIGV"));
                objeto.setValor(rs.getDouble("Valor"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void ingresar(IGV objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsIGV(?,?)");
            cs.setDouble(1, objeto.getValor());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<IGV> buscar(IGV entidad) throws Exception {
        ArrayList<IGV> lista = new ArrayList<IGV>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListIGV(?)");
            cs.setBoolean(1, entidad.getActivo());
            rs = cs.executeQuery();
            while (rs.next()) {
                IGV objeto = new IGV();
                objeto.setIdIGV(rs.getInt("IdIGV"));
                objeto.setValor(rs.getDouble("Valor"));
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

    public void editar(IGV objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdIGV(?,?,?)");
            cs.setInt(1, objeto.getIdIGV());
            cs.setDouble(2, objeto.getValor());
            cs.setString(3, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
}
