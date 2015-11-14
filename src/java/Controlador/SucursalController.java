package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class SucursalController extends ActionSupport {

    private Sucursal Osucursal = new Sucursal();
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;

    public String Load() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                Osucursal.setDescripcion("");
                setListaSucursal(SucursalDAO.getInstancia().buscar(Osucursal));
                return "Autorizado";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarSucursal() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                SucursalDAO.getInstancia().ingresar(Osucursal, (Usuario) session.get("Usuario"));
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

    public String ObtenerSucursal() throws Exception {
        try {
            Osucursal = SucursalDAO.getInstancia().obtener(Osucursal.getIdSucursal());
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarSucursal() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                SucursalDAO.getInstancia().editar(Osucursal, (Usuario) session.get("Usuario"));
                msg = "Se Edito correctamente";
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

    public String EliminarSucursal() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                SucursalDAO.getInstancia().eliminar(Osucursal, (Usuario) session.get("Usuario"));
                msg = "Se Elimino correctamente";
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

    public String BuscarSucursal() throws Exception {
        try {
            setListaSucursal(SucursalDAO.getInstancia().buscar(Osucursal));
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Sucursal getOsucursal() {
        return Osucursal;
    }

    public void setOsucursal(Sucursal Osucursal) {
        this.Osucursal = Osucursal;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Sucursal> getListaSucursal() {
        return ListaSucursal;
    }

    public void setListaSucursal(ArrayList<Sucursal> ListaSucursal) {
        this.ListaSucursal = ListaSucursal;
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
