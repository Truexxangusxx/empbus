package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class EmpleadoController extends ActionSupport {

    private Empleado Oempleado = new Empleado();
    private ArrayList<Empleado> ListaEmpleado = new ArrayList<Empleado>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean permiso = false;

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            setPermiso((Boolean) true);
            if (getPermiso()) {

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

    public String GrabarEmpleado() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                EmpleadoDAO.getInstancia().ingresar(Oempleado, (Usuario) session.get("Usuario"));
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

    public String ObtenerEmpleado() throws Exception {
        try {
            Oempleado = EmpleadoDAO.getInstancia().obtener(Oempleado.getIdEmpleado());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarEmpleado() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                EmpleadoDAO.getInstancia().editar(Oempleado, (Usuario) session.get("Usuario"));
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

    public String EliminarEmpleado() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                EmpleadoDAO.getInstancia().eliminar(Oempleado, (Usuario) session.get("Usuario"));
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
    
    public String BuscarEmpleado() throws Exception {
        try {
            setListaEmpleado(EmpleadoDAO.getInstancia().buscar(Oempleado));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Empleado getOempleado() {
        return Oempleado;
    }

    public void setOempleado(Empleado Oempleado) {
        this.Oempleado = Oempleado;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Empleado> getListaEmpleado() {
        return ListaEmpleado;
    }

    public void setListaEmpleado(ArrayList<Empleado> ListaEmpleado) {
        this.ListaEmpleado = ListaEmpleado;
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
