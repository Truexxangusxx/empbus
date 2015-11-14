package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class SalidaController extends ActionSupport {

    private Salida Osalida = new Salida();
    private ArrayList<Salida> ListaSalida = new ArrayList<Salida>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private String Operacion = "Edicion";
    private ArrayList<Almacen> ListaAlmacen = new ArrayList<Almacen>();
    private ArrayList<TipoMovimiento> ListaTipoMovimiento = new ArrayList<TipoMovimiento>();
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private int index = 0;
    private SalidaProducto Osalidaproducto = new SalidaProducto();
    private ArrayList<SalidaProducto> ListaSalidaProducto = new ArrayList<SalidaProducto>();
    private ArrayList<Estandar> ListaEstandar = new ArrayList<Estandar>();
    private ArrayList<Subdiario> ListaSubdiario = new ArrayList<Subdiario>();

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                session.remove("ListaSalidaProducto");
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
                    if (Osalida.getIdSalida() == 0) {
                        Osalida.setIdSalida(SalidaDAO.getInstancia().obtenerUltimo());
                    }
                    setOsalida(SalidaDAO.getInstancia().obtener(Osalida.getIdSalida()));
                    setListaSalidaProducto(SalidaDAO.getInstancia().buscarDetalle(Osalida));
                    session.put("ListaSalidaProducto", getListaSalidaProducto());
                }
                if (Operacion.equals("Nuevo")) {
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                    Osalida.setFecha(formateador.format(ahora));
                    TipoCambio tipocambio = new TipoCambio();
                    tipocambio.setIdMonedaCobra(8);
                    tipocambio.setIdMonedaPago(7);
                    Osalida.setTipoCambio(TipoCambioDAO.getInstancia().obtener(tipocambio).getValor());
                    session.remove("ListaSalidaProducto");
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

    public String GrabarSalida() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                if (session.get("ListaSalidaProducto") != null) {
                    setListaSalidaProducto((ArrayList<SalidaProducto>) session.get("ListaSalidaProducto"));
                }

                if (ListaSalidaProducto.isEmpty()) {
                    error = true;
                    msg = "El detalle debe tener al menos un item";
                } else {
                    String xml = "<root>";
                    for (int i = 0; i < ListaSalidaProducto.size(); i++) {
                        xml = xml + ListaSalidaProducto.get(i).xml();
                    }
                    xml = xml + "</root>";
                    Osalida.setFecha(helper.getFechaValida(Osalida.getFecha()));

                    if (Operacion.equals("Nuevo")) {
                        SalidaDAO.getInstancia().ingresar(Osalida, (Usuario) session.get("Usuario"), xml);
                        msg = "Se registro correctamente";
                    } else {
                        SalidaDAO.getInstancia().editar(Osalida, (Usuario) session.get("Usuario"), xml);
                        msg = "Se edito correctamente";
                    }
                }
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerSalida() throws Exception {
        try {
            Osalida = SalidaDAO.getInstancia().obtener(Osalida.getIdSalida());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarSalida() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                //SalidaDAO.getInstancia().editar(Osalida, (Usuario) session.get("Usuario"));
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

    public String EliminarSalida() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                SalidaDAO.getInstancia().eliminar(Osalida, (Usuario) session.get("Usuario"));
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

    public String AgregarSalidaProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaSalidaProducto") != null) {
                setListaSalidaProducto((ArrayList<SalidaProducto>) session.get("ListaSalidaProducto"));
            }
            getOsalidaproducto().setImporte(Osalidaproducto.getPrecio() * Osalidaproducto.getCantidad());
            Osalidaproducto.setStock(ProductoDAO.getInstancia().obtenerStock(Osalida.getIdAlmacen(), Osalidaproducto.getIdProducto()));
            Osalidaproducto.setDCentroCosto(CentroCostoDAO.getInstancia().obtener(Osalidaproducto.getIdCentroCosto()).getDescripcion());
            if (session.get("ListaEstandar") != null) {
                setListaEstandar((ArrayList<Estandar>) session.get("ListaEstandar"));
            }
            for (int i = 0; i < getListaEstandar().size(); i++) {
                if (getListaEstandar().get(i).getIdProducto() == Osalidaproducto.getIdProducto()) {
                    Osalidaproducto.setEstandar(getListaEstandar().get(i).getCantidad());
                }
            }
            getListaSalidaProducto().add(Osalidaproducto);
            session.put("ListaSalidaProducto", getListaSalidaProducto());

            msg = "Se agrego correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarSalidaProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaSalidaProducto") != null) {
                setListaSalidaProducto((ArrayList<SalidaProducto>) session.get("ListaSalidaProducto"));
            }
            ListaSalidaProducto.remove(getIndex());
            session.put("ListaSalidaProducto", ListaSalidaProducto);

            msg = "Se removio correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarSalida() throws Exception {
        try {
            setListaSalida(SalidaDAO.getInstancia().buscar(Osalida));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Salida getOsalida() {
        return Osalida;
    }

    public void setOsalida(Salida Osalida) {
        this.Osalida = Osalida;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Salida> getListaSalida() {
        return ListaSalida;
    }

    public void setListaSalida(ArrayList<Salida> ListaSalida) {
        this.ListaSalida = ListaSalida;
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

    public ArrayList<SalidaProducto> getListaSalidaProducto() {
        return ListaSalidaProducto;
    }

    public void setListaSalidaProducto(ArrayList<SalidaProducto> ListaSalidaProducto) {
        this.ListaSalidaProducto = ListaSalidaProducto;
    }

    public SalidaProducto getOsalidaproducto() {
        return Osalidaproducto;
    }

    public void setOsalidaproducto(SalidaProducto Osalidaproducto) {
        this.Osalidaproducto = Osalidaproducto;
    }

    public ArrayList<Estandar> getListaEstandar() {
        return ListaEstandar;
    }

    public void setListaEstandar(ArrayList<Estandar> ListaEstandar) {
        this.ListaEstandar = ListaEstandar;
    }

    public ArrayList<Subdiario> getListaSubdiario() {
        return ListaSubdiario;
    }

    public void setListaSubdiario(ArrayList<Subdiario> ListaSubdiario) {
        this.ListaSubdiario = ListaSubdiario;
    }
}
