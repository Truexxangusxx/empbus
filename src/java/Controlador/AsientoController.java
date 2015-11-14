package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;


public class AsientoController extends ActionSupport {
    
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;
    private String Operacion = "Edicion";
    private int index = 0;
    
    private ArrayList<Asiento> ListaAsiento = new ArrayList<Asiento>();
    private ArrayList<DetalleAsiento> ListaDetalleAsiento = new ArrayList<DetalleAsiento>();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private ArrayList<Subdiario> ListaSubdiario = new ArrayList<Subdiario>();
    private Asiento Oasiento = new Asiento();
    private DetalleAsiento Odetalleasiento = new DetalleAsiento();
    
    public String Load() throws Exception {

        try {
            session = ActionContext.getContext().getSession();
            setPermiso((Boolean) true);
            if (getPermiso()) {

                Periodo periodo = new Periodo();
                periodo.setActivo(false);
                periodo = PeriodoDAO.getInstancia().buscar(periodo).get(0);
                ListaMoneda = MonedaDAO.getInstancia().buscar(new Moneda());
                ListaSucursal = SucursalDAO.getInstancia().buscar(new Sucursal());
                ListaSubdiario = SubdiarioDAO.getInstancia().buscar(new Subdiario());
            
                if (!Operacion.equals("Edicion")) {

                    Oasiento.setPeriodo(periodo.getMes() + " " + periodo.getAnio());
                    int monedalocal = MonedaDAO.getInstancia().obtenerLocal().getIdMoneda();
                    double tipocambio = TipoCambioDAO.getInstancia().obtenervalor(monedalocal, ListaMoneda.get(0).getIdMoneda());
                    Oasiento.setTipoCambio(tipocambio);

                } else {

                    if (Oasiento.getIdAsiento() == 0) {
                        Oasiento.setIdAsiento(AsientoDAO.getInstancia().UltimoID());
                    }
                    Oasiento = AsientoDAO.getInstancia().obtener(Oasiento.getIdAsiento());
                    
                    ListaDetalleAsiento = AsientoDAO.getInstancia().buscarDetalle(Oasiento);
                    session.put("ListaDetalleAsiento", ListaDetalleAsiento);
                }
            
                return "Autorizado";
            } else {
                setError((Boolean) true);
                setMsg("No cuenta con los permisos necesarios");
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            setError((Boolean) true);
            setMsg(ex.getMessage());
            return "NoAutorizado";
        }
    }
    
    public String GrabarAsiento() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

                if (session.get("ListaDetalleAsiento") != null) {
                    setListaDetalleAsiento((ArrayList<DetalleAsiento>) session.get("ListaDetalleAsiento"));
                }

                String xml = "<root>";
                for (int i = 0; i < ListaDetalleAsiento.size(); i++) {
                    xml = xml + ListaDetalleAsiento.get(i).xml();
                }
                xml = xml + "</root>";

                Oasiento.setFecha(helper.getFechaValida(Oasiento.getFecha()));
                if (Operacion.equals("Edicion")) {
                    AsientoDAO.getInstancia().editar(Oasiento, ((Usuario) session.get("Usuario")), xml);
                    msg = "Se edito correctamente";
                } else {
                    Oasiento.setIdAsiento(AsientoDAO.getInstancia().ingresar(Oasiento, ((Usuario) session.get("Usuario")), xml));
                    msg = "Se registro correctamente";
                }

                error = false;
                session.remove("ListaDetalleAsiento");
                setListaDetalleAsiento(new ArrayList<DetalleAsiento>());
                
            } else {
                msg = "No cuenta con los permisos necesarios";
            }

        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarAsiento() throws Exception {
        try {
            setListaAsiento(AsientoDAO.getInstancia().buscar(Oasiento));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String AgregarDetalleAsiento() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleAsiento") != null) {
                    setListaDetalleAsiento((ArrayList<DetalleAsiento>) session.get("ListaDetalleAsiento"));
                }

                ListaDetalleAsiento.add(getOdetalleasiento());

                session.put("ListaDetalleAsiento", ListaDetalleAsiento);

                msg = "";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarDetalleAsiento() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleAsiento") != null) {
                    setListaDetalleAsiento((ArrayList<DetalleAsiento>) session.get("ListaDetalleAsiento"));
                }

                ListaDetalleAsiento.remove(index);

                session.put("ListaDetalleAsiento", ListaDetalleAsiento);

                msg = "";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
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

    public Boolean getPermiso() {
        return permiso;
    }

    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
    }

    public ArrayList<DetalleAsiento> getListaDetalleAsiento() {
        return ListaDetalleAsiento;
    }

    public void setListaDetalleAsiento(ArrayList<DetalleAsiento> ListaDetalleAsiento) {
        this.ListaDetalleAsiento = ListaDetalleAsiento;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
    }

    public ArrayList<Sucursal> getListaSucursal() {
        return ListaSucursal;
    }

    public void setListaSucursal(ArrayList<Sucursal> ListaSucursal) {
        this.ListaSucursal = ListaSucursal;
    }

    public ArrayList<Subdiario> getListaSubdiario() {
        return ListaSubdiario;
    }

    public void setListaSubdiario(ArrayList<Subdiario> ListaSubdiario) {
        this.ListaSubdiario = ListaSubdiario;
    }

    public Asiento getOasiento() {
        return Oasiento;
    }

    public void setOasiento(Asiento Oasiento) {
        this.Oasiento = Oasiento;
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

    public ArrayList<Asiento> getListaAsiento() {
        return ListaAsiento;
    }

    public void setListaAsiento(ArrayList<Asiento> ListaAsiento) {
        this.ListaAsiento = ListaAsiento;
    }

    public DetalleAsiento getOdetalleasiento() {
        return Odetalleasiento;
    }

    public void setOdetalleasiento(DetalleAsiento Odetalleasiento) {
        this.Odetalleasiento = Odetalleasiento;
    }
    
    
}
