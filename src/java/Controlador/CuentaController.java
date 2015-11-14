package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class CuentaController extends ActionSupport {

    private Cuenta Ocuenta = new Cuenta();
    private ArrayList<Cuenta> ListaCuenta = new ArrayList<Cuenta>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private String Operacion = "Edicion";

    public String Load() throws Exception {
    
        
        
        return SUCCESS;
    }
    
    public String GrabarCuenta() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                CuentaDAO.getInstancia().ingresar(Ocuenta, (Usuario) session.get("Usuario"));
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

    public String ObtenerCuenta() throws Exception {
        try {
            Ocuenta = CuentaDAO.getInstancia().obtener(Ocuenta.getIdCuenta());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarCuenta() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                CuentaDAO.getInstancia().editar(Ocuenta, (Usuario) session.get("Usuario"));
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

    public String EliminarCuenta() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                CuentaDAO.getInstancia().eliminar(Ocuenta, (Usuario) session.get("Usuario"));
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

    public String BuscarCuenta() throws Exception {
        try {
            ListaCuenta = CuentaDAO.getInstancia().buscar(Ocuenta);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Cuenta getOcuenta() {
        return Ocuenta;
    }

    public void setOcuenta(Cuenta Ocuenta) {
        this.Ocuenta = Ocuenta;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Cuenta> getListaCuenta() {
        return ListaCuenta;
    }

    public void setListaCuenta(ArrayList<Cuenta> ListaCuenta) {
        this.ListaCuenta = ListaCuenta;
    }

    /**
     * @return the permiso
     */
    public Boolean getPermiso() {
        return permiso;
    }

    /**
     * @param permiso the permiso to set
     */
    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
    }

    /**
     * @return the error
     */
    public Boolean getError() {
        return error;
    }

    /**
     * @param error the error to set
     */
    public void setError(Boolean error) {
        this.error = error;
    }

    /**
     * @return the session
     */
    public Map getSession() {
        return session;
    }

    /**
     * @param session the session to set
     */
    public void setSession(Map session) {
        this.session = session;
    }

    /**
     * @return the Operacion
     */
    public String getOperacion() {
        return Operacion;
    }

    /**
     * @param Operacion the Operacion to set
     */
    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }
}
