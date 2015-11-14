package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class AporteController extends ActionSupport {

    private Aporte Oaporte = new Aporte();
    private ArrayList<Aporte> ListaAporte = new ArrayList<Aporte>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String GrabarAporte() throws Exception {
        try {
            permiso = true;
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                AporteDAO.getInstancia().ingresar(Oaporte, (Usuario) getSession().get("Usuario"));
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

    public String ObtenerAporte() throws Exception {
        try {
            Oaporte = AporteDAO.getInstancia().obtener(Oaporte.getIdAporte());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarAporte() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                AporteDAO.getInstancia().editar(Oaporte, (Usuario) getSession().get("Usuario"));
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

    public String EliminarAporte() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                AporteDAO.getInstancia().eliminar(Oaporte, (Usuario) getSession().get("Usuario"));
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
    
    public String BuscarAporte() throws Exception {
        try {
            ListaAporte = AporteDAO.getInstancia().buscar(Oaporte);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Aporte getOaporte() {
        return Oaporte;
    }

    public void setOaporte(Aporte Oaporte) {
        this.Oaporte = Oaporte;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Aporte> getListaAporte() {
        return ListaAporte;
    }

    public void setListaAporte(ArrayList<Aporte> ListaAporte) {
        this.ListaAporte = ListaAporte;
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
