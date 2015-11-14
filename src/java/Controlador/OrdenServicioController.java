package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class OrdenServicioController extends ActionSupport {

    private OrdenServicio Oordenservicio = new OrdenServicio();
    private ArrayList<OrdenServicio> ListaOrdenServicio = new ArrayList<OrdenServicio>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private String Operacion = "Edicion";
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private ArrayList<FormaPago> ListaFormaPago = new ArrayList<FormaPago>();
    private ArrayList<OrdenServicioProducto> ListaOrdenServicioProducto = new ArrayList<OrdenServicioProducto>();
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    private OrdenServicioProducto Oordenservicioproducto = new OrdenServicioProducto();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private int index = 0;

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                session.remove("ListaOrdenServicioProducto");
                Sucursal su = new Sucursal();
                setListaSucursal(SucursalDAO.getInstancia().buscar(su));
                FormaPago forma = new FormaPago();
                setListaFormaPago(FormaPagoDAO.getInstancia().buscar(forma));
                Moneda m = new Moneda();
                setListaMoneda(MonedaDAO.getInstancia().buscar(m));
                Producto pro = new Producto();
                setListaProducto(ProductoDAO.getInstancia().buscar(pro));
                ListaProducto.add(0, pro);
                CentroCosto centro = new CentroCosto();
                setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(centro));

                if (Operacion.equals("Edicion")) {
                    if (Oordenservicio.getIdOrdenServicio() == 0) {
                        Oordenservicio.setIdOrdenServicio(OrdenServicioDAO.getInstancia().ultimoID());
                    }
                    setOordenservicio(OrdenServicioDAO.getInstancia().obtener(Oordenservicio.getIdOrdenServicio()));
                    setListaOrdenServicioProducto(OrdenServicioDAO.getInstancia().obtenerDetalle(Oordenservicio.getIdOrdenServicio()));
                    session.put("ListaOrdenServicioProducto", ListaOrdenServicioProducto);
                }
                if (Operacion.equals("Nuevo")) {
                    Oordenservicio.setIGV(IGVDAO.getInstancia().obtener().getValor());
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                    Oordenservicio.setFecha(formateador.format(ahora));
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

    public String GrabarOrdenServicio() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

                if (session.get("ListaOrdenServicioProducto") != null) {
                    setListaOrdenServicioProducto((ArrayList<OrdenServicioProducto>) session.get("ListaOrdenServicioProducto"));
                }

                String xml = "<root>";
                for (int i = 0; i < ListaOrdenServicioProducto.size(); i++) {
                    xml = xml + ListaOrdenServicioProducto.get(i).xml();
                }
                xml = xml + "</root>";
                Oordenservicio.setFecha(helper.getFechaValida(Oordenservicio.getFecha()));
                Oordenservicio.setFechaEntrega(helper.getFechaValida(Oordenservicio.getFechaEntrega()));

                if (Operacion.equals("Edicion")) {
                    OrdenServicioDAO.getInstancia().editar(Oordenservicio, (Usuario) session.get("Usuario"), xml);
                    msg = "Se edito correctamente";
                }
                if (Operacion.equals("Nuevo")) {
                    Oordenservicio.setIdOrdenServicio(OrdenServicioDAO.getInstancia().ingresar(Oordenservicio, (Usuario) session.get("Usuario"), xml));
                    msg = "Se registro correctamente";
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

    public String ObtenerOrdenServicio() throws Exception {
        try {
            Oordenservicio = OrdenServicioDAO.getInstancia().obtener(Oordenservicio.getIdOrdenServicio());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarOrdenServicio() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                OrdenServicioDAO.getInstancia().editar(Oordenservicio, null, msg);
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

    public String EliminarOrdenServicio() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                OrdenServicioDAO.getInstancia().eliminar(Oordenservicio, (Usuario) session.get("Usuario"));
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

    public String AgregarOrdenServicioProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaOrdenServicioProducto") != null) {
                setListaOrdenServicioProducto((ArrayList<OrdenServicioProducto>) session.get("ListaOrdenServicioProducto"));
            }
            getOordenservicioproducto().setImporte(Oordenservicioproducto.getPrecioUnitario() * Oordenservicioproducto.getCantidad());
            ListaOrdenServicioProducto.add(getOordenservicioproducto());
            session.put("ListaOrdenServicioProducto", ListaOrdenServicioProducto);
            setListaOrdenServicioProducto(ListaOrdenServicioProducto);

            double total = 0;
            for (int i = 0; i < ListaOrdenServicioProducto.size(); i++) {
                total = total + ListaOrdenServicioProducto.get(i).getImporte();
            }
            Oordenservicio.setMonto(total);
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarOrdenServicioProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaOrdenServicioProducto") != null) {
                setListaOrdenServicioProducto((ArrayList<OrdenServicioProducto>) session.get("ListaOrdenServicioProducto"));
            }
            ListaOrdenServicioProducto.remove(getIndex());
            session.put("ListaCotizacionProducto", ListaOrdenServicioProducto);
            setListaOrdenServicioProducto(ListaOrdenServicioProducto);

            double total = 0;
            for (int i = 0; i < ListaOrdenServicioProducto.size(); i++) {
                total = total + ListaOrdenServicioProducto.get(i).getImporte();
            }
            Oordenservicio.setMonto(total);
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarOrdenServicio() throws Exception {
        try {
            setListaOrdenServicio(OrdenServicioDAO.getInstancia().buscar(Oordenservicio));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    
    public OrdenServicio getOordenservicio() {
        return Oordenservicio;
    }

    public void setOordenservicio(OrdenServicio Oordenservicio) {
        this.Oordenservicio = Oordenservicio;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<OrdenServicio> getListaOrdenServicio() {
        return ListaOrdenServicio;
    }

    public void setListaOrdenServicio(ArrayList<OrdenServicio> ListaOrdenServicio) {
        this.ListaOrdenServicio = ListaOrdenServicio;
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

    public ArrayList<FormaPago> getListaFormaPago() {
        return ListaFormaPago;
    }

    public void setListaFormaPago(ArrayList<FormaPago> ListaFormaPago) {
        this.ListaFormaPago = ListaFormaPago;
    }

    public ArrayList<Producto> getListaProducto() {
        return ListaProducto;
    }

    public void setListaProducto(ArrayList<Producto> ListaProducto) {
        this.ListaProducto = ListaProducto;
    }

    public ArrayList<OrdenServicioProducto> getListaOrdenServicioProducto() {
        return ListaOrdenServicioProducto;
    }

    public void setListaOrdenServicioProducto(ArrayList<OrdenServicioProducto> ListaOrdenServicioProducto) {
        this.ListaOrdenServicioProducto = ListaOrdenServicioProducto;
    }

    public OrdenServicioProducto getOordenservicioproducto() {
        return Oordenservicioproducto;
    }

    public void setOordenservicioproducto(OrdenServicioProducto Oordenservicioproducto) {
        this.Oordenservicioproducto = Oordenservicioproducto;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public ArrayList<CentroCosto> getListaCentroCosto() {
        return ListaCentroCosto;
    }

    public void setListaCentroCosto(ArrayList<CentroCosto> ListaCentroCosto) {
        this.ListaCentroCosto = ListaCentroCosto;
    }
}
