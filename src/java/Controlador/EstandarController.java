package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class EstandarController extends ActionSupport {

    private Estandar Oestandar = new Estandar();
    private ArrayList<Estandar> ListaEstandar = new ArrayList<Estandar>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private String Operacion = "Edicion";
    private int index;

    public String Load() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {

                return "Autorizado";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarEstandar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                if (session.get("ListaEstandar") != null) {
                    setListaEstandar((ArrayList<Estandar>) session.get("ListaEstandar"));
                }

                String xml = "<root>";
                for (int i = 0; i < ListaEstandar.size(); i++) {
                    xml = xml + ListaEstandar.get(i).xml();
                }
                xml = xml + "</root>";

                EstandarDAO.getInstancia().ingresar(xml, (Usuario) session.get("Usuario"));
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

    public String ObtenerEstandar() throws Exception {
        try {
            setListaEstandar(EstandarDAO.getInstancia().obtener(Oestandar.getIdEstandar()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarEstandar() throws Exception {
        try {
            EstandarDAO.getInstancia().editar(Oestandar);
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarEstandar() throws Exception {
        try {
            EstandarDAO.getInstancia().eliminar(Oestandar);
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarEstandar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaEstandar") != null) {
                setListaEstandar((ArrayList<Estandar>) session.get("ListaEstandar"));
            }
            ListaEstandar.add(Oestandar);
            session.put("ListaEstandar", ListaEstandar);
            setListaEstandar(ListaEstandar);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarEstandar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaEstandar") != null) {
                setListaEstandar((ArrayList<Estandar>) session.get("ListaEstandar"));
            }
            ListaEstandar.remove(index);
            session.put("ListaEstandar", ListaEstandar);
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarEstandar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            setListaEstandar(EstandarDAO.getInstancia().buscar(Oestandar.getIdProductoPrincipal()));
            session.put("ListaEstandar", ListaEstandar);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Estandar getOestandar() {
        return Oestandar;
    }

    public void setOestandar(Estandar Oestandar) {
        this.Oestandar = Oestandar;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Estandar> getListaEstandar() {
        return ListaEstandar;
    }

    public void setListaEstandar(ArrayList<Estandar> ListaEstandar) {
        this.ListaEstandar = ListaEstandar;
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
}
