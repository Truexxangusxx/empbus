package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class FamiliaController extends ActionSupport {

    private Familia Ofamilia = new Familia();
    private ArrayList<Familia> ListaFamilia = new ArrayList<Familia>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean permiso = false;

    public String Load() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                Ofamilia.setDescripcion("");
                setListaFamilia(FamiliaDAO.getInstancia().buscar(Ofamilia));
                msg = "Bienvenido";
                return "Autorizado";
            } else {
                msg = "No cuenta con los permisos necesarios";
                return "Autorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "Autorizado";
        }
    }

    public String GrabarFamilia() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                FamiliaDAO.getInstancia().ingresar(Ofamilia, (Usuario) session.get("Usuario"));
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

    public String ObtenerFamilia() throws Exception {
        try {
            Ofamilia = FamiliaDAO.getInstancia().obtener(Ofamilia.getIdFamilia());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarFamilia() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                FamiliaDAO.getInstancia().editar(Ofamilia, (Usuario) session.get("Usuario"));
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

    public String EliminarFamilia() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                FamiliaDAO.getInstancia().eliminar(Ofamilia, (Usuario) session.get("Usuario"));
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
    
    public String BuscarFamilia() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                setListaFamilia(FamiliaDAO.getInstancia().buscar(Ofamilia));
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

    public Familia getOfamilia() {
        return Ofamilia;
    }

    public void setOfamilia(Familia Ofamilia) {
        this.Ofamilia = Ofamilia;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Familia> getListaFamilia() {
        return ListaFamilia;
    }

    public void setListaFamilia(ArrayList<Familia> ListaFamilia) {
        this.ListaFamilia = ListaFamilia;
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
        return permiso;
    }

    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
    }
}
