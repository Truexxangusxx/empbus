package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.*;

public class FormaPagoDAO {

    private Connection cnn = null;
    private ResultSet rs = null;
    private static FormaPagoDAO instancia;

    public static FormaPagoDAO getInstancia() {
        if (instancia == null) {
            instancia = new FormaPagoDAO();
        }
        return instancia;
    }
    
    
    public ArrayList<FormaPago> buscar(FormaPago formapago) throws Exception {
        ArrayList<FormaPago> lista = new ArrayList<FormaPago>();
        try {
            cnn = Conexion.getConexion();
            CallableStatement cs = null;
            cs = cnn.prepareCall("call uspListFormaPago(?)");
            cs.setString(1, formapago.getDescripcion());
            rs = cs.executeQuery();
            while (rs.next()) {
                FormaPago objeto = new FormaPago();
                objeto.setIdFormaPago(rs.getInt("IdFormaPago"));
                objeto.setDescripcion(rs.getString("Descripcion"));
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
