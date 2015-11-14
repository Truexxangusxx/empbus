package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class TipoAdquisicionDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TipoAdquisicionDAO instancia;

    public static TipoAdquisicionDAO getInstancia() {
        if (instancia == null) {
            instancia = new TipoAdquisicionDAO();
        }
        return instancia;
    }

    public void ingresar(TipoAdquisicion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTipoAdquisicion(?,?,?)");
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

    public TipoAdquisicion obtener(int id) throws Exception {
        TipoAdquisicion objeto = new TipoAdquisicion();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTipoAdquisicion(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTipoAdquisicion(rs.getInt("Idtipoadquisicion"));
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

    public void editar(TipoAdquisicion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTipoAdquisicion(?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoAdquisicion());
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

    public void eliminar(TipoAdquisicion objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTipoAdquisicion(?,?)");
            cs.setInt(1, objeto.getIdTipoAdquisicion());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<TipoAdquisicion> buscar(TipoAdquisicion entidad) throws Exception {
        ArrayList<TipoAdquisicion> lista = new ArrayList<TipoAdquisicion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTipoAdquisicion(?)");
            cs.setString(1, entidad.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                TipoAdquisicion objeto = new TipoAdquisicion();
                objeto.setIdTipoAdquisicion(rs.getInt("Idtipoadquisicion"));
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
