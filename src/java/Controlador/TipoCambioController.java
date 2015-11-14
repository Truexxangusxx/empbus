package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class TipoCambioController extends ActionSupport {

    private TipoCambio Otipocambio = new TipoCambio();
    private ArrayList<TipoCambio> ListaTipoCambio = new ArrayList<TipoCambio>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private Double valor;
    private String Fecha = "";
    private ArrayList<Moneda> ListaMonedaPago = new ArrayList<Moneda>();
    private ArrayList<Moneda> ListaMonedaCobra = new ArrayList<Moneda>();
    
    
    public String Load() throws Exception {

        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                ListaMonedaCobra = MonedaDAO.getInstancia().buscar(new Moneda());
                ListaMonedaPago = MonedaDAO.getInstancia().buscar(new Moneda());
            
                return "Autorizado";
            } else {
                setError((Boolean) true);
                setMsg("No cuenta con los permisos necesarios");
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            setMsg(ex.getMessage());
            return "NoAutorizado";
        }
    }

    public String ObtenerTipoCambio() throws Exception {
        try {
            if (Otipocambio.getIdMonedaCobra() == 0) {
                Otipocambio.setIdMonedaCobra(MonedaDAO.getInstancia().buscar(new Moneda(0,"Dolar")).get(0).getIdMoneda());
            }
            if (Otipocambio.getIdMonedaPago() == 0) {
                Otipocambio.setIdMonedaPago(MonedaDAO.getInstancia().obtenerLocal().getIdMoneda());
                setOtipocambio(TipoCambioDAO.getInstancia().obtener(Otipocambio));
            } else {
                setOtipocambio(TipoCambioDAO.getInstancia().obtener(Otipocambio));
            }
            valor = Otipocambio.getValor();
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }

    public String OtenerTipoCambioPorFecha() throws Exception {
        try {
            if (Otipocambio.getIdMonedaPago() == 0) {
                Otipocambio.setIdMonedaPago(MonedaDAO.getInstancia().obtenerLocal().getIdMoneda());
            }
            if (Otipocambio.getIdMonedaCobra() == 0) {
                Otipocambio.setIdMonedaCobra(MonedaDAO.getInstancia().buscar(new Moneda(0,"Dolar")).get(0).getIdMoneda());
            }
            Otipocambio = TipoCambioDAO.getInstancia().obtenerTipoCambioPorFecha(helper.getFechaValida(Otipocambio.getFecha()), Otipocambio.getIdMonedaPago(), Otipocambio.getIdMonedaCobra());
            valor = Otipocambio.getValor();
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }
    
    public String BuscarTipoCambio() throws Exception {
        try {
            if (!Otipocambio.getFecha().equals("")){Otipocambio.setFecha(helper.getFechaValida(Otipocambio.getFecha()));}
            ListaTipoCambio = TipoCambioDAO.getInstancia().buscar(Otipocambio);
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }
    
    public String GrabarTipoCambio() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            Otipocambio.setFecha(helper.getFechaValida(Otipocambio.getFecha()));
            
            TipoCambioDAO.getInstancia().ingresar(Otipocambio, ((Usuario)session.get("Usuario")));
            
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String EliminarTipoCambio() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TipoCambioDAO.getInstancia().eliminar(Otipocambio, ((Usuario)session.get("Usuario")));
            msg = "Registro eliminado";
        } catch (Exception ex) {
            
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String EditarTipoCambio() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            Otipocambio.setFecha(helper.getFechaValida(Otipocambio.getFecha()));
            TipoCambioDAO.getInstancia().editar(Otipocambio, ((Usuario)session.get("Usuario")));
            msg = "Se edito el registro";
        } catch (Exception ex) {
            
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    
    public TipoCambio getOtipocambio() {
        return Otipocambio;
    }

    public void setOtipocambio(TipoCambio Otipocambio) {
        this.Otipocambio = Otipocambio;
    }

    public ArrayList<TipoCambio> getListaTipoCambio() {
        return ListaTipoCambio;
    }

    public void setListaTipoCambio(ArrayList<TipoCambio> ListaTipoCambio) {
        this.ListaTipoCambio = ListaTipoCambio;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public ArrayList<Moneda> getListaMonedaPago() {
        return ListaMonedaPago;
    }

    public void setListaMonedaPago(ArrayList<Moneda> ListaMonedaPago) {
        this.ListaMonedaPago = ListaMonedaPago;
    }

    public ArrayList<Moneda> getListaMonedaCobra() {
        return ListaMonedaCobra;
    }

    public void setListaMonedaCobra(ArrayList<Moneda> ListaMonedaCobra) {
        this.ListaMonedaCobra = ListaMonedaCobra;
    }
}
