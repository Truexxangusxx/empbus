package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ModuloController extends ActionSupport {

    private Modulo Omodulo = new Modulo();
    private ArrayList<Modulo> ListaModulo = new ArrayList<Modulo>();
    private String msg = "";
    private Map session;
    private Boolean error = false;

    
    public String Load() {
        try {
            Omodulo.setDescripcion("");
            setListaModulo(ModuloDAO.getInstancia().BuscarModulo(Omodulo));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarModulo() {
        try {
            setListaModulo(ModuloDAO.getInstancia().BuscarModulo(Omodulo));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Modulo getOmodulo() {
        return Omodulo;
    }

    public void setOmodulo(Modulo Omodulo) {
        this.Omodulo = Omodulo;
    }

    public ArrayList<Modulo> getListaModulo() {
        return ListaModulo;
    }

    public void setListaModulo(ArrayList<Modulo> ListaModulo) {
        this.ListaModulo = ListaModulo;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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
}
