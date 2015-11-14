package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class TipoMovimientoController extends ActionSupport {

    private TipoMovimiento Otipomovimiento = new TipoMovimiento();
    private ArrayList<TipoMovimiento> ListaTipoMovimiento = new ArrayList<TipoMovimiento>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

                setListaTipoMovimiento(TipoMovimientoDAO.getInstancia().buscar(Otipomovimiento));

                return "Autorizado";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            setError((Boolean) true);
            return "NoAutorizado";
        }
    }

    public String GrabarTipoMovimiento() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                TipoMovimientoDAO.getInstancia().ingresar(Otipomovimiento, (Usuario) session.get("Usuario"));
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

    public String ObtenerTipoMovimiento() throws Exception {
        try {
            Otipomovimiento = TipoMovimientoDAO.getInstancia().obtener(Otipomovimiento.getIdTipoMovimiento());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoMovimiento() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                TipoMovimientoDAO.getInstancia().editar(Otipomovimiento, (Usuario) session.get("Usuario"));
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

    public String EliminarTipoMovimiento() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                TipoMovimientoDAO.getInstancia().eliminar(Otipomovimiento, (Usuario) session.get("Usuario"));
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
    
    public String BuscarTipoMovimiento() throws Exception {
        try {
            setListaTipoMovimiento(TipoMovimientoDAO.getInstancia().buscar(Otipomovimiento));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public TipoMovimiento getOtipomovimiento() {
        return Otipomovimiento;
    }

    public void setOtipomovimiento(TipoMovimiento Otipomovimiento) {
        this.Otipomovimiento = Otipomovimiento;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<TipoMovimiento> getListaTipoMovimiento() {
        return ListaTipoMovimiento;
    }

    public void setListaTipoMovimiento(ArrayList<TipoMovimiento> ListaTipoMovimiento) {
        this.ListaTipoMovimiento = ListaTipoMovimiento;
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
