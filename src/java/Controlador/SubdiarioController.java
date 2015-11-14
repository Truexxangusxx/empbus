package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class SubdiarioController extends ActionSupport {

    private Subdiario Osubdiario = new Subdiario();
    private ArrayList<Subdiario> ListaSubdiario = new ArrayList<Subdiario>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOsubdiario().setDescripcion("");
                setListaSubdiario(SubdiarioDAO.getInstancia().buscar(getOsubdiario()));
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
    
    public String GrabarSubdiario() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            SubdiarioDAO.getInstancia().ingresar(getOsubdiario(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerSubdiario() throws Exception {
        try {
            setOsubdiario(SubdiarioDAO.getInstancia().obtener(getOsubdiario().getIdSubdiario()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarSubdiario() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            SubdiarioDAO.getInstancia().editar(getOsubdiario(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarSubdiario() throws Exception {
        try {
            SubdiarioDAO.getInstancia().eliminar(getOsubdiario());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarSubdiario() throws Exception {
        try {
            setListaSubdiario(SubdiarioDAO.getInstancia().buscar(getOsubdiario()));
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

    public ArrayList<Subdiario> getListaSubdiario() {
        return ListaSubdiario;
    }

    public void setListaSubdiario(ArrayList<Subdiario> ListaSubdiario) {
        this.ListaSubdiario = ListaSubdiario;
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

    public Subdiario getOsubdiario() {
        return Osubdiario;
    }

    public void setOsubdiario(Subdiario Osubdiario) {
        this.Osubdiario = Osubdiario;
    }
}
