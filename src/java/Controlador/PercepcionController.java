package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class PercepcionController extends ActionSupport {

    private Percepcion Opercepcion = new Percepcion();
    private ArrayList<Percepcion> ListaPercepcion = new ArrayList<Percepcion>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String GrabarPercepcion() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PercepcionDAO.getInstancia().ingresar(Opercepcion, (Usuario) getSession().get("Usuario"));
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

    public String ObtenerPercepcion() throws Exception {
        try {
            Opercepcion = PercepcionDAO.getInstancia().obtener(Opercepcion.getIdPercepcion());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarPercepcion() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PercepcionDAO.getInstancia().editar(Opercepcion, (Usuario) getSession().get("Usuario"));
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

    public String EliminarPercepcion() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                PercepcionDAO.getInstancia().eliminar(Opercepcion, (Usuario) getSession().get("Usuario"));
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
    
    public String BuscarPercepcion() throws Exception {
        try {
            ListaPercepcion = PercepcionDAO.getInstancia().buscar(Opercepcion);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    

    public Percepcion getOpercepcion() {
        return Opercepcion;
    }

    public void setOpercepcion(Percepcion Opercepcion) {
        this.Opercepcion = Opercepcion;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Percepcion> getListaPercepcion() {
        return ListaPercepcion;
    }

    public void setListaPercepcion(ArrayList<Percepcion> ListaPercepcion) {
        this.ListaPercepcion = ListaPercepcion;
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
