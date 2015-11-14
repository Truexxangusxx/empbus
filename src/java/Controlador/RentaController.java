package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class RentaController extends ActionSupport {

    private Renta Orenta = new Renta();
    private ArrayList<Renta> ListaRenta = new ArrayList<Renta>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String GrabarRenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                RentaDAO.getInstancia().ingresar(Orenta, (Usuario) getSession().get("Usuario"));
                msg = "Se registro correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerRenta() throws Exception {
        try {
            Orenta = RentaDAO.getInstancia().obtener(Orenta.getIdRenta());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarRenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                RentaDAO.getInstancia().editar(Orenta, (Usuario) getSession().get("Usuario"));
                msg = "Se Edito correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarRenta() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                RentaDAO.getInstancia().eliminar(Orenta, (Usuario) getSession().get("Usuario"));
                msg = "Se Elimino correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarRenta() throws Exception {
        try {
            ListaRenta = RentaDAO.getInstancia().buscar(Orenta);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public Renta getOrenta() {
        return Orenta;
    }

    public void setOrenta(Renta Orenta) {
        this.Orenta = Orenta;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Renta> getListaRenta() {
        return ListaRenta;
    }

    public void setListaRenta(ArrayList<Renta> ListaRenta) {
        this.ListaRenta = ListaRenta;
    }

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
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
}
