package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ConfiguracionAlmacenController extends ActionSupport {

    private ConfiguracionAlmacen Oconfiguracionalmacen = new ConfiguracionAlmacen();
    private DetalleConfiguracionAlmacen Odetalleconfiguracionalmacen = new DetalleConfiguracionAlmacen();
    private ArrayList<ConfiguracionAlmacen> ListaConfiguracionAlmacen = new ArrayList<ConfiguracionAlmacen>();
    private ArrayList<DetalleConfiguracionAlmacen> ListaDetalleConfiguracionAlmacen = new ArrayList<DetalleConfiguracionAlmacen>();
    private int index = 0;
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;
    private String Operacion = "Edicion";

    public String Load() {
        try {
            setPermiso(true);
            if (Permiso) {
                setSession(ActionContext.getContext().getSession());
                if (Operacion.equals("Nuevo")) {
                } else {

                    if (Oconfiguracionalmacen.getIdConfiguracionAlmacen() == 0) {
                        Oconfiguracionalmacen.setIdConfiguracionAlmacen(ConfiguracionAlmacenDAO.getInstancia().UltimoID());
                    }
                    Oconfiguracionalmacen = ConfiguracionAlmacenDAO.getInstancia().obtener(Oconfiguracionalmacen.getIdConfiguracionAlmacen());
                    ListaDetalleConfiguracionAlmacen = ConfiguracionAlmacenDAO.getInstancia().buscarDetalle(Oconfiguracionalmacen);
                    session.put("ListaDetalleConfiguracionAlmacen", ListaDetalleConfiguracionAlmacen);
                }


                return "Autorizado";
            } else {
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarConfiguracionAlmacen() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (session.get("ListaDetalleConfiguracionAlmacen") != null) {
                setListaDetalleConfiguracionAlmacen((ArrayList<DetalleConfiguracionAlmacen>) session.get("ListaDetalleConfiguracionAlmacen"));
            }
            
            String xml = "<root>";
            for (int i = 0; i < ListaDetalleConfiguracionAlmacen.size(); i++){
                xml = xml + ListaDetalleConfiguracionAlmacen.get(i).xml();
            }
            xml = xml + "</root>";

            if (Operacion.equals("Nuevo")) {
                int id = ConfiguracionAlmacenDAO.getInstancia().ingresar(getOconfiguracionalmacen(), ((Usuario) session.get("Usuario")), xml);
                Oconfiguracionalmacen.setIdConfiguracionAlmacen(id);
                msg = "Se registro correctamente";
            } else {
                ConfiguracionAlmacenDAO.getInstancia().editar(Oconfiguracionalmacen, ((Usuario) session.get("Usuario")), xml);
                msg = "Se edito correctamente";
            }
            
            session.remove("ListaDetalleConfiguracionAlmacen");

        } catch (Exception ex) {
            error=true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerConfiguracionAlmacen() throws Exception {
        try {
            setOconfiguracionalmacen(ConfiguracionAlmacenDAO.getInstancia().obtener(getOconfiguracionalmacen().getIdConfiguracionAlmacen()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarConfiguracionAlmacen() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarConfiguracionAlmacen() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ConfiguracionAlmacenDAO.getInstancia().eliminar(getOconfiguracionalmacen(), ((Usuario) session.get("Usuario")));
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarConfiguracionAlmacen() throws Exception {
        try {
            setListaConfiguracionAlmacen(ConfiguracionAlmacenDAO.getInstancia().buscar(getOconfiguracionalmacen()));
            msg = "Busqueda correcta";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarDetalleConfiguracionAlmacen() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (session.get("ListaDetalleConfiguracionAlmacen") != null) {
                setListaDetalleConfiguracionAlmacen((ArrayList<DetalleConfiguracionAlmacen>) session.get("ListaDetalleConfiguracionAlmacen"));
            }

            ListaDetalleConfiguracionAlmacen.add(Odetalleconfiguracionalmacen);

            session.put("ListaDetalleConfiguracionAlmacen", ListaDetalleConfiguracionAlmacen);

            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String QuitarDetalleConfiguracionAlmacen() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (session.get("ListaDetalleConfiguracionAlmacen") != null) {
                setListaDetalleConfiguracionAlmacen((ArrayList<DetalleConfiguracionAlmacen>) session.get("ListaDetalleConfiguracionAlmacen"));
            }

            ListaDetalleConfiguracionAlmacen.remove(index);

            session.put("ListaDetalleConfiguracionAlmacen", ListaDetalleConfiguracionAlmacen);

            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<ConfiguracionAlmacen> getListaConfiguracionAlmacen() {
        return ListaConfiguracionAlmacen;
    }

    public void setListaConfiguracionAlmacen(ArrayList<ConfiguracionAlmacen> ListaConfiguracionAlmacen) {
        this.ListaConfiguracionAlmacen = ListaConfiguracionAlmacen;
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
        return Permiso;
    }

    public void setPermiso(Boolean Permiso) {
        this.Permiso = Permiso;
    }

    public ConfiguracionAlmacen getOconfiguracionalmacen() {
        return Oconfiguracionalmacen;
    }

    public void setOconfiguracionalmacen(ConfiguracionAlmacen Oconfiguracionalmacen) {
        this.Oconfiguracionalmacen = Oconfiguracionalmacen;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public ArrayList<DetalleConfiguracionAlmacen> getListaDetalleConfiguracionAlmacen() {
        return ListaDetalleConfiguracionAlmacen;
    }

    public void setListaDetalleConfiguracionAlmacen(ArrayList<DetalleConfiguracionAlmacen> ListaDetalleConfiguracionAlmacen) {
        this.ListaDetalleConfiguracionAlmacen = ListaDetalleConfiguracionAlmacen;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public DetalleConfiguracionAlmacen getOdetalleconfiguracionalmacen() {
        return Odetalleconfiguracionalmacen;
    }

    public void setOdetalleconfiguracionalmacen(DetalleConfiguracionAlmacen Odetalleconfiguracionalmacen) {
        this.Odetalleconfiguracionalmacen = Odetalleconfiguracionalmacen;
    }
}
