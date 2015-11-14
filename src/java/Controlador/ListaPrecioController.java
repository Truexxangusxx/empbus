package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class ListaPrecioController extends ActionSupport {

    private ListaPrecio Olistaprecio = new ListaPrecio();
    private ArrayList<ListaPrecio> ListaListaPrecio = new ArrayList<ListaPrecio>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    
    public String Load(){
        try {
            permiso = true;
            if (permiso) {
                Producto pro = new Producto();        
                pro.setDescripcion("");
                setListaProducto(ProductoDAO.getInstancia().buscar(pro));
                ListaProducto.add(0, pro);
                setListaListaPrecio(ListaPrecioDAO.getInstancia().buscar(Olistaprecio));
                Date ahora = new Date();
                SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                Olistaprecio.setFecha(formateador.format(ahora));
                return "Autorizado";
            } else {
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarListaPrecio() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                Olistaprecio.setFecha(helper.getFechaValida(Olistaprecio.getFecha()));
                ListaPrecioDAO.getInstancia().ingresar(Olistaprecio, (Usuario) session.get("Usuario"));
                msg = "Se registro correctamente";
            } else {
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerListaPrecio() throws Exception {
        try {
            Olistaprecio = ListaPrecioDAO.getInstancia().obtener(Olistaprecio.getIdListaPrecio());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarListaPrecio() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                Olistaprecio.setFecha(helper.getFechaValida(Olistaprecio.getFecha()));
                ListaPrecioDAO.getInstancia().editar(Olistaprecio, (Usuario) session.get("Usuario"));
                msg = "Se Edito correctamente";
            } else {
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarListaPrecio() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                ListaPrecioDAO.getInstancia().eliminar(Olistaprecio, (Usuario) session.get("Usuario"));
                msg = "Se Elimino correctamente";
            } else {
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarListaPrecio() throws Exception {
        try {
            setListaListaPrecio(ListaPrecioDAO.getInstancia().buscar(Olistaprecio));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public ListaPrecio getOlistaprecio() {
        return Olistaprecio;
    }

    public void setOlistaprecio(ListaPrecio Olistaprecio) {
        this.Olistaprecio = Olistaprecio;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<ListaPrecio> getListaListaPrecio() {
        return ListaListaPrecio;
    }

    public void setListaListaPrecio(ArrayList<ListaPrecio> ListaListaPrecio) {
        this.ListaListaPrecio = ListaListaPrecio;
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

    public ArrayList<Producto> getListaProducto() {
        return ListaProducto;
    }

    public void setListaProducto(ArrayList<Producto> ListaProducto) {
        this.ListaProducto = ListaProducto;
    }
}
