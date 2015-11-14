package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class NaturalezaController extends ActionSupport {

    private Naturaleza Onaturaleza = new Naturaleza();
    private ArrayList<Naturaleza> ListaNaturaleza = new ArrayList<Naturaleza>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOnaturaleza().setDescripcion("");
                setListaNaturaleza(NaturalezaDAO.getInstancia().buscar(getOnaturaleza()));
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
    
    public String GrabarNaturaleza() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            NaturalezaDAO.getInstancia().ingresar(getOnaturaleza(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerNaturaleza() throws Exception {
        try {
            setOnaturaleza(NaturalezaDAO.getInstancia().obtener(getOnaturaleza().getIdNaturaleza()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarNaturaleza() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            NaturalezaDAO.getInstancia().editar(getOnaturaleza(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarNaturaleza() throws Exception {
        try {
            NaturalezaDAO.getInstancia().eliminar(getOnaturaleza());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarNaturaleza() throws Exception {
        try {
            setListaNaturaleza(NaturalezaDAO.getInstancia().buscar(getOnaturaleza()));
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

    public ArrayList<Naturaleza> getListaNaturaleza() {
        return ListaNaturaleza;
    }

    public void setListaNaturaleza(ArrayList<Naturaleza> ListaNaturaleza) {
        this.ListaNaturaleza = ListaNaturaleza;
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

    public Naturaleza getOnaturaleza() {
        return Onaturaleza;
    }

    public void setOnaturaleza(Naturaleza Onaturaleza) {
        this.Onaturaleza = Onaturaleza;
    }
}
