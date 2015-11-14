package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;

public class GuiaController extends ActionSupport {

    private Guia Oguia = new Guia();
    private ArrayList<Guia> ListaGuia = new ArrayList<Guia>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private String Operacion = "Edicion";
    private int index = 0;
    private ArrayList<TipoMovimiento> ListaTipoMovimiento  = new ArrayList<TipoMovimiento>();
    private ArrayList<Almacen> ListaAlmacen= new ArrayList<Almacen>();
    private ArrayList<DetalleGuia> ListaDetalleGuia = new ArrayList<DetalleGuia>();
    private DetalleGuia Odetalleguia = new DetalleGuia();

    public String Load() throws Exception {
        try {
            permiso = true;
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                session.remove("ListaDetalleGuia");

                ListaTipoMovimiento = TipoMovimientoDAO.getInstancia().buscar(new TipoMovimiento());
                ListaMoneda = MonedaDAO.getInstancia().buscar(new Moneda());
                ListaAlmacen = AlmacenDAO.getInstancia().buscar(new Almacen());
                
                Periodo periodo = new Periodo();
                periodo.setActivo(false);
                periodo = PeriodoDAO.getInstancia().buscar(periodo).get(0);
                setListaMoneda(MonedaDAO.getInstancia().buscar(new Moneda()));
                Oguia.setPeriodo(periodo.getMes() + " " + periodo.getAnio());
                if (getOperacion() != "Edicion") {

                    Oguia.setPeriodo(periodo.getMes() + " " + periodo.getAnio());

                } else {

                    if (Oguia.getIdGuia() == 0) {
                        Oguia.setIdGuia(GuiaDAO.getInstancia().UltimoID());
                    }
                    Oguia = GuiaDAO.getInstancia().obtener(Oguia.getIdGuia());

                    ListaDetalleGuia = DetalleGuiaDAO.getInstancia().buscar(Oguia);
                    session.put("ListaDetalleGuia", ListaDetalleGuia);
                }
                msg = "";
                return "Autorizado";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarGuia() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                Oguia.setFecha(helper.getFechaValida(Oguia.getFecha()));
                
                
                if (session.get("ListaDetalleGuia") != null) {
                    setListaDetalleGuia((ArrayList<DetalleGuia>) session.get("ListaDetalleGuia"));
                }

                String xml = "<root>";
                
                for(int i = 0; i < ListaDetalleGuia.size(); i++)
                {xml = xml + ListaDetalleGuia.get(i).xml();}
                
                xml = xml + "</root>";


                if (Operacion.equals("Edicion")) {
                    GuiaDAO.getInstancia().editar(Oguia, (Usuario) session.get("Usuario"), xml);
                    
                    msg = "Se edito correctamente";
                } else {
                    GuiaDAO.getInstancia().ingresar(Oguia, (Usuario) session.get("Usuario"), xml);
                    msg = "Se registro correctamente";
                }
                
                
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerGuia() throws Exception {
        try {
            Oguia = GuiaDAO.getInstancia().obtener(Oguia.getIdGuia());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarGuia() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                //GuiaDAO.getInstancia().editar(Oguia, (Usuario) session.get("Usuario"));
                msg = "Se Edito correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarGuia() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                GuiaDAO.getInstancia().eliminar(Oguia, (Usuario) session.get("Usuario"));
                msg = "Se Elimino correctamente";
            } else {
                setError((Boolean) true);
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String AgregarDetalleGuia() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleGuia") != null) {
                    setListaDetalleGuia((ArrayList<DetalleGuia>) session.get("ListaDetalleGuia"));
                }

                Odetalleguia.setSubTotal(Odetalleguia.getCantidad() * Odetalleguia.getPrecio());
                ListaDetalleGuia.add(Odetalleguia);

                session.put("ListaDetalleGuia", ListaDetalleGuia);


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

    public String QuitarDetalleGuia() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleGuia") != null) {
                    setListaDetalleGuia((ArrayList<DetalleGuia>) session.get("ListaDetalleGuia"));
                }

                ListaDetalleGuia.remove(index);

                session.put("ListaDetalleGuia", ListaDetalleGuia);

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
    
    
    public Guia getOguia() {
        return Oguia;
    }

    public void setOguia(Guia Oguia) {
        this.Oguia = Oguia;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Guia> getListaGuia() {
        return ListaGuia;
    }

    public void setListaGuia(ArrayList<Guia> ListaGuia) {
        this.ListaGuia = ListaGuia;
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

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
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

    public ArrayList<TipoMovimiento> getListaTipoMovimiento() {
        return ListaTipoMovimiento;
    }

    public void setListaTipoMovimiento(ArrayList<TipoMovimiento> ListaTipoMovimiento) {
        this.ListaTipoMovimiento = ListaTipoMovimiento;
    }

    public ArrayList<Almacen> getListaAlmacen() {
        return ListaAlmacen;
    }

    public void setListaAlmacen(ArrayList<Almacen> ListaAlmacen) {
        this.ListaAlmacen = ListaAlmacen;
    }

    
    public ArrayList<DetalleGuia> getListaDetalleGuia() {
        return ListaDetalleGuia;
    }

    
    public void setListaDetalleGuia(ArrayList<DetalleGuia> ListaDetalleGuia) {
        this.ListaDetalleGuia = ListaDetalleGuia;
    }

    public DetalleGuia getOdetalleguia() {
        return Odetalleguia;
    }

    public void setOdetalleguia(DetalleGuia Odetalleguia) {
        this.Odetalleguia = Odetalleguia;
    }
}
