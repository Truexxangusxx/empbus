package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;

public class FacturaController extends ActionSupport {

    private Factura Ofactura = new Factura();
    private ArrayList<Factura> ListaFactura = new ArrayList<Factura>();
    private ArrayList<TipoVenta> ListaTipoVenta = new ArrayList<TipoVenta>();
    private ArrayList<PuntoVenta> ListaPuntoVenta = new ArrayList<PuntoVenta>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;
    private ArrayList<TipoDocumento> ListaTipoDocumento = new ArrayList<TipoDocumento>();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<FormaPago> ListaFormaPago = new ArrayList<FormaPago>();
    private ArrayList<Percepcion> ListaPercepcion = new ArrayList<Percepcion>();
    private ArrayList<Servicio> ListaServicio = new ArrayList<Servicio>();
    private String Operacion = "Edicion";
    private ArrayList<DetalleFactura> ListaDetalleFactura = new ArrayList<DetalleFactura>();
    private DetalleFactura Odetallefactura = new DetalleFactura();
    private int index = 0;

    public String Load() throws Exception {

        try {
            permiso = true;
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                session.remove("ListaDetalleFactura");

                Periodo periodo = new Periodo();
                periodo.setActivo(false);
                periodo = PeriodoDAO.getInstancia().buscar(periodo).get(0);
                ListaTipoVenta = TipoVentaDAO.getInstancia().buscar(new TipoVenta());
                ListaPuntoVenta = PuntoVentaDAO.getInstancia().buscar(new PuntoVenta());
                ListaTipoDocumento = TipoDocumentoDAO.getInstancia().buscar(new TipoDocumento());
                ListaMoneda = MonedaDAO.getInstancia().buscar(new Moneda());
                ListaFormaPago = FormaPagoDAO.getInstancia().buscar(new FormaPago());
                ListaPercepcion = PercepcionDAO.getInstancia().buscar(new Percepcion());
                ListaServicio = ServicioDAO.getInstancia().buscar(new Servicio());

                if (getOperacion() != "Edicion") {

                    Ofactura.setIgv(IGVDAO.getInstancia().obtener().getValor());
                    Ofactura.setPeriodo(periodo.getMes() + " " + periodo.getAnio());

                } else {

                    if (Ofactura.getIdFactura() == 0) {
                        Ofactura.setIdFactura(FacturaDAO.getInstancia().UltimoID());
                    }
                    Ofactura = FacturaDAO.getInstancia().obtener(Ofactura.getIdFactura());
                    
                    ListaDetalleFactura = DetalleFacturaDAO.getInstancia().buscar(Ofactura);
                    session.put("ListaDetalleFactura", ListaDetalleFactura);
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

    public String GrabarFactura() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                Ofactura.setFecha(helper.getFechaValida(Ofactura.getFecha()));
                Ofactura.setFechaVencimiento(helper.getFechaValida(Ofactura.getFechaVencimiento()));

                if (session.get("ListaDetalleFactura") != null) {
                    setListaDetalleFactura((ArrayList<DetalleFactura>) session.get("ListaDetalleFactura"));
                }

                String xml = "<root>";
                
                for(int i = 0; i < ListaDetalleFactura.size(); i++)
                {xml = xml + ListaDetalleFactura.get(i).xml();}
                
                xml = xml + "</root>";


                if (Operacion.equals("Edicion")) {
                    FacturaDAO.getInstancia().editar(Ofactura, (Usuario) session.get("Usuario"), xml);
                    
                    msg = "Se edito correctamente";
                } else {
                    FacturaDAO.getInstancia().ingresar(Ofactura, (Usuario) session.get("Usuario"), xml);
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

    public String ObtenerFactura() throws Exception {
        try {
            Ofactura = FacturaDAO.getInstancia().obtener(Ofactura.getIdFactura());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarFactura() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());


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

    public String EliminarFactura() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                FacturaDAO.getInstancia().eliminar(Ofactura, (Usuario) session.get("Usuario"));
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

    public String BuscarFactura() throws Exception {
        try {
            ListaFactura = FacturaDAO.getInstancia().buscar(Ofactura);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarDetalleFactura() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleFactura") != null) {
                    setListaDetalleFactura((ArrayList<DetalleFactura>) session.get("ListaDetalleFactura"));
                }

                Odetallefactura.setSubTotal(Odetallefactura.getCantidad() * Odetallefactura.getPrecio());
                ListaDetalleFactura.add(Odetallefactura);

                session.put("ListaDetalleFactura", ListaDetalleFactura);


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

    public String QuitarDetalleFactura() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleFactura") != null) {
                    setListaDetalleFactura((ArrayList<DetalleFactura>) session.get("ListaDetalleFactura"));
                }

                ListaDetalleFactura.remove(index);

                session.put("ListaDetalleFactura", ListaDetalleFactura);

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

    public Factura getOfactura() {
        return Ofactura;
    }

    public void setOfactura(Factura Ofactura) {
        this.Ofactura = Ofactura;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Factura> getListaFactura() {
        return ListaFactura;
    }

    public void setListaFactura(ArrayList<Factura> ListaFactura) {
        this.ListaFactura = ListaFactura;
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

    public ArrayList<TipoVenta> getListaTipoVenta() {
        return ListaTipoVenta;
    }

    public void setListaTipoVenta(ArrayList<TipoVenta> ListaTipoVenta) {
        this.ListaTipoVenta = ListaTipoVenta;
    }

    public ArrayList<PuntoVenta> getListaPuntoVenta() {
        return ListaPuntoVenta;
    }

    public void setListaPuntoVenta(ArrayList<PuntoVenta> ListaPuntoVenta) {
        this.ListaPuntoVenta = ListaPuntoVenta;
    }

    public ArrayList<TipoDocumento> getListaTipoDocumento() {
        return ListaTipoDocumento;
    }

    public void setListaTipoDocumento(ArrayList<TipoDocumento> ListaTipoDocumento) {
        this.ListaTipoDocumento = ListaTipoDocumento;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
    }

    public ArrayList<FormaPago> getListaFormaPago() {
        return ListaFormaPago;
    }

    public void setListaFormaPago(ArrayList<FormaPago> ListaFormaPago) {
        this.ListaFormaPago = ListaFormaPago;
    }

    public ArrayList<Percepcion> getListaPercepcion() {
        return ListaPercepcion;
    }

    public void setListaPercepcion(ArrayList<Percepcion> ListaPercepcion) {
        this.ListaPercepcion = ListaPercepcion;
    }

    public ArrayList<Servicio> getListaServicio() {
        return ListaServicio;
    }

    public void setListaServicio(ArrayList<Servicio> ListaServicio) {
        this.ListaServicio = ListaServicio;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public ArrayList<DetalleFactura> getListaDetalleFactura() {
        return ListaDetalleFactura;
    }

    public void setListaDetalleFactura(ArrayList<DetalleFactura> ListaDetalleFactura) {
        this.ListaDetalleFactura = ListaDetalleFactura;
    }

    public DetalleFactura getOdetallefactura() {
        return Odetallefactura;
    }

    public void setOdetallefactura(DetalleFactura Odetallefactura) {
        this.Odetallefactura = Odetallefactura;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
