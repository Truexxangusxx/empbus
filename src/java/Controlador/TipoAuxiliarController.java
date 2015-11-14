package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class TipoAuxiliarController extends ActionSupport {

    private TipoAuxiliar Otipoauxiliar = new TipoAuxiliar();
    private ArrayList<TipoAuxiliar> ListaTipoAuxiliar = new ArrayList<TipoAuxiliar>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOtipoauxiliar().setDescripcion("");
                setListaTipoAuxiliar(TipoAuxiliarDAO.getInstancia().buscar(getOtipoauxiliar()));
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
    
    public String GrabarTipoAuxiliar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoAuxiliarDAO.getInstancia().ingresar(getOtipoauxiliar(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerTipoAuxiliar() throws Exception {
        try {
            setOtipoauxiliar(TipoAuxiliarDAO.getInstancia().obtener(getOtipoauxiliar().getIdTipoAuxiliar()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoAuxiliar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoAuxiliarDAO.getInstancia().editar(getOtipoauxiliar(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarTipoAuxiliar() throws Exception {
        try {
            TipoAuxiliarDAO.getInstancia().eliminar(getOtipoauxiliar());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarTipoAuxiliar() throws Exception {
        try {
            setListaTipoAuxiliar(TipoAuxiliarDAO.getInstancia().buscar(getOtipoauxiliar()));
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

    public ArrayList<TipoAuxiliar> getListaTipoAuxiliar() {
        return ListaTipoAuxiliar;
    }

    public void setListaTipoAuxiliar(ArrayList<TipoAuxiliar> ListaTipoAuxiliar) {
        this.ListaTipoAuxiliar = ListaTipoAuxiliar;
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

    public TipoAuxiliar getOtipoauxiliar() {
        return Otipoauxiliar;
    }

    public void setOtipoauxiliar(TipoAuxiliar Otipoauxiliar) {
        this.Otipoauxiliar = Otipoauxiliar;
    }
}
