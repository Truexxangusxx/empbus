package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;

public class TipoDocumentoController extends ActionSupport {

    private TipoDocumento Otipodocumento = new TipoDocumento();
    private ArrayList<TipoDocumento> ListaTipoDocumento = new ArrayList<TipoDocumento>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;

    
    public String Load() throws Exception {
        
        
        
        return SUCCESS;
    }
    
    public String GrabarTipoDocumento() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoDocumentoDAO.getInstancia().ingresar(Otipodocumento, (Usuario) session.get("Usuario"));
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

    public String ObtenerTipoDocumento() throws Exception {
        try {
            Otipodocumento = TipoDocumentoDAO.getInstancia().obtener(Otipodocumento.getIdTipoDocumento());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTipoDocumento() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoDocumentoDAO.getInstancia().editar(Otipodocumento, (Usuario) session.get("Usuario"));
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

    public String EliminarTipoDocumento() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                TipoDocumentoDAO.getInstancia().eliminar(Otipodocumento, (Usuario) session.get("Usuario"));
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
    
    public String BuscarTipoDocumento() throws Exception {
        try {
            ListaTipoDocumento = TipoDocumentoDAO.getInstancia().buscar(Otipodocumento);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public TipoDocumento getOtipodocumento() {
        return Otipodocumento;
    }

    public void setOtipodocumento(TipoDocumento Otipodocumento) {
        this.Otipodocumento = Otipodocumento;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<TipoDocumento> getListaTipoDocumento() {
        return ListaTipoDocumento;
    }

    public void setListaTipoDocumento(ArrayList<TipoDocumento> ListaTipoDocumento) {
        this.ListaTipoDocumento = ListaTipoDocumento;
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
