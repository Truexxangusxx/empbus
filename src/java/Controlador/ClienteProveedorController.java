package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ClienteProveedorController extends ActionSupport {

    private ClienteProveedor Oclienteproveedor = new ClienteProveedor();
    private ArrayList<ClienteProveedor> ListaClienteProveedor = new ArrayList<ClienteProveedor>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;


    public String Load() throws Exception {
        try {
            permiso = true;
            if(permiso){
                Oclienteproveedor.setRazonSocial("");
                Oclienteproveedor.setRuc("");
                setListaClienteProveedor(ClienteProveedorDAO.getInstancia().buscar(Oclienteproveedor));
            return "Autorizado";
            }
            else{return "NoAutorizado";}
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }
    
    public String GrabarClienteProveedor() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ClienteProveedorDAO.getInstancia().ingresar(Oclienteproveedor,((Usuario)session.get("Usuario")).getNick());
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerClienteProveedor() throws Exception {
        try {
            Oclienteproveedor = ClienteProveedorDAO.getInstancia().obtener(Oclienteproveedor.getIdClienteProveedor());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarClienteProveedor() throws Exception {
        try {
            session = ActionContext.getContext().getSession();            
            ClienteProveedorDAO.getInstancia().editar(Oclienteproveedor,((Usuario)session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarClienteProveedor() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ClienteProveedorDAO.getInstancia().eliminar(Oclienteproveedor,((Usuario)session.get("Usuario")).getNick());
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarClienteProveedor() throws Exception {
        try {
            setListaClienteProveedor(ClienteProveedorDAO.getInstancia().buscar(Oclienteproveedor));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public ClienteProveedor getOclienteproveedor() {
        return Oclienteproveedor;
    }

    public void setOclienteproveedor(ClienteProveedor Oclienteproveedor) {
        this.Oclienteproveedor = Oclienteproveedor;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<ClienteProveedor> getListaClienteProveedor() {
        return ListaClienteProveedor;
    }

    public void setListaClienteProveedor(ArrayList<ClienteProveedor> ListaClienteProveedor) {
        this.ListaClienteProveedor = ListaClienteProveedor;
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
