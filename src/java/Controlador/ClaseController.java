package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ClaseController extends ActionSupport {

    private Clase Oclase = new Clase();
    private ArrayList<Clase> ListaClase = new ArrayList<Clase>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOclase().setDescripcion("");
                setListaClase(ClaseDAO.getInstancia().buscar(getOclase()));
                return "Autorizado";
            }
            else{
                return "NoAutorizado";
            }
        }
        catch(Exception ex){
        return "NoAutorizado";
        }
    }
    
    public String GrabarClase() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ClaseDAO.getInstancia().ingresar(getOclase(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerClase() throws Exception {
        try {
            setOclase(ClaseDAO.getInstancia().obtener(getOclase().getIdClase()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarClase() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ClaseDAO.getInstancia().editar(getOclase(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarClase() throws Exception {
        try {
            ClaseDAO.getInstancia().eliminar(getOclase());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarClase() throws Exception {
        try {
            setListaClase(ClaseDAO.getInstancia().buscar(getOclase()));
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

    public ArrayList<Clase> getListaClase() {
        return ListaClase;
    }

    public void setListaClase(ArrayList<Clase> ListaClase) {
        this.ListaClase = ListaClase;
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

    public Clase getOclase() {
        return Oclase;
    }

    public void setOclase(Clase Oclase) {
        this.Oclase = Oclase;
    }
}
