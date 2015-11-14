package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;


public class IngresoController extends ActionSupport {

    private Ingreso Oingreso = new Ingreso();
    private ArrayList<Ingreso> ListaIngreso = new ArrayList<Ingreso>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private String Operacion = "Edicion";
    private ArrayList<Almacen> ListaAlmacen = new ArrayList<Almacen>();
    private ArrayList<TipoMovimiento> ListaTipoMovimiento = new ArrayList<TipoMovimiento>();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    private ArrayList<IngresoProducto> ListaIngresoProducto = new ArrayList<IngresoProducto>();
    private IngresoProducto Oingresoproducto = new IngresoProducto();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private ArrayList<OrdenCompraProducto> ListaOrdenCompraProducto = new ArrayList<OrdenCompraProducto>();
    private ArrayList<Subdiario> ListaSubdiario = new ArrayList<Subdiario>();
    private int index = 0;

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                session.remove("ListaOrdenCompraProducto");
                Almacen alma = new Almacen();
                setListaAlmacen(AlmacenDAO.getInstancia().buscar(alma));
                TipoMovimiento tipomov = new TipoMovimiento();
                setListaTipoMovimiento(TipoMovimientoDAO.getInstancia().buscar(tipomov));
                Moneda m = new Moneda();
                setListaMoneda(MonedaDAO.getInstancia().buscar(m));
                Producto pro = new Producto();
                setListaProducto(ProductoDAO.getInstancia().buscar(pro));
                getListaProducto().add(0, pro);
                CentroCosto centro = new CentroCosto();
                setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(centro));
                ListaSubdiario = SubdiarioDAO.getInstancia().buscar(new Subdiario());

                if (Operacion.equals("Edicion")) {
                    if (Oingreso.getIdIngreso() == 0) {
                        Oingreso.setIdIngreso(IngresoDAO.getInstancia().obtenerUltimo());
                    }
                    setOingreso(IngresoDAO.getInstancia().obtener(Oingreso.getIdIngreso()));
                    setListaIngresoProducto(IngresoDAO.getInstancia().buscardetalle(Oingreso));
                    session.put("ListaIngresoProducto", ListaIngresoProducto);
                }
                if (Operacion.equals("Nuevo")) {
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                    Oingreso.setFecha(formateador.format(ahora));
                    TipoCambio tipocambio = new TipoCambio();
                    tipocambio.setIdMonedaCobra(8);
                    tipocambio.setIdMonedaPago(7);
                    Oingreso.setTipoCambio(TipoCambioDAO.getInstancia().obtener(tipocambio).getValor());
                    session.remove("ListaIngresoProducto");
                    setListaIngresoProducto(new ArrayList<IngresoProducto>());
                }

                return "Autorizado";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
            return "NoAutorizado";
        }
    }

    public String GrabarIngreso() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                if (session.get("ListaIngresoProducto") != null) {
                    setListaIngresoProducto((ArrayList<IngresoProducto>) session.get("ListaIngresoProducto"));
                }
                if (ListaIngresoProducto.isEmpty()){ error = true; msg = "Debe agregar al menos un articulo en el ingreso";}
                else{
                String xml = "<root>";
                for (int i = 0; i < ListaIngresoProducto.size(); i++) {
                    xml = xml + ListaIngresoProducto.get(i).xml();
                }
                xml = xml + "</root>";
                Oingreso.setFecha(helper.getFechaValida(Oingreso.getFecha()));
                Oingreso.setFechaDocumento(helper.getFechaValida(Oingreso.getFechaDocumento()));
                if (Operacion.equals("Nuevo")) {
                    Oingreso.setIdIngreso(IngresoDAO.getInstancia().ingresar(Oingreso, (Usuario) session.get("Usuario"), xml));
                    msg = "Se registro correctamente";
                }
                if (Operacion.equals("Edicion")) {
                    IngresoDAO.getInstancia().editar(Oingreso, (Usuario) session.get("Usuario"), xml);
                    msg = "Se edito correctamente";
                }
                }
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerIngreso() throws Exception {
        try {
            Oingreso = IngresoDAO.getInstancia().obtener(Oingreso.getIdIngreso());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarIngreso() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                //IngresoDAO.getInstancia().editar(Oingreso, (Usuario) session.get("Usuario"));
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

    public String EliminarIngreso() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                IngresoDAO.getInstancia().eliminar(Oingreso, (Usuario) session.get("Usuario"));
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

    public String BuscarIngreso() throws Exception {
        try {
            setListaIngreso(IngresoDAO.getInstancia().buscar(Oingreso));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarIngresoPorOC() throws Exception {
        try {
            setListaIngreso(IngresoDAO.getInstancia().buscarPorOC(Oingreso));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarIngresoProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaIngresoProducto") != null) {
                setListaIngresoProducto((ArrayList<IngresoProducto>) session.get("ListaIngresoProducto"));
            }
            Oingresoproducto.setImporte(Oingresoproducto.getPrecio() * Oingresoproducto.getCantidad());

            Oingresoproducto.setDCentroCosto(CentroCostoDAO.getInstancia().obtener(Oingresoproducto.getIdCentroCosto()).getDescripcion());
            ListaIngresoProducto.add(Oingresoproducto);
            session.put("ListaIngresoProducto", ListaIngresoProducto);

            double total = 0;
            for (int i = 0; i < ListaIngresoProducto.size(); i++) {
                total = total + ListaIngresoProducto.get(i).getImporte();
            }
            Oingreso.setMonto(total);

            msg = "Se agrego correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarIngresoProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaIngresoProducto") != null) {
                setListaIngresoProducto((ArrayList<IngresoProducto>) session.get("ListaIngresoProducto"));
            }
            ListaIngresoProducto.remove(getIndex());
            session.put("ListaIngresoProducto", ListaIngresoProducto);

            double total = 0;
            for (int i = 0; i < ListaIngresoProducto.size(); i++) {
                total = total + ListaIngresoProducto.get(i).getImporte();
            }
            Oingreso.setMonto(total);

            msg = "Se removio correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerOrdenCompraProducto() throws Exception {
        try {
            setListaOrdenCompraProducto(OrdenCompraDAO.getInstancia().obtenerDetalle(Oingreso.getIdOrdenCompra()));
            CentroCosto centro = new CentroCosto();
            setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(centro));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String RecibirIngresoProducto() throws Exception {
        try {
            setListaIngresoProducto(ListaIngresoProducto);
            session.put("ListaIngresoProducto", ListaIngresoProducto);
            msg = "correcto";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Ingreso getOingreso() {
        return Oingreso;
    }

    public void setOingreso(Ingreso Oingreso) {
        this.Oingreso = Oingreso;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Ingreso> getListaIngreso() {
        return ListaIngreso;
    }

    public void setListaIngreso(ArrayList<Ingreso> ListaIngreso) {
        this.ListaIngreso = ListaIngreso;
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

    public ArrayList<Almacen> getListaAlmacen() {
        return ListaAlmacen;
    }

    public void setListaAlmacen(ArrayList<Almacen> ListaAlmacen) {
        this.ListaAlmacen = ListaAlmacen;
    }

    public ArrayList<TipoMovimiento> getListaTipoMovimiento() {
        return ListaTipoMovimiento;
    }

    public void setListaTipoMovimiento(ArrayList<TipoMovimiento> ListaTipoMovimiento) {
        this.ListaTipoMovimiento = ListaTipoMovimiento;
    }

    public ArrayList<Moneda> getListaMoneda() {
        return ListaMoneda;
    }

    public void setListaMoneda(ArrayList<Moneda> ListaMoneda) {
        this.ListaMoneda = ListaMoneda;
    }

    public ArrayList<Producto> getListaProducto() {
        return ListaProducto;
    }

    public void setListaProducto(ArrayList<Producto> ListaProducto) {
        this.ListaProducto = ListaProducto;
    }

    public ArrayList<IngresoProducto> getListaIngresoProducto() {
        return ListaIngresoProducto;
    }

    public void setListaIngresoProducto(ArrayList<IngresoProducto> ListaIngresoProducto) {
        this.ListaIngresoProducto = ListaIngresoProducto;
    }

    public IngresoProducto getOingresoproducto() {
        return Oingresoproducto;
    }

    public void setOingresoproducto(IngresoProducto Oingresoproducto) {
        this.Oingresoproducto = Oingresoproducto;
    }

    public ArrayList<CentroCosto> getListaCentroCosto() {
        return ListaCentroCosto;
    }

    public void setListaCentroCosto(ArrayList<CentroCosto> ListaCentroCosto) {
        this.ListaCentroCosto = ListaCentroCosto;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public ArrayList<OrdenCompraProducto> getListaOrdenCompraProducto() {
        return ListaOrdenCompraProducto;
    }

    public void setListaOrdenCompraProducto(ArrayList<OrdenCompraProducto> ListaOrdenCompraProducto) {
        this.ListaOrdenCompraProducto = ListaOrdenCompraProducto;
    }

    public ArrayList<Subdiario> getListaSubdiario() {
        return ListaSubdiario;
    }

    public void setListaSubdiario(ArrayList<Subdiario> ListaSubdiario) {
        this.ListaSubdiario = ListaSubdiario;
    }
}
