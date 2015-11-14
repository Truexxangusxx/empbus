package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class CentroCostoController extends ActionSupport {

    private CentroCosto Ocentrocosto = new CentroCosto();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

                setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(Ocentrocosto));

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

    public String GrabarCentroCosto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                CentroCostoDAO.getInstancia().ingresar(Ocentrocosto, (Usuario) session.get("Usuario"));
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

    public String ObtenerCentroCosto() throws Exception {
        try {
            Ocentrocosto = CentroCostoDAO.getInstancia().obtener(Ocentrocosto.getIdCentroCosto());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarCentroCosto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                CentroCostoDAO.getInstancia().editar(Ocentrocosto, (Usuario) session.get("Usuario"));
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

    public String EliminarCentroCosto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                CentroCostoDAO.getInstancia().eliminar(Ocentrocosto, (Usuario) session.get("Usuario"));
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
    
    public String BuscarCentroCosto() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(Ocentrocosto));
                msg = "Se Elimino correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public CentroCosto getOcentrocosto() {
        return Ocentrocosto;
    }

    public void setOcentrocosto(CentroCosto Ocentrocosto) {
        this.Ocentrocosto = Ocentrocosto;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<CentroCosto> getListaCentroCosto() {
        return ListaCentroCosto;
    }

    public void setListaCentroCosto(ArrayList<CentroCosto> ListaCentroCosto) {
        this.ListaCentroCosto = ListaCentroCosto;
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
