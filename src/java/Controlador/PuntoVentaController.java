package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class PuntoVentaController extends ActionSupport {

    private PuntoVenta OpuntoVenta = new PuntoVenta();
    private ArrayList<PuntoVenta> ListaPuntoVenta = new ArrayList<PuntoVenta>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String Load() throws Exception{
    
        
        
        return SUCCESS;
    }   
    
    public String GrabarPuntoVenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PuntoVentaDAO.getInstancia().ingresar(OpuntoVenta, (Usuario) session.get("Usuario"));
                msg = "Se registro correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerPuntoVenta() throws Exception {
        try {
            OpuntoVenta = PuntoVentaDAO.getInstancia().obtener(OpuntoVenta.getIdPuntoVenta());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarPuntoVenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PuntoVentaDAO.getInstancia().editar(OpuntoVenta, (Usuario) session.get("Usuario"));
                msg = "Se Edito correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarPuntoVenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PuntoVentaDAO.getInstancia().eliminar(OpuntoVenta, (Usuario) session.get("Usuario"));
                msg = "Se Elimino correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarPuntoVenta() throws Exception {
        try {
            ListaPuntoVenta = PuntoVentaDAO.getInstancia().buscar(OpuntoVenta);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public PuntoVenta getOpuntoVenta() {
        return OpuntoVenta;
    }

    public void setOpuntoVenta(PuntoVenta OpuntoVenta) {
        this.OpuntoVenta = OpuntoVenta;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<PuntoVenta> getListaPuntoVenta() {
        return ListaPuntoVenta;
    }

    public void setListaPuntoVenta(ArrayList<PuntoVenta> ListaPuntoVenta) {
        this.ListaPuntoVenta = ListaPuntoVenta;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public Boolean getPermiso() {
        return permiso;
    }

    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
    }

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }
}
