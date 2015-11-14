package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class TipoProductoController extends ActionSupport {

    private TipoProducto OtipoProducto = new TipoProducto();
    private ArrayList<TipoProducto> ListaTipoProducto = new ArrayList<TipoProducto>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;

    public String Load(){
        try{
            setPermiso(true);
            if (Permiso){
                getOtipoProducto().setDescripcion("");
                setListaTipoProducto(TipoProductoDAO.getInstancia().buscar(getOtipoProducto()));
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
    
    public String GrabarTipoProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoProductoDAO.getInstancia().ingresar(getOtipoProducto(), ((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerTipoProducto() throws Exception {
        try {
            setOtipoProducto(TipoProductoDAO.getInstancia().obtener(getOtipoProducto().getIdTipoProducto()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoProductoDAO.getInstancia().editar(getOtipoProducto(),((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarTipoProducto() throws Exception {
        try {
            TipoProductoDAO.getInstancia().eliminar(getOtipoProducto());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarTipoProducto() throws Exception {
        try {
            setListaTipoProducto(TipoProductoDAO.getInstancia().buscar(getOtipoProducto()));
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

    public ArrayList<TipoProducto> getListaTipoProducto() {
        return ListaTipoProducto;
    }

    public void setListaTipoProducto(ArrayList<TipoProducto> ListaTipoProducto) {
        this.ListaTipoProducto = ListaTipoProducto;
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

    public TipoProducto getOtipoProducto() {
        return OtipoProducto;
    }

    public void setOtipoProducto(TipoProducto OtipoProducto) {
        this.OtipoProducto = OtipoProducto;
    }
}
