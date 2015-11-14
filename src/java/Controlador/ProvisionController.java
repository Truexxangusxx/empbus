package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class ProvisionController extends ActionSupport {

    private Provision Oprovision = new Provision();
    private ArrayList<Provision> ListaProvision = new ArrayList<Provision>();
    private String msg = "";
    private Boolean error = false;
    private Map session;
    private Boolean permiso = false;
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private ArrayList<TipoCompra> ListaTipoCompra = new ArrayList<TipoCompra>();
    private ArrayList<String> ListaTipoDocumento = new ArrayList<String>();
    private ArrayList<FormaPago> ListaFormaPago = new ArrayList<FormaPago>();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<TipoAdquisicion> ListaTipoAdquisicion = new ArrayList<TipoAdquisicion>();
    private ArrayList<Percepcion> ListaPercepcion = new ArrayList<Percepcion>();
    private ArrayList<Renta> ListaRenta = new ArrayList<Renta>();
    private ArrayList<Aporte> ListaAporte = new ArrayList<Aporte>();
    private ArrayList<Tasa> ListaTasa = new ArrayList<Tasa>();
    private String Operacion = "Edicion";
    private ArrayList<Cuenta> ListaCuenta = new ArrayList<Cuenta>();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private DetalleProvision OdetalleProvision = new DetalleProvision();
    private ArrayList<DetalleProvision> ListaDetalleProvision = new ArrayList<DetalleProvision>();
    private int index = 0;
    private Ingreso Oingreso = new Ingreso();
    private OrdenCompra OordenCompra = new OrdenCompra();

    public String Load() throws Exception {
        try {
            permiso = true;
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                session.remove("ListaDetalleProvision");

                Periodo periodo = new Periodo();
                periodo.setActivo(false);
                periodo = PeriodoDAO.getInstancia().buscar(periodo).get(0);
                Sucursal sucursal = new Sucursal();
                sucursal.setIdSucursal(0);
                sucursal.setDescripcion("");
                ListaSucursal = SucursalDAO.getInstancia().buscar(sucursal);
                TipoCompra tipocompra = new TipoCompra();
                tipocompra.setIdTipoCompra(0);
                tipocompra.setDescripcion("");
                ListaTipoCompra = TipoCompraDAO.getInstancia().buscar(tipocompra);
                ListaTipoDocumento.add("01");
                ListaTipoDocumento.add("02");
                ListaTipoDocumento.add("03");
                ListaTipoDocumento.add("04");
                ListaTipoDocumento.add("05");
                FormaPago formapago = new FormaPago();
                formapago.setDescripcion("");
                setListaFormaPago(FormaPagoDAO.getInstancia().buscar(formapago));
                ListaMoneda = MonedaDAO.getInstancia().buscar(new Moneda());
                ListaTipoAdquisicion = TipoAdquisicionDAO.getInstancia().buscar(new TipoAdquisicion());
                ListaPercepcion = PercepcionDAO.getInstancia().buscar(new Percepcion());
                ListaRenta = RentaDAO.getInstancia().buscar(new Renta());
                ListaAporte = AporteDAO.getInstancia().buscar(new Aporte());
                ListaTasa = TasaDAO.getInstancia().buscar(new Tasa());
                ListaCuenta = CuentaDAO.getInstancia().buscar(new Cuenta());
                ListaCentroCosto = CentroCostoDAO.getInstancia().buscar(new CentroCosto());

                if (Operacion != "Edicion") {

                    Oprovision.setIgv(IGVDAO.getInstancia().obtener().getValor());
                    Oprovision.setPeriodo(periodo.getMes() + " " + periodo.getAnio());

                } else {
                    if (Oprovision.getIdProvision() == 0) {
                        Oprovision.setIdProvision(ProvisionDAO.getInstancia().ultimoID());
                    }
                    Oprovision = ProvisionDAO.getInstancia().obtener(Oprovision.getIdProvision());
                    OdetalleProvision.setIdProvision(Oprovision.getIdProvision());
                    ListaDetalleProvision = DetalleProvisionDAO.getInstancia().buscar(OdetalleProvision);
                    session.put("ListaDetalleProvision", ListaDetalleProvision);
                }

                Oingreso.setIdOrdenCompra(Oprovision.getIdOrdenCompra());

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

    public String GrabarProvision() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                Oprovision.setFecha(helper.getFechaValida(Oprovision.getFecha()));
                Oprovision.setFechaDocumento(helper.getFechaValida(Oprovision.getFechaDocumento()));
                Oprovision.setFechaVencimiento(helper.getFechaValida(Oprovision.getFechaVencimiento()));

                if (session.get("ListaDetalleProvision") != null) {
                    setListaDetalleProvision((ArrayList<DetalleProvision>) session.get("ListaDetalleProvision"));
                }
                double total = 0;
                String xml = "<root>";
                for (int i = 0; i < ListaDetalleProvision.size(); i++) {
                    xml = xml + ListaDetalleProvision.get(i).xml();
                    total = total + ListaDetalleProvision.get(i).getImporte();
                }
                xml = xml + "</root>";
                Oprovision.setTotal(total);
                if (Operacion.equals("Edicion")) {
                    ProvisionDAO.getInstancia().editar(Oprovision, (Usuario) session.get("Usuario"), xml);
                    msg = "Se edito correctamente";

                } else {
                    ProvisionDAO.getInstancia().ingresar(Oprovision, (Usuario) session.get("Usuario"), xml);
                    msg = "Se registro correctamente";
                }
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        } finally {
            session.remove("ListaDetalleProvision");
        }
        return SUCCESS;
    }

    public String ObtenerProvision() throws Exception {
        try {
            Oprovision = ProvisionDAO.getInstancia().obtener(Oprovision.getIdProvision());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarProvision() throws Exception {
        try {
            ListaProvision = ProvisionDAO.getInstancia().buscar(Oprovision);
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarProvision() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                msg = "Se Edito correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarProvision() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());
                ProvisionDAO.getInstancia().eliminar(Oprovision);
                msg = "Se Elimino correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    //agregamos index numero de filas detalle cuando jalamos por OS
    public String AgregarDetalleProvision() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                for (int i = 0; i < index; i++){
                    DetalleProvision objeto = new DetalleProvision();
                    ListaDetalleProvision.add(objeto);
                }

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

    public String QuitarDetalleProvision() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleProvision") != null) {
                    setListaDetalleProvision((ArrayList<DetalleProvision>) session.get("ListaDetalleProvision"));
                }

                ListaDetalleProvision.remove(index);

                session.put("ListaDetalleProvision", ListaDetalleProvision);

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

    public String GenerarDetalle() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (session.get("ListaDetalleProvision") != null) {
                    setListaDetalleProvision((ArrayList<DetalleProvision>) session.get("ListaDetalleProvision"));
                }

                ListaDetalleProvision.remove(index);
                session.put("ListaDetalleProvision", ListaDetalleProvision);

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

    //generar detalle de provision a partir de OC
    public String GenerarDetalleOC() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                ListaDetalleProvision = DetalleProvisionDAO.getInstancia().ListarPorOC(OordenCompra,Oprovision);
                session.put("ListaDetalleProvision", ListaDetalleProvision);

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

    //grabar detalle en sesion antes de grabar
    public String EnviarDetalleOC() throws Exception {
        try {
            setPermiso((Boolean) true);
            if (getPermiso()) {
                setSession(ActionContext.getContext().getSession());

                if (!ListaDetalleProvision.isEmpty()) {
                    session.put("ListaDetalleProvision", ListaDetalleProvision);
                }

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

    public Provision getOprovision() {
        return Oprovision;
    }

    public void setOprovision(Provision Oprovision) {
        this.Oprovision = Oprovision;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Provision> getListaProvision() {
        return ListaProvision;
    }

    public void setListaProvision(ArrayList<Provision> ListaProvision) {
        this.ListaProvision = ListaProvision;
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

    public ArrayList<Sucursal> getListaSucursal() {
        return ListaSucursal;
    }

    public void setListaSucursal(ArrayList<Sucursal> ListaSucursal) {
        this.ListaSucursal = ListaSucursal;
    }

    public ArrayList<TipoCompra> getListaTipoCompra() {
        return ListaTipoCompra;
    }

    public void setListaTipoCompra(ArrayList<TipoCompra> ListaTipoCompra) {
        this.ListaTipoCompra = ListaTipoCompra;
    }

    public ArrayList<String> getListaTipoDocumento() {
        return ListaTipoDocumento;
    }

    public void setListaTipoDocumento(ArrayList<String> ListaTipoDocumento) {
        this.ListaTipoDocumento = ListaTipoDocumento;
    }

    public ArrayList<FormaPago> getListaFormaPago() {
        return ListaFormaPago;
    }

    public void setListaFormaPago(ArrayList<FormaPago> ListaFormaPago) {
        this.ListaFormaPago = ListaFormaPago;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
    }

    public ArrayList<TipoAdquisicion> getListaTipoAdquisicion() {
        return ListaTipoAdquisicion;
    }

    public void setListaTipoAdquisicion(ArrayList<TipoAdquisicion> ListaTipoAdquisicion) {
        this.ListaTipoAdquisicion = ListaTipoAdquisicion;
    }

    public ArrayList<Percepcion> getListaPercepcion() {
        return ListaPercepcion;
    }

    public void setListaPercepcion(ArrayList<Percepcion> ListaPercepcion) {
        this.ListaPercepcion = ListaPercepcion;
    }

    public ArrayList<Renta> getListaRenta() {
        return ListaRenta;
    }

    public void setListaRenta(ArrayList<Renta> ListaRenta) {
        this.ListaRenta = ListaRenta;
    }

    public ArrayList<Aporte> getListaAporte() {
        return ListaAporte;
    }

    public void setListaAporte(ArrayList<Aporte> ListaAporte) {
        this.ListaAporte = ListaAporte;
    }

    public ArrayList<Tasa> getListaTasa() {
        return ListaTasa;
    }

    public void setListaTasa(ArrayList<Tasa> ListaTasa) {
        this.ListaTasa = ListaTasa;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public ArrayList<Cuenta> getListaCuenta() {
        return ListaCuenta;
    }

    public void setListaCuenta(ArrayList<Cuenta> ListaCuenta) {
        this.ListaCuenta = ListaCuenta;
    }

    public ArrayList<CentroCosto> getListaCentroCosto() {
        return ListaCentroCosto;
    }

    public void setListaCentroCosto(ArrayList<CentroCosto> ListaCentroCosto) {
        this.ListaCentroCosto = ListaCentroCosto;
    }

    public DetalleProvision getOdetalleProvision() {
        return OdetalleProvision;
    }

    public void setOdetalleProvision(DetalleProvision OdetalleProvision) {
        this.OdetalleProvision = OdetalleProvision;
    }

    public ArrayList<DetalleProvision> getListaDetalleProvision() {
        return ListaDetalleProvision;
    }

    public void setListaDetalleProvision(ArrayList<DetalleProvision> ListaDetalleProvision) {
        this.ListaDetalleProvision = ListaDetalleProvision;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public Ingreso getOingreso() {
        return Oingreso;
    }

    public void setOingreso(Ingreso Oingreso) {
        this.Oingreso = Oingreso;
    }

    public OrdenCompra getOordenCompra() {
        return OordenCompra;
    }

    public void setOordenCompra(OrdenCompra OordenCompra) {
        this.OordenCompra = OordenCompra;
    }
}
