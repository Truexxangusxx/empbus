package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class AjusteController extends ActionSupport {

    private Ajuste Oajuste = new Ajuste();
    private ArrayList<Ajuste> ListaAjuste = new ArrayList<Ajuste>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOajuste().setDescripcion("");
                setListaAjuste(AjusteDAO.getInstancia().buscar(getOajuste()));
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
    
    public String GrabarAjuste() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            AjusteDAO.getInstancia().ingresar(getOajuste(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerAjuste() throws Exception {
        try {
            setOajuste(AjusteDAO.getInstancia().obtener(getOajuste().getIdAjuste()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarAjuste() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            AjusteDAO.getInstancia().editar(getOajuste(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarAjuste() throws Exception {
        try {
            AjusteDAO.getInstancia().eliminar(getOajuste());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarAjuste() throws Exception {
        try {
            setListaAjuste(AjusteDAO.getInstancia().buscar(getOajuste()));
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

    public ArrayList<Ajuste> getListaAjuste() {
        return ListaAjuste;
    }

    public void setListaAjuste(ArrayList<Ajuste> ListaAjuste) {
        this.ListaAjuste = ListaAjuste;
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

    public Ajuste getOajuste() {
        return Oajuste;
    }

    public void setOajuste(Ajuste Oajuste) {
        this.Oajuste = Oajuste;
    }
}
