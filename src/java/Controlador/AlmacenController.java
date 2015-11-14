package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class AlmacenController extends ActionSupport {

    private Almacen Oalmacen = new Almacen();
    private ArrayList<Almacen> ListaAlmacen = new ArrayList<Almacen>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();

    public String Load() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                Oalmacen.setDescripcion("");
                setListaAlmacen(AlmacenDAO.getInstancia().buscar(Oalmacen));
                Sucursal suc = new Sucursal();
                suc.setDescripcion("");
                setListaSucursal(SucursalDAO.getInstancia().buscar(suc));
                return "Autorizado";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }
    
    public String GrabarAlmacen() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                AlmacenDAO.getInstancia().ingresar(Oalmacen, (Usuario) session.get("Usuario"));
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

    public String ObtenerAlmacen() throws Exception {
        try {
            Oalmacen = AlmacenDAO.getInstancia().obtener(Oalmacen.getIdAlmacen());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarAlmacen() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                AlmacenDAO.getInstancia().editar(Oalmacen, (Usuario) session.get("Usuario"));
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

    public String EliminarAlmacen() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                AlmacenDAO.getInstancia().eliminar(Oalmacen, (Usuario) session.get("Usuario"));
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
    
    public String BuscarAlmacen() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                setListaAlmacen(AlmacenDAO.getInstancia().buscar(Oalmacen));
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Almacen getOalmacen() {
        return Oalmacen;
    }

    public void setOalmacen(Almacen Oalmacen) {
        this.Oalmacen = Oalmacen;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Almacen> getListaAlmacen() {
        return ListaAlmacen;
    }

    public void setListaAlmacen(ArrayList<Almacen> ListaAlmacen) {
        this.ListaAlmacen = ListaAlmacen;
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

    public ArrayList<Sucursal> getListaSucursal() {
        return ListaSucursal;
    }

    public void setListaSucursal(ArrayList<Sucursal> ListaSucursal) {
        this.ListaSucursal = ListaSucursal;
    }
}
