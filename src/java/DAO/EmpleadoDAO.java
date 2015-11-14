package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class EmpleadoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static EmpleadoDAO instancia;

    public static EmpleadoDAO getInstancia() {
        if (instancia == null) {
            instancia = new EmpleadoDAO();
        }
        return instancia;
    }

    public void ingresar(Empleado objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsEmpleado(?,?,?,?,?,?,?,?)");
            cs.setString(1, objeto.getNombre());
            cs.setString(2, objeto.getDNI());
            cs.setString(3, objeto.getDireccion());
            cs.setString(4, objeto.getCodigo());
            cs.setString(5, objeto.getTelefono1());
            cs.setString(6, objeto.getTelefono2());
            cs.setString(7, objeto.getPuesto());
            cs.setString(8, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Empleado obtener(int id) throws Exception {
        Empleado objeto = new Empleado();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetEmpleado(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdEmpleado(rs.getInt("Idempleado"));
                objeto.setNombre(rs.getString("Nombre"));
                objeto.setDNI(rs.getString("DNI"));
                objeto.setDireccion(rs.getString("Direccion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setTelefono1(rs.getString("Telefono1"));
                objeto.setTelefono2(rs.getString("Telefono2"));
                objeto.setPuesto(rs.getString("Puesto"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Empleado objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdEmpleado(?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdEmpleado());
            cs.setString(2, objeto.getNombre());
            cs.setString(3, objeto.getDNI());
            cs.setString(4, objeto.getDireccion());
            cs.setString(5, objeto.getCodigo());
            cs.setString(6, objeto.getTelefono1());
            cs.setString(7, objeto.getTelefono2());
            cs.setString(8, objeto.getPuesto());
            cs.setString(9, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Empleado objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarEmpleado(?,?)");
            cs.setInt(1, objeto.getIdEmpleado());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Empleado> buscar(Empleado empleado) throws Exception {
        ArrayList<Empleado> lista = new ArrayList<Empleado>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListEmpleado(?)");
            cs.setString(1, empleado.getNombre());
            rs = cs.executeQuery();
            while (rs.next()) {
                Empleado objeto = new Empleado();
                objeto.setIdEmpleado(rs.getInt("Idempleado"));
                objeto.setNombre(rs.getString("Nombre"));
                objeto.setDNI(rs.getString("DNI"));
                objeto.setDireccion(rs.getString("Direccion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setTelefono1(rs.getString("Telefono1"));
                objeto.setTelefono2(rs.getString("Telefono2"));
                objeto.setPuesto(rs.getString("Puesto"));
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
