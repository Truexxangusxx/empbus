package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;

public class ServicioController extends ActionSupport {

    private Servicio Oservicio = new Servicio();
    private ArrayList<Servicio> ListaServicio = new ArrayList<Servicio>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String Load() throws Exception {
        
        
        
        return SUCCESS;
    }
    
    public String GrabarServicio() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                ServicioDAO.getInstancia().ingresar(Oservicio, (Usuario) session.get("Usuario"));
                msg = "Se registro correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerServicio() throws Exception {
        try {
            Oservicio = ServicioDAO.getInstancia().obtener(Oservicio.getIdServicio());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarServicio() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                ServicioDAO.getInstancia().editar(Oservicio, (Usuario) session.get("Usuario"));
                msg = "Se Edito correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarServicio() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                ServicioDAO.getInstancia().eliminar(Oservicio, (Usuario) session.get("Usuario"));
                msg = "Se Elimino correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarServicio() throws Exception {
        try {
            ListaServicio = ServicioDAO.getInstancia().buscar(Oservicio);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }


    public Servicio getOservicio() {
        return Oservicio;
    }

    public void setOservicio(Servicio Oservicio) {
        this.Oservicio = Oservicio;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Servicio> getListaServicio() {
        return ListaServicio;
    }

    public void setListaServicio(ArrayList<Servicio> ListaServicio) {
        this.ListaServicio = ListaServicio;
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

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }
}
