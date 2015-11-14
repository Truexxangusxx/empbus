package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class UsuarioDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static UsuarioDAO instancia;

    public static UsuarioDAO getInstancia() {
        if (instancia == null) {
            instancia = new UsuarioDAO();
        }
        return instancia;
    }

    public void ingresar(Usuario objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsUsuario(?,?,?,?)");
            cs.setString(1, objeto.getNick());
            cs.setString(2, objeto.getPassword());
            cs.setString(3, objeto.getNombre());
            cs.setString(4, objeto.getEmail());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Usuario obtener(int id) throws Exception {
        Usuario objeto = new Usuario();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUsuario(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdUsuario(rs.getInt("Idusuario"));
                objeto.setNick(rs.getString("Nick"));
                objeto.setPassword(rs.getString("Password"));
                objeto.setNombre(rs.getString("Nombre"));
                objeto.setEmail(rs.getString("Email"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Usuario objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdUsuario(?,?,?,?,?)");
            cs.setInt(1, objeto.getIdUsuario());
            cs.setString(2, objeto.getNick());
            cs.setString(3, objeto.getPassword());
            cs.setString(4, objeto.getNombre());
            cs.setString(5, objeto.getEmail());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Usuario objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarUsuario(?)");
            cs.setInt(1, objeto.getIdUsuario());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Usuario Validar(Usuario usuario) throws Exception {
        Usuario objeto = new Usuario();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUsuarioValido(?,?)");
            cs.setString(1, usuario.getNick());
            cs.setString(2, usuario.getPassword());
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdUsuario(rs.getInt("Idusuario"));
                objeto.setNick(rs.getString("Nick"));
                objeto.setPassword(rs.getString("Password"));
                objeto.setNombre(rs.getString("Nombre"));
                objeto.setEmail(rs.getString("Email"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public ArrayList<Usuario> BuscarUsuario(Usuario usuario) throws Exception {
        ArrayList<Usuario> ListaUsuario = new ArrayList<Usuario>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListUsuario(?)");
            cs.setString(1, usuario.getNick());
            rs = cs.executeQuery();
            while (rs.next()) {
                Usuario objeto = new Usuario();
                objeto.setIdUsuario(rs.getInt("IdUsuario"));
                objeto.setNick(rs.getString("Nick"));
                objeto.setPassword(rs.getString("Password"));
                objeto.setNombre(rs.getString("Nombre"));
                objeto.setEmail(rs.getString("Email"));
                ListaUsuario.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaUsuario;
    }
}
