package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class PermisoController extends ActionSupport {

    private Usuario Ousuario = new Usuario();
    private ArrayList<Usuario> ListaUsuario = new ArrayList<Usuario>();
    private Modulo Omodulo = new Modulo();
    private ArrayList<Modulo> ListaModulo = new ArrayList<Modulo>();
    private Opcion Oopcion = new Opcion();
    private ArrayList<Opcion> ListaOpcion = new ArrayList<Opcion>();
    private Permiso Opermiso = new Permiso();
    private ArrayList<Permiso> ListaPermiso = new ArrayList<Permiso>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;
    private String url = "";
    private int indice = 0;

    public String Confirmar() {
        try {
            Permiso = true;
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String Load() {
        try {
            session = ActionContext.getContext().getSession();
            session.remove("ListaPermiso");
            
            Permiso = true;
            if (Permiso) {
                Ousuario.setIdUsuario(0);
                getOusuario().setNick("");
                setListaUsuario(UsuarioDAO.getInstancia().BuscarUsuario(getOusuario()));
                ListaUsuario.add(0, Ousuario);
                Omodulo.setDescripcion("");
                setListaModulo(ModuloDAO.getInstancia().BuscarModulo(Omodulo));
                setListaOpcion(OpcionDAO.getInstancia().BuscarOpcionPorModulo(ListaModulo.get(0)));
                return "Autorizado";
            } else {
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String AgregarPermiso() {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaPermiso") != null) {
                setListaPermiso((ArrayList<Permiso>) session.get("ListaPermiso"));
            }

            Opermiso.setDModulo(Opermiso.getDModulo());
            Opermiso.setDOpcion(Opermiso.getDOpcion());
            Opermiso.setDUsuario(Opermiso.getDUsuario());
            Opermiso.setIdModulo(Opermiso.getIdModulo());
            Opermiso.setIdOpcion(Opermiso.getIdOpcion());
            Opermiso.setIdUsuario(Opermiso.getIdUsuario());
            ListaPermiso.add(Opermiso);

            session.put("ListaPermiso", ListaPermiso);
        } catch (Exception ex) {
        }
        return SUCCESS;
    }

    public String RemoverPermiso() {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaPermiso") != null) {
                setListaPermiso((ArrayList<Permiso>) session.get("ListaPermiso"));
            }

            ListaPermiso.remove(indice);

            session.put("ListaPermiso", ListaPermiso);
        } catch (Exception ex) {
        }
        return SUCCESS;
    }

    public String GrabarPermiso() {
        try {
            session = ActionContext.getContext().getSession();
            Usuario usuario = new Usuario();
            if (session.get("ListaPermiso") != null) {
                setListaPermiso((ArrayList<Permiso>) session.get("ListaPermiso"));
                usuario = (Usuario)session.get("Usuario");
            }

            String xml = "<root>";
            for (int i = 0; i < ListaPermiso.size(); i++) {
                xml = xml + ListaPermiso.get(i).xml(usuario);
            }
            xml = xml + "</root>";
            PermisoDAO.getInstancia().ingresar(xml);
            msg = "Registrado correctamente";
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarPermiso() throws Exception{
        session = ActionContext.getContext().getSession();
        setListaPermiso(PermisoDAO.getInstancia().BuscarPermiso(Ousuario));
        session.put("ListaPermiso", ListaPermiso);
    return SUCCESS;
    }
    
    

    public Modulo getOmodulo() {
        return Omodulo;
    }

    public void setOmodulo(Modulo Omodulo) {
        this.Omodulo = Omodulo;
    }

    public ArrayList<Modulo> getListaModulo() {
        return ListaModulo;
    }

    public void setListaModulo(ArrayList<Modulo> ListaModulo) {
        this.ListaModulo = ListaModulo;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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

    public Opcion getOopcion() {
        return Oopcion;
    }

    public void setOopcion(Opcion Oopcion) {
        this.Oopcion = Oopcion;
    }

    public ArrayList<Opcion> getListaOpcion() {
        return ListaOpcion;
    }

    public void setListaOpcion(ArrayList<Opcion> ListaOpcion) {
        this.ListaOpcion = ListaOpcion;
    }

    public Permiso getOpermiso() {
        return Opermiso;
    }

    public void setOpermiso(Permiso Opermiso) {
        this.Opermiso = Opermiso;
    }

    public ArrayList<Permiso> getListaPermiso() {
        return ListaPermiso;
    }

    public void setListaPermiso(ArrayList<Permiso> ListaPermiso) {
        this.ListaPermiso = ListaPermiso;
    }

    public Boolean getPermiso() {
        return Permiso;
    }

    public void setPermiso(Boolean Permiso) {
        this.Permiso = Permiso;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Usuario getOusuario() {
        return Ousuario;
    }

    public void setOusuario(Usuario Ousuario) {
        this.Ousuario = Ousuario;
    }

    public ArrayList<Usuario> getListaUsuario() {
        return ListaUsuario;
    }

    public void setListaUsuario(ArrayList<Usuario> ListaUsuario) {
        this.ListaUsuario = ListaUsuario;
    }

    public int getIndice() {
        return indice;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }
}
