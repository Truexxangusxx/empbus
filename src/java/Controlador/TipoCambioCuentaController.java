package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class TipoCambioCuentaController extends ActionSupport {

    private TipoCambioCuenta Otipocambiocuenta = new TipoCambioCuenta();
    private ArrayList<TipoCambioCuenta> ListaTipoCambioCuenta = new ArrayList<TipoCambioCuenta>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOtipocambiocuenta().setDescripcion("");
                setListaTipoCambioCuenta(TipoCambioCuentaDAO.getInstancia().buscar(getOtipocambiocuenta()));
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
    
    public String GrabarTipoCambioCuenta() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoCambioCuentaDAO.getInstancia().ingresar(getOtipocambiocuenta(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerTipoCambioCuenta() throws Exception {
        try {
            setOtipocambiocuenta(TipoCambioCuentaDAO.getInstancia().obtener(getOtipocambiocuenta().getIdTipoCambioCuenta()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoCambioCuenta() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoCambioCuentaDAO.getInstancia().editar(getOtipocambiocuenta(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarTipoCambioCuenta() throws Exception {
        try {
            TipoCambioCuentaDAO.getInstancia().eliminar(getOtipocambiocuenta());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarTipoCambioCuenta() throws Exception {
        try {
            setListaTipoCambioCuenta(TipoCambioCuentaDAO.getInstancia().buscar(getOtipocambiocuenta()));
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

    public ArrayList<TipoCambioCuenta> getListaTipoCambioCuenta() {
        return ListaTipoCambioCuenta;
    }

    public void setListaTipoCambioCuenta(ArrayList<TipoCambioCuenta> ListaTipoCambioCuenta) {
        this.ListaTipoCambioCuenta = ListaTipoCambioCuenta;
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

    public TipoCambioCuenta getOtipocambiocuenta() {
        return Otipocambiocuenta;
    }

    public void setOtipocambiocuenta(TipoCambioCuenta Otipocambiocuenta) {
        this.Otipocambiocuenta = Otipocambiocuenta;
    }
}
