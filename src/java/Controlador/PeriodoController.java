package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class PeriodoController extends ActionSupport {

    private Periodo Operiodo = new Periodo();
    private ArrayList<Periodo> ListaPeriodo = new ArrayList<Periodo>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    
    public String Load(){
        
        
        return SUCCESS;
    }
    
    public String GrabarPeriodo() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PeriodoDAO.getInstancia().ingresar(Operiodo, (Usuario) getSession().get("Usuario"));
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

    public String ObtenerPeriodo() throws Exception {
        try {
            Operiodo = PeriodoDAO.getInstancia().obtener(Operiodo.getIdPeriodo());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarPeriodo() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PeriodoDAO.getInstancia().editar(Operiodo, (Usuario) getSession().get("Usuario"));
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

    public String EliminarPeriodo() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PeriodoDAO.getInstancia().eliminar(Operiodo, (Usuario) getSession().get("Usuario"));
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
    
    public String BuscarPeriodo() throws Exception {
        try {
            ListaPeriodo = PeriodoDAO.getInstancia().buscar(Operiodo);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    

    public Periodo getOperiodo() {
        return Operiodo;
    }

    public void setOperiodo(Periodo Operiodo) {
        this.Operiodo = Operiodo;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Periodo> getListaPeriodo() {
        return ListaPeriodo;
    }

    public void setListaPeriodo(ArrayList<Periodo> ListaPeriodo) {
        this.ListaPeriodo = ListaPeriodo;
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
