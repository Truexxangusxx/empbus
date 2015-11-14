package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class TipoCompraController extends ActionSupport {

    private TipoCompra Otipocompra = new TipoCompra();
    private ArrayList<TipoCompra> ListaTipoCompra = new ArrayList<TipoCompra>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String GrabarTipoCompra() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoCompraDAO.getInstancia().ingresar(Otipocompra, (Usuario) getSession().get("Usuario"));
                msg = "Se registro correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerTipoCompra() throws Exception {
        try {
            Otipocompra = TipoCompraDAO.getInstancia().obtener(Otipocompra.getIdTipoCompra());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoCompra() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoCompraDAO.getInstancia().editar(Otipocompra, (Usuario) getSession().get("Usuario"));
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

    public String EliminarTipoCompra() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoCompraDAO.getInstancia().eliminar(Otipocompra, (Usuario) getSession().get("Usuario"));
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

    public String BuscarTipoCompra() throws Exception {
        try {
            ListaTipoCompra = TipoCompraDAO.getInstancia().buscar(Otipocompra);
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }

    public TipoCompra getOtipocompra() {
        return Otipocompra;
    }

    public void setOtipocompra(TipoCompra Otipocompra) {
        this.Otipocompra = Otipocompra;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<TipoCompra> getListaTipoCompra() {
        return ListaTipoCompra;
    }

    public void setListaTipoCompra(ArrayList<TipoCompra> ListaTipoCompra) {
        this.ListaTipoCompra = ListaTipoCompra;
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
