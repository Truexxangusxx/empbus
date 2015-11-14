package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ActividadController extends ActionSupport {

    private Actividad Oactividad = new Actividad();
    private ArrayList<Actividad> ListaActividad = new ArrayList<Actividad>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOactividad().setDescripcion("");
                setListaActividad(ActividadDAO.getInstancia().buscar(getOactividad()));
                return "Autorizado";
            }
            else{
                return "NoAutorizado";
            }
        }
        catch(Exception ex){
            error = true;
            msg=ex.getMessage();
        return "NoAutorizado";
        }
    }
    
    public String GrabarActividad() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ActividadDAO.getInstancia().ingresar(getOactividad(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerActividad() throws Exception {
        try {
            setOactividad(ActividadDAO.getInstancia().obtener(getOactividad().getIdActividad()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarActividad() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ActividadDAO.getInstancia().editar(getOactividad(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarActividad() throws Exception {
        try {
            ActividadDAO.getInstancia().eliminar(getOactividad());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarActividad() throws Exception {
        try {
            setListaActividad(ActividadDAO.getInstancia().buscar(getOactividad()));
            msg = "Busqueda correcta";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Actividad> getListaActividad() {
        return ListaActividad;
    }

    public void setListaActividad(ArrayList<Actividad> ListaActividad) {
        this.ListaActividad = ListaActividad;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }

    public Boolean getPermiso() {
        return Permiso;
    }

    public void setPermiso(Boolean Permiso) {
        this.Permiso = Permiso;
    }

    public Actividad getOactividad() {
        return Oactividad;
    }

    public void setOactividad(Actividad Oactividad) {
        this.Oactividad = Oactividad;
    }
}
