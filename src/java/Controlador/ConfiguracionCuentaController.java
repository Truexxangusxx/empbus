package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ConfiguracionCuentaController extends ActionSupport {

    private ConfiguracionCuenta Oconfiguracioncuenta = new ConfiguracionCuenta();
    private ArrayList<ConfiguracionCuenta> ListaConfiguracionCuenta = new ArrayList<ConfiguracionCuenta>();
    private ArrayList<TipoConfiguracionCuenta> ListaTipoConfiguracionCuenta = new ArrayList<TipoConfiguracionCuenta>();
    private ArrayList<Clase> ListaClase = new ArrayList<Clase>();
    private ArrayList<Naturaleza> ListaNaturaleza = new ArrayList<Naturaleza>();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<TipoAuxiliar> ListaTipoAuxiliar = new ArrayList<TipoAuxiliar>();
    private ArrayList<Ajuste> ListaAjuste = new ArrayList<Ajuste>();
    private ArrayList<TipoCambioCuenta> ListaTipoCambioCuenta = new ArrayList<TipoCambioCuenta>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;
    private String Operacion = "Edicion";

    public String Load() {
        try {
            setPermiso(true);
            if (Permiso) {
                getOconfiguracioncuenta().setDescripcion("");
                ListaTipoConfiguracionCuenta = TipoConfiguracionCuentaDAO.getInstancia().buscar(new TipoConfiguracionCuenta());
                ListaClase = ClaseDAO.getInstancia().buscar(new Clase());
                ListaNaturaleza = NaturalezaDAO.getInstancia().buscar(new Naturaleza());
                ListaMoneda = MonedaDAO.getInstancia().buscar(new Moneda());
                ListaTipoAuxiliar = TipoAuxiliarDAO.getInstancia().buscar(new TipoAuxiliar());
                ListaAjuste = AjusteDAO.getInstancia().buscar(new Ajuste());
                ListaTipoCambioCuenta = TipoCambioCuentaDAO.getInstancia().buscar(new TipoCambioCuenta());

                if (Operacion.equals("Nuevo")) {
                } else {

                    if (Oconfiguracioncuenta.getIdConfiguracionCuenta() == 0) {
                        Oconfiguracioncuenta.setIdConfiguracionCuenta(ConfiguracionCuentaDAO.getInstancia().UltimoID());
                    }
                    Oconfiguracioncuenta = ConfiguracionCuentaDAO.getInstancia().obtener(Oconfiguracioncuenta.getIdConfiguracionCuenta());
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

    public String GrabarConfiguracionCuenta() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (Operacion.equals("Nuevo")) {
                int id = ConfiguracionCuentaDAO.getInstancia().ingresar(getOconfiguracioncuenta(), ((Usuario) session.get("Usuario")));
                Oconfiguracioncuenta.setIdConfiguracionCuenta(id);
                msg = "Se registro correctamente";
            } else {
                ConfiguracionCuentaDAO.getInstancia().editar(Oconfiguracioncuenta, ((Usuario) session.get("Usuario")));
                msg = "Se edito correctamente";
            }

            
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerConfiguracionCuenta() throws Exception {
        try {
            setOconfiguracioncuenta(ConfiguracionCuentaDAO.getInstancia().obtener(getOconfiguracioncuenta().getIdConfiguracionCuenta()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarConfiguracionCuenta() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ConfiguracionCuentaDAO.getInstancia().editar(getOconfiguracioncuenta(), ((Usuario) session.get("Usuario")));
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarConfiguracionCuenta() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            ConfiguracionCuentaDAO.getInstancia().eliminar(getOconfiguracioncuenta(), ((Usuario) session.get("Usuario")));
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarConfiguracionCuenta() throws Exception {
        try {
            setListaConfiguracionCuenta(ConfiguracionCuentaDAO.getInstancia().buscar(getOconfiguracioncuenta()));
            msg = "Busqueda correcta";
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

    public ArrayList<ConfiguracionCuenta> getListaConfiguracionCuenta() {
        return ListaConfiguracionCuenta;
    }

    public void setListaConfiguracionCuenta(ArrayList<ConfiguracionCuenta> ListaConfiguracionCuenta) {
        this.ListaConfiguracionCuenta = ListaConfiguracionCuenta;
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

    public ConfiguracionCuenta getOconfiguracioncuenta() {
        return Oconfiguracioncuenta;
    }

    public void setOconfiguracioncuenta(ConfiguracionCuenta Oconfiguracioncuenta) {
        this.Oconfiguracioncuenta = Oconfiguracioncuenta;
    }

    public ArrayList<TipoConfiguracionCuenta> getListaTipoConfiguracionCuenta() {
        return ListaTipoConfiguracionCuenta;
    }

    public void setListaTipoConfiguracionCuenta(ArrayList<TipoConfiguracionCuenta> ListaTipoConfiguracionCuenta) {
        this.ListaTipoConfiguracionCuenta = ListaTipoConfiguracionCuenta;
    }

    public ArrayList<Clase> getListaClase() {
        return ListaClase;
    }

    public void setListaClase(ArrayList<Clase> ListaClase) {
        this.ListaClase = ListaClase;
    }

    public ArrayList<Naturaleza> getListaNaturaleza() {
        return ListaNaturaleza;
    }

    public void setListaNaturaleza(ArrayList<Naturaleza> ListaNaturaleza) {
        this.ListaNaturaleza = ListaNaturaleza;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
    }

    public ArrayList<TipoAuxiliar> getListaTipoAuxiliar() {
        return ListaTipoAuxiliar;
    }

    public void setListaTipoAuxiliar(ArrayList<TipoAuxiliar> ListaTipoAuxiliar) {
        this.ListaTipoAuxiliar = ListaTipoAuxiliar;
    }

    public ArrayList<Ajuste> getListaAjuste() {
        return ListaAjuste;
    }

    public void setListaAjuste(ArrayList<Ajuste> ListaAjuste) {
        this.ListaAjuste = ListaAjuste;
    }

    public ArrayList<TipoCambioCuenta> getListaTipoCambioCuenta() {
        return ListaTipoCambioCuenta;
    }

    public void setListaTipoCambioCuenta(ArrayList<TipoCambioCuenta> ListaTipoCambioCuenta) {
        this.ListaTipoCambioCuenta = ListaTipoCambioCuenta;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }
}
