package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;

public class TipoVentaController extends ActionSupport {

    private TipoVenta Otipoventa = new TipoVenta();
    private ArrayList<TipoVenta> ListaTipoVenta = new ArrayList<TipoVenta>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String Load() throws Exception {
        
        return SUCCESS;
    }
    
    public String GrabarTipoVenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoVentaDAO.getInstancia().ingresar(Otipoventa, (Usuario) session.get("Usuario"));
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

    public String ObtenerTipoVenta() throws Exception {
        try {
            Otipoventa = TipoVentaDAO.getInstancia().obtener(Otipoventa.getIdTipoVenta());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoVenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoVentaDAO.getInstancia().editar(Otipoventa, (Usuario) session.get("Usuario"));
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

    public String EliminarTipoVenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoVentaDAO.getInstancia().eliminar(Otipoventa, (Usuario) session.get("Usuario"));
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
    
    public String BuscarTipoVenta() throws Exception {
        try {
            ListaTipoVenta = TipoVentaDAO.getInstancia().buscar(Otipoventa);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    
    

    public TipoVenta getOtipoventa() {
        return Otipoventa;
    }

    public void setOtipoventa(TipoVenta Otipoventa) {
        this.Otipoventa = Otipoventa;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<TipoVenta> getListaTipoVenta() {
        return ListaTipoVenta;
    }

    public void setListaTipoVenta(ArrayList<TipoVenta> ListaTipoVenta) {
        this.ListaTipoVenta = ListaTipoVenta;
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
