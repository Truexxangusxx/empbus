package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ConfiguracionController extends ActionSupport {
    
    private Configuracion Oconfiguracion = new Configuracion();
    private DetalleConfiguracion Odetalleconfiguracion = new DetalleConfiguracion();
    private ArrayList<Configuracion> ListaConfiguracion = new ArrayList<Configuracion>();
    private ArrayList<DetalleConfiguracion> ListaDetalleConfiguracionCargo = new ArrayList<DetalleConfiguracion>();
    private ArrayList<DetalleConfiguracion> ListaDetalleConfiguracionAbono = new ArrayList<DetalleConfiguracion>();
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
                    
                    if (Oconfiguracion.getIdConfiguracion() == 0) {
                        Oconfiguracion.setIdConfiguracion(ConfiguracionDAO.getInstancia().UltimoID());
                    }
                    Oconfiguracion = ConfiguracionDAO.getInstancia().obtener(Oconfiguracion.getIdConfiguracion());
                    ListaDetalleConfiguracionCargo = ConfiguracionDAO.getInstancia().buscarDetalleCargo(Oconfiguracion);
                    ListaDetalleConfiguracionAbono = ConfiguracionDAO.getInstancia().buscarDetalleAbono(Oconfiguracion);
                    session.put("ListaDetalleConfiguracionCargo", ListaDetalleConfiguracionCargo);
                    session.put("ListaDetalleConfiguracionAbono", ListaDetalleConfiguracionAbono);
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
    
    public String GrabarConfiguracion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            
            if (session.get("ListaDetalleConfiguracionCargo") != null) {
                setListaDetalleConfiguracionCargo((ArrayList<DetalleConfiguracion>) session.get("ListaDetalleConfiguracionCargo"));
            }
            if (session.get("ListaDetalleConfiguracionAbono") != null) {
                setListaDetalleConfiguracionAbono((ArrayList<DetalleConfiguracion>) session.get("ListaDetalleConfiguracionAbono"));
            }
            
            String xml = "<root>";
            for (int i = 0; i < ListaDetalleConfiguracionCargo.size(); i++) {
                ListaDetalleConfiguracionCargo.get(i).setCargo(true);
                xml = xml + ListaDetalleConfiguracionCargo.get(i).xml();
            }
            for (int i = 0; i < ListaDetalleConfiguracionAbono.size(); i++) {
                ListaDetalleConfiguracionCargo.get(i).setCargo(false);
                xml = xml + ListaDetalleConfiguracionAbono.get(i).xml();
            }
            xml = xml + "</root>";
            
            if (Operacion.equals("Nuevo")) {
                int id = ConfiguracionDAO.getInstancia().ingresar(getOconfiguracion(), ((Usuario) session.get("Usuario")), xml);
                Oconfiguracion.setIdConfiguracion(id);
                msg = "Se registro correctamente";
            } else {
                ConfiguracionDAO.getInstancia().editar(Oconfiguracion, ((Usuario) session.get("Usuario")), xml);
                msg = "Se edito correctamente";
            }
            
            session.remove("ListaDetalleConfiguracion");
            
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String ObtenerConfiguracion() throws Exception {
        try {
            setOconfiguracion(ConfiguracionDAO.getInstancia().obtener(getOconfiguracion().getIdConfiguracion()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String EditarConfiguracion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String EliminarConfiguracion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ConfiguracionDAO.getInstancia().eliminar(getOconfiguracion(), ((Usuario) session.get("Usuario")));
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarConfiguracion() throws Exception {
        try {
            setListaConfiguracion(ConfiguracionDAO.getInstancia().buscar(getOconfiguracion()));
            msg = "Busqueda correcta";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String AgregarDetalleConfiguracionCargo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            
            if (session.get("ListaDetalleConfiguracionCargo") != null) {
                setListaDetalleConfiguracionCargo((ArrayList<DetalleConfiguracion>) session.get("ListaDetalleConfiguracionCargo"));
            }
            Odetalleconfiguracion.setCargo(true);
            ListaDetalleConfiguracionCargo.add(Odetalleconfiguracion);
            
            session.put("ListaDetalleConfiguracionCargo", ListaDetalleConfiguracionCargo);
            
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String AgregarDetalleConfiguracionAbono() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            
            if (session.get("ListaDetalleConfiguracionAbono") != null) {
                setListaDetalleConfiguracionAbono((ArrayList<DetalleConfiguracion>) session.get("ListaDetalleConfiguracionAbono"));
            }
            Odetalleconfiguracion.setCargo(false);
            ListaDetalleConfiguracionAbono.add(Odetalleconfiguracion);
            
            session.put("ListaDetalleConfiguracionAbono", ListaDetalleConfiguracionAbono);
            
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String QuitarDetalleConfiguracionCargo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            
            if (session.get("ListaDetalleConfiguracionCargo") != null) {
                setListaDetalleConfiguracionCargo((ArrayList<DetalleConfiguracion>) session.get("ListaDetalleConfiguracionCargo"));
            }
            
            ListaDetalleConfiguracionCargo.remove(index);
            
            session.put("ListaDetalleConfiguracionCargo", ListaDetalleConfiguracionCargo);
            
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String QuitarDetalleConfiguracionAbono() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            
            if (session.get("ListaDetalleConfiguracionAbono") != null) {
                setListaDetalleConfiguracionAbono((ArrayList<DetalleConfiguracion>) session.get("ListaDetalleConfiguracionAbono"));
            }
            
            ListaDetalleConfiguracionAbono.remove(index);
            
            session.put("ListaDetalleConfiguracionAbono", ListaDetalleConfiguracionAbono);
            
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            error = true;
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
    
    public ArrayList<Configuracion> getListaConfiguracion() {
        return ListaConfiguracion;
    }
    
    public void setListaConfiguracion(ArrayList<Configuracion> ListaConfiguracion) {
        this.ListaConfiguracion = ListaConfiguracion;
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
    
    public Configuracion getOconfiguracion() {
        return Oconfiguracion;
    }
    
    public void setOconfiguracion(Configuracion Oconfiguracion) {
        this.Oconfiguracion = Oconfiguracion;
    }
    
    public String getOperacion() {
        return Operacion;
    }
    
    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }
    
    public int getIndex() {
        return index;
    }
    
    public void setIndex(int index) {
        this.index = index;
    }
    
    public DetalleConfiguracion getOdetalleconfiguracion() {
        return Odetalleconfiguracion;
    }
    
    public void setOdetalleconfiguracion(DetalleConfiguracion Odetalleconfiguracion) {
        this.Odetalleconfiguracion = Odetalleconfiguracion;
    }
    
    public ArrayList<DetalleConfiguracion> getListaDetalleConfiguracionCargo() {
        return ListaDetalleConfiguracionCargo;
    }
    
    public void setListaDetalleConfiguracionCargo(ArrayList<DetalleConfiguracion> ListaDetalleConfiguracionCargo) {
        this.ListaDetalleConfiguracionCargo = ListaDetalleConfiguracionCargo;
    }
    
    public ArrayList<DetalleConfiguracion> getListaDetalleConfiguracionAbono() {
        return ListaDetalleConfiguracionAbono;
    }
    
    public void setListaDetalleConfiguracionAbono(ArrayList<DetalleConfiguracion> ListaDetalleConfiguracionAbono) {
        this.ListaDetalleConfiguracionAbono = ListaDetalleConfiguracionAbono;
    }
}
