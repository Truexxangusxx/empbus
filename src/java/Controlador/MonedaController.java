package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class MonedaController extends ActionSupport {

    private Moneda Omoneda = new Moneda();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    
    public String BuscarMoneda() throws Exception{
        Omoneda.setDescripcion("");
        setListaMoneda(MonedaDAO.getInstancia().buscar(Omoneda));
        return SUCCESS;
    }
        
    
    

    public Moneda getOmoneda() {
        return Omoneda;
    }

    public void setOmoneda(Moneda Omoneda) {
        this.Omoneda = Omoneda;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Boolean getPermiso() {
        return permiso;
    }

    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
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
    
    
}
