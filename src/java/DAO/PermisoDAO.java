package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class PermisoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static PermisoDAO instancia;

    public static PermisoDAO getInstancia() {
        if (instancia == null) {
            instancia = new PermisoDAO();
        }
        return instancia;
    }

    public void ingresar(String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsPermiso(?)");
            cs.setString(1, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<Permiso> BuscarPermiso(Usuario usuario) throws Exception {
        ArrayList<Permiso> ListaPermiso = new ArrayList<Permiso>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListPermiso(?)");
            cs.setInt(1, usuario.getIdUsuario());
            rs = cs.executeQuery();
            while (rs.next()) {
                Permiso objeto = new Permiso();
                objeto.setIdModulo(rs.getInt("idModulo"));
                objeto.setDModulo(rs.getString("DModulo"));
                objeto.setIdOpcion(rs.getInt("idOpcion"));
                objeto.setDOpcion(rs.getString("DOpcion"));
                objeto.setIdUsuario(rs.getInt("idUsuario"));
                objeto.setDUsuario(rs.getString("DUsuario"));
                ListaPermiso.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaPermiso;
    }

    public Boolean ObtenerPermiso(Usuario usuario, String Opcion) throws Exception {
        int num = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetPermiso(?,?)");
            cs.setInt(1, usuario.getIdUsuario());
            cs.setString(2, Opcion);
            rs = cs.executeQuery();
            while (rs.next()) {
                num = rs.getInt("Cantidad");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        if (num == 0) {
            return false;
        } else {
            return true;
        }
    }
}
