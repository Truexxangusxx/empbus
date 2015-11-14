package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class ProductoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static ProductoDAO instancia;

    public static ProductoDAO getInstancia() {
        if (instancia == null) {
            instancia = new ProductoDAO();
        }
        return instancia;
    }

    public void ingresar(Producto objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsProducto(?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdTipoProducto());
            cs.setString(2, objeto.getDescripcion());
            cs.setString(3, objeto.getCodigo());
            cs.setDouble(4, objeto.getUmCompra());
            cs.setDouble(5, objeto.getUmConsumo());
            cs.setInt(6, objeto.getIdUnidadMedidaCompra());
            cs.setInt(7, objeto.getIdUnidadMedidaConsumo());
            cs.setDouble(8, objeto.getConversion());
            cs.setString(9, objeto.getUsuario());
            cs.setInt(10, objeto.getIdFamilia());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public Producto obtener(int id) throws Exception {
        Producto objeto = new Producto();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetProducto(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdProducto(rs.getInt("Idproducto"));
                objeto.setIdTipoProducto(rs.getInt("Idtipoproducto"));
                objeto.setDTipoProducto(rs.getString("DTipoProducto"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setContador(rs.getInt("Contador"));
                objeto.setUmCompra(rs.getDouble("Umcompra"));
                objeto.setUmConsumo(rs.getDouble("Umconsumo"));
                objeto.setIdUnidadMedidaCompra(rs.getInt("Idunidadmedidacompra"));
                objeto.setIdUnidadMedidaConsumo(rs.getInt("Idunidadmedidaconsumo"));
                objeto.setConversion(rs.getDouble("Conversion"));
                objeto.setIdFamilia(rs.getInt("IdFamilia"));
                objeto.setDFamilia(rs.getString("DFamilia"));                
                objeto.setDUnidadMedidaCompra(rs.getString("DUnidadMedidaCompra"));
                objeto.setDUnidadMedidaConsumo(rs.getString("DUnidadMedidaConsumo"));
                objeto.setPrecio(rs.getDouble("Precio"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Producto objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdProducto(?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdProducto());
            cs.setInt(2, objeto.getIdTipoProducto());
            cs.setString(3, objeto.getDescripcion());
            cs.setString(4, objeto.getCodigo());
            cs.setDouble(5, objeto.getUmCompra());
            cs.setDouble(6, objeto.getUmConsumo());
            cs.setInt(7, objeto.getIdUnidadMedidaCompra());
            cs.setInt(8, objeto.getIdUnidadMedidaConsumo());
            cs.setDouble(9, objeto.getConversion());
            cs.setString(10, objeto.getUsuario());
            cs.setInt(11, objeto.getIdFamilia());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Producto objeto) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarProducto(?,?)");
            cs.setInt(1, objeto.getIdProducto());
            cs.setString(2,objeto.getUsuario());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    public ArrayList<Producto> buscar(Producto producto) throws Exception {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListProducto(?,?)");
            cs.setInt(1, producto.getIdFamilia());
            cs.setString(2, producto.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                Producto objeto = new Producto();
                objeto.setIdProducto(rs.getInt("idProducto"));
                objeto.setIdTipoProducto(rs.getInt("idTipoProducto"));
                objeto.setDTipoProducto(rs.getString("DTipoProducto"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setCodigo(rs.getString("Codigo"));
                objeto.setUmCompra(rs.getDouble("Umcompra"));
                objeto.setUmConsumo(rs.getDouble("Umconsumo"));
                objeto.setIdUnidadMedidaCompra(rs.getInt("Idunidadmedidacompra"));
                objeto.setDUnidadMedidaCompra(rs.getString("DUnidadMedidaCompra"));
                objeto.setIdUnidadMedidaConsumo(rs.getInt("Idunidadmedidaconsumo"));
                objeto.setDUnidadMedidaConsumo(rs.getString("DUnidadMedidaConsumo"));
                objeto.setConversion(rs.getDouble("Conversion"));
                objeto.setIdFamilia(rs.getInt("IdFamilia"));
                objeto.setDFamilia(rs.getString("DFamilia"));
                objeto.setPrecio(rs.getDouble("Precio"));
                lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return lista;
    }
    
    public int obtenerStock(int idAlmacen, int idProducto) throws Exception {
        int stock = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetStock(?,?)");
            cs.setInt(1, idAlmacen);
            cs.setInt(2, idProducto);
            rs = cs.executeQuery();
            while (rs.next()) {
                stock = rs.getInt("Cantidad");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return stock;
    }
        
}
