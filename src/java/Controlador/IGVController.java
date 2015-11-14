package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class IGVController extends ActionSupport {

    private IGV Oigv = new IGV();
    private ArrayList<IGV> ListaIGV = new ArrayList<IGV>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    public String GrabarIGV() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
            IGVDAO.getInstancia().ingresar(Oigv, (Usuario) getSession().get("Usuario"));
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

    public String ObtenerIGV() throws Exception {
        try {
            Oigv = IGVDAO.getInstancia().obtener();
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarIGV() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
            IGVDAO.getInstancia().editar(Oigv, (Usuario) getSession().get("Usuario"));
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
    
    public String BuscarIGV() throws Exception {
        try {
            ListaIGV = IGVDAO.getInstancia().buscar(Oigv);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    

    public IGV getOigv() {
        return Oigv;
    }

    public void setOigv(IGV Oigv) {
        this.Oigv = Oigv;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<IGV> getListaIGV() {
        return ListaIGV;
    }

    public void setListaIGV(ArrayList<IGV> ListaIGV) {
        this.ListaIGV = ListaIGV;
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
