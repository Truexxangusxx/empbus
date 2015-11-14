package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class TipoAdquisicionController extends ActionSupport {

    private TipoAdquisicion Otipoadquisicion = new TipoAdquisicion();
    private ArrayList<TipoAdquisicion> ListaTipoAdquisicion = new ArrayList<TipoAdquisicion>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String GrabarTipoAdquisicion() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoAdquisicionDAO.getInstancia().ingresar(Otipoadquisicion, (Usuario) getSession().get("Usuario"));
                msg = "Se registro correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerTipoAdquisicion() throws Exception {
        try {
            Otipoadquisicion = TipoAdquisicionDAO.getInstancia().obtener(Otipoadquisicion.getIdTipoAdquisicion());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoAdquisicion() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoAdquisicionDAO.getInstancia().editar(Otipoadquisicion, (Usuario) getSession().get("Usuario"));
                msg = "Se Edito correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarTipoAdquisicion() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoAdquisicionDAO.getInstancia().eliminar(Otipoadquisicion, (Usuario) getSession().get("Usuario"));
                msg = "Se Elimino correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarTipoAdquisicion() throws Exception {
        try {
            ListaTipoAdquisicion = TipoAdquisicionDAO.getInstancia().buscar(Otipoadquisicion);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public TipoAdquisicion getOtipoadquisicion() {
        return Otipoadquisicion;
    }

    public void setOtipoadquisicion(TipoAdquisicion Otipoadquisicion) {
        this.Otipoadquisicion = Otipoadquisicion;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<TipoAdquisicion> getListaTipoAdquisicion() {
        return ListaTipoAdquisicion;
    }

    public void setListaTipoAdquisicion(ArrayList<TipoAdquisicion> ListaTipoAdquisicion) {
        this.ListaTipoAdquisicion = ListaTipoAdquisicion;
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

    public Boolean getPermiso() {
        return permiso;
    }

    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
    }
}
