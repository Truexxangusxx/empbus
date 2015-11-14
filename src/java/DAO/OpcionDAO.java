package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class OpcionDAO {
private Connection cnn = null;
    private ResultSet rs = null;
    private static OpcionDAO instancia;

    public static OpcionDAO getInstancia() {
        if (instancia == null) {
            instancia = new OpcionDAO();
        }
        return instancia;
    }    
    
    public ArrayList<Opcion> BuscarOpcionPorModulo(Modulo modulo) throws Exception {
        ArrayList<Opcion> ListaOpcion = new ArrayList<Opcion>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListOpcionPorModulo(?)");
            cs.setInt(1, modulo.getIdModulo());
            rs = cs.executeQuery();
            while (rs.next()) {
                Opcion objeto = new Opcion();
                objeto.setIdOpcion(rs.getInt("idOpcion"));
                objeto.setDescripcion(rs.getString("Descripcion"));
                ListaOpcion.add(objeto);
            }
            cnn.close();
            cs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return ListaOpcion;
    }
    
}
