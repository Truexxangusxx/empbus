package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ClienteProveedorDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ClienteProveedorDAO instancia;

    public static ClienteProveedorDAO getInstancia() {
        if (instancia == null) {
            instancia = new ClienteProveedorDAO();
        }
        return instancia;
    }

    public void ingresar(ClienteProveedor objeto, String Usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsClienteProveedor(?,?,?,?,?,?,?,?,?)");
            cs.setString(1, objeto.getRazonSocial());
            cs.setString(2, objeto.getRuc());
            cs.setString(3, objeto.getDni());
            cs.setString(4, objeto.getTelefono1());
            cs.setString(5, objeto.getTelefono2());
            cs.setString(6, objeto.getCorreo());
            cs.setString(7, objeto.getContacto());
            cs.setString(8, Usuario);
            cs.setString(9, objeto.getDireccion());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ClienteProveedor obtener(int id) throws Exception {
        ClienteProveedor objeto = new ClienteProveedor();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetClienteProveedor(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setRazonSocial(rs.getString("Razonsocial"));
                objeto.setRuc(rs.getString("Ruc"));
                objeto.setDni(rs.getString("Dni"));
                objeto.setTelefono1(rs.getString("Telefono1"));
                objeto.setTelefono2(rs.getString("Telefono2"));
                objeto.setCorreo(rs.getString("Correo"));
                objeto.setContacto(rs.getString("Contacto"));
                objeto.setDireccion(rs.getString("Direccion"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(ClienteProveedor objeto, String Usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdClienteProveedor(?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdClienteProveedor());
            cs.setString(2, objeto.getRazonSocial());
            cs.setString(3, objeto.getRuc());
            cs.setString(4, objeto.getDni());
            cs.setString(5, objeto.getTelefono1());
            cs.setString(6, objeto.getTelefono2());
            cs.setString(7, objeto.getCorreo());
            cs.setString(8, objeto.getContacto());
            cs.setString(9, Usuario);
            cs.setString(10, objeto.getDireccion());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(ClienteProveedor objeto, String Usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarClienteProveedor(?,?)");
            cs.setInt(1, objeto.getIdClienteProveedor());
            cs.setString(2, Usuario);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<ClienteProveedor> buscar(ClienteProveedor clienteproveedor) throws Exception {
        ArrayList<ClienteProveedor> lista = new ArrayList<ClienteProveedor>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListClienteProveedor(?,?)");
            cs.setString(1, clienteproveedor.getRazonSocial());
            cs.setString(2, clienteproveedor.getRuc());
            rs = cs.executeQuery();
            while (rs.next()) {
                ClienteProveedor objeto = new ClienteProveedor();
                objeto.setIdClienteProveedor(rs.getInt("Idclienteproveedor"));
                objeto.setRazonSocial(rs.getString("Razonsocial"));
                objeto.setRuc(rs.getString("Ruc"));
                objeto.setDni(rs.getString("Dni"));
                objeto.setTelefono1(rs.getString("Telefono1"));
                objeto.setTelefono2(rs.getString("Telefono2"));
                objeto.setCorreo(rs.getString("Correo"));
                objeto.setContacto(rs.getString("Contacto"));
                objeto.setDireccion(rs.getString("Direccion"));
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
