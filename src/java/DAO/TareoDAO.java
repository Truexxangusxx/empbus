package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;
import java.sql.Types;

public class TareoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static TareoDAO instancia;

    public static TareoDAO getInstancia() {
        if (instancia == null) {
            instancia = new TareoDAO();
        }
        return instancia;
    }

    public int ingresar(Tareo objeto, String usuario, String xml) throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspInsTareo(?,?,?,?,?,?,?,?,?,?,?)");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setString(2, objeto.getPeriodo());
            cs.setString(3, objeto.getNumero());
            cs.setString(4, objeto.getFecha());
            cs.setDouble(5, objeto.getTipoCambio());
            cs.setInt(6, objeto.getSucursal().getIdSucursal());
            cs.setInt(7, objeto.getEmpleado().getIdEmpleado());
            cs.setString(8, objeto.getObservaciones());
            cs.setDouble(9, objeto.getTotalHoras());
            cs.setString(10, usuario);
            cs.setString(11, xml);
            cs.execute();
            id = Integer.parseInt(cs.getObject(1).toString());
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }

    public Tareo obtener(int id) throws Exception {
        Tareo objeto = new Tareo();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetTareo(?)");
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                objeto.setIdTareo(rs.getInt("idTareo"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("TipoCambio"));
                objeto.setSucursal(new Sucursal(rs.getInt("idSucursal"), rs.getString("DSucursal")));
                objeto.setEmpleado(new Empleado(rs.getInt("idEmpleado"), rs.getString("dEmpleado"), rs.getString("codEmpleado")));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setTotalHoras(rs.getDouble("TotalHoras"));
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return objeto;
    }

    public void editar(Tareo objeto, String usuario, String xml) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdTareo(?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, objeto.getIdTareo());
            cs.setString(2, objeto.getPeriodo());
            cs.setString(3, objeto.getNumero());
            cs.setString(4, objeto.getFecha());
            cs.setDouble(5, objeto.getTipoCambio());
            cs.setInt(6, objeto.getSucursal().getIdSucursal());
            cs.setInt(7, objeto.getEmpleado().getIdEmpleado());
            cs.setString(8, objeto.getObservaciones());
            cs.setDouble(9, objeto.getTotalHoras());
            cs.setString(10, usuario);
            cs.setString(11, xml);
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public void eliminar(Tareo objeto, Usuario usuario) throws Exception {
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspUpdInactivarTareo(?,?)");
            cs.setInt(1, objeto.getIdTareo());
            cs.setString(2, usuario.getNick());
            cs.execute();
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public ArrayList<Tareo> buscar(Tareo obj) throws Exception {
        ArrayList<Tareo> ListaTareo = new ArrayList<Tareo>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListTareo(?)");
            cs.setString(1, obj.getNumero());
            rs = cs.executeQuery();
            while (rs.next()) {
                Tareo objeto = new Tareo();
                objeto.setIdTareo(rs.getInt("idTareo"));
                objeto.setPeriodo(rs.getString("Periodo"));
                objeto.setNumero(rs.getString("Numero"));
                objeto.setFecha(rs.getString("Fecha"));
                objeto.setTipoCambio(rs.getDouble("TipoCambio"));
                objeto.setSucursal(new Sucursal(rs.getInt("idSucursal"), rs.getString("DSucursal")));
                objeto.setEmpleado(new Empleado(rs.getInt("idEmpleado"), rs.getString("dEmpleado"), rs.getString("codEmpleado")));
                objeto.setObservaciones(rs.getString("Observaciones"));
                objeto.setTotalHoras(rs.getDouble("TotalHoras"));
                ListaTareo.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaTareo;
    }
    
    public int UltimoID() throws Exception {
        int id = 0;
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspGetUltimaTareo()");
            rs = cs.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idTareo");
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return id;
    }
    
    public ArrayList<DetalleTareo> buscarDetalle(Tareo obj) throws Exception {
        ArrayList<DetalleTareo> Lista = new ArrayList<DetalleTareo>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListDetalleTareo(?)");
            cs.setInt(1, obj.getIdTareo());
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleTareo objeto = new DetalleTareo();
                objeto.setIdDetalleTareo(rs.getInt("idDetalleTareo"));
                objeto.setIdTareo(rs.getInt("idTareo"));
                objeto.setEmpleado(new Empleado(rs.getInt("idEmpleado"), rs.getString("dempleado"), rs.getString("codempleado")));
                objeto.setOrdenProduccion(new OrdenProduccion(rs.getInt("idOrdenProduccion"),rs.getString("dordenproduccion")));
                objeto.setActividad(new Actividad(rs.getInt("idActividad"), rs.getString("dactividad"), rs.getString("codactividad")));
                objeto.setCentroCosto(new CentroCosto(rs.getInt("idCentroCosto"), rs.getString("dcentrocosto"), rs.getString("codcentrocosto")));
                objeto.setDescripcion(rs.getString("Descripcion"));
                objeto.setHoraInicio(rs.getDouble("HoraInicio"));
                objeto.setHoraFin(rs.getDouble("HoraFin"));
                objeto.setHoras(rs.getDouble("Horas"));
                Lista.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return Lista;
    }
    
}
