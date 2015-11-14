package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ProductoController extends ActionSupport {

    private Producto Oproducto = new Producto();
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private ArrayList<TipoProducto> ListaTipoProducto = new ArrayList<TipoProducto>();
    private ArrayList<UnidadMedida> ListaUnidadMedida = new ArrayList<UnidadMedida>();
    private ArrayList<Familia> ListaFamilia = new ArrayList<Familia>();
    private Map session;

    public String Load() {
        try {
            permiso = true;
            if (permiso) {
                TipoProducto objeto = new TipoProducto();
                Producto producto = new Producto();
                producto.setIdFamilia(0);
                producto.setDescripcion("");
                UnidadMedida unidadmedida = new UnidadMedida();
                unidadmedida.setSimbolo("");
                objeto.setDescripcion("");
                setListaTipoProducto(TipoProductoDAO.getInstancia().buscar(objeto));
                setListaUnidadMedida(UnidadMedidaDAO.getInstancia().Listar(unidadmedida));
                setListaProducto(ProductoDAO.getInstancia().buscar(producto));
                Familia fam = new Familia();
                fam.setDescripcion("");
                setListaFamilia(FamiliaDAO.getInstancia().buscar(fam));                
                return "Autorizado";
            } else {
                msg = "No cuenta con los permisos Necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            Oproducto.setUsuario(((Usuario)session.get("Usuario")).getNick());
            ProductoDAO.getInstancia().ingresar(Oproducto);
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarProducto() {
        try {
            setListaProducto(ProductoDAO.getInstancia().buscar(Oproducto));
        } catch (Exception ex) {
        }
        return SUCCESS;
    }

    public String ObtenerProducto() throws Exception {
        try {
            Oproducto = ProductoDAO.getInstancia().obtener(Oproducto.getIdProducto());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            Oproducto.setUsuario(((Usuario)session.get("Usuario")).getNick());
            ProductoDAO.getInstancia().editar(Oproducto);
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            Oproducto.setUsuario(((Usuario)session.get("Usuario")).getNick());
            ProductoDAO.getInstancia().eliminar(Oproducto);
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Producto getOproducto() {
        return Oproducto;
    }

    public void setOproducto(Producto Oproducto) {
        this.Oproducto = Oproducto;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Producto> getListaProducto() {
        return ListaProducto;
    }

    public void setListaProducto(ArrayList<Producto> ListaProducto) {
        this.ListaProducto = ListaProducto;
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

    public ArrayList<TipoProducto> getListaTipoProducto() {
        return ListaTipoProducto;
    }

    public void setListaTipoProducto(ArrayList<TipoProducto> ListaTipoProducto) {
        this.ListaTipoProducto = ListaTipoProducto;
    }

    public ArrayList<UnidadMedida> getListaUnidadMedida() {
        return ListaUnidadMedida;
    }

    public void setListaUnidadMedida(ArrayList<UnidadMedida> ListaUnidadMedida) {
        this.ListaUnidadMedida = ListaUnidadMedida;
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

    public ArrayList<Familia> getListaFamilia() {
        return ListaFamilia;
    }

    public void setListaFamilia(ArrayList<Familia> ListaFamilia) {
        this.ListaFamilia = ListaFamilia;
    }
}
