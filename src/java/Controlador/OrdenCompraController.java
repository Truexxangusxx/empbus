package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class OrdenCompraController extends ActionSupport {

    private OrdenCompra Oordencompra = new OrdenCompra();
    private ArrayList<OrdenCompra> ListaOrdenCompra = new ArrayList<OrdenCompra>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private ArrayList<Moneda> ListaMoneda = new ArrayList<Moneda>();
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private ArrayList<FormaPago> ListaFormaPago = new ArrayList<FormaPago>();
    private ArrayList<OrdenCompraProducto> ListaOrdenCompraProducto = new ArrayList<OrdenCompraProducto>();
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    private OrdenCompraProducto Oordencompraproducto = new OrdenCompraProducto();
    private int index;
    private String Operacion = "Edicion";
    private ArrayList<ReferenciaCompra> ListaReferenciaCompra = new ArrayList<ReferenciaCompra>();

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                session.remove("ListaOrdenCompraProducto");
                Sucursal su = new Sucursal();
                su.setDescripcion("");
                setListaSucursal(SucursalDAO.getInstancia().buscar(su));
                FormaPago forma = new FormaPago();
                forma.setDescripcion("");
                setListaFormaPago(FormaPagoDAO.getInstancia().buscar(forma));
                Moneda m = new Moneda();
                m.setDescripcion("");
                setListaMoneda(MonedaDAO.getInstancia().buscar(m));
                Producto pro = new Producto();
                setListaProducto(ProductoDAO.getInstancia().buscar(pro));
                ListaProducto.add(0, pro);

                if (Operacion.equals("Edicion")) {
                    if (Oordencompra.getIdOrdenCompra() == 0) {
                        Oordencompra.setIdOrdenCompra(OrdenCompraDAO.getInstancia().ultimoid());
                    }
                    setOordencompra(OrdenCompraDAO.getInstancia().obtener(Oordencompra.getIdOrdenCompra()));
                    setListaOrdenCompraProducto(OrdenCompraDAO.getInstancia().obtenerDetalle(Oordencompra.getIdOrdenCompra()));
                    session.put("ListaOrdenCompraProducto", ListaOrdenCompraProducto);
                    setListaReferenciaCompra(OrdenCompraDAO.getInstancia().buscarReferencia(Oordencompra));
                }
                if (Operacion.equals("Nuevo")) {
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                    Oordencompra.setFecha(formateador.format(ahora));
                    Oordencompra.setIGV(IGVDAO.getInstancia().obtener().getValor());
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

    public String GrabarOrdenCompra() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                if (session.get("ListaOrdenCompraProducto") != null) {
                    setListaOrdenCompraProducto((ArrayList<OrdenCompraProducto>) session.get("ListaOrdenCompraProducto"));
                }
                String xml = "<root>";
                for (int i = 0; i < ListaOrdenCompraProducto.size(); i++) {
                    xml = xml + ListaOrdenCompraProducto.get(i).xml();
                }
                xml = xml + "</root>";
                Oordencompra.setFecha(helper.getFechaValida(Oordencompra.getFecha()));
                Oordencompra.setFechaEntrega(helper.getFechaValida(Oordencompra.getFechaEntrega()));
                
                if (Operacion.equals("Edicion")) {OrdenCompraDAO.getInstancia().editar(Oordencompra, (Usuario) session.get("Usuario"), xml);msg = "Se edito correctamente";}
                if (Operacion.equals("Nuevo")) {Oordencompra.setIdOrdenCompra(OrdenCompraDAO.getInstancia().ingresar(Oordencompra, (Usuario) session.get("Usuario"), xml));msg = "Se registro correctamente";}
                
                
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

    public String ObtenerOrdenCompra() throws Exception {
        try {
            Oordencompra = OrdenCompraDAO.getInstancia().obtener(Oordencompra.getIdOrdenCompra());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarOrdenCompra() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();

                //OrdenCompraDAO.getInstancia().editar(Oordencompra, (Usuario) session.get("Usuario"));
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

    public String EliminarOrdenCompra() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                OrdenCompraDAO.getInstancia().eliminar(Oordencompra, (Usuario) session.get("Usuario"));
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

    public String AgregarOrdenCompraProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaOrdenCompraProducto") != null) {
                setListaOrdenCompraProducto((ArrayList<OrdenCompraProducto>) session.get("ListaOrdenCompraProducto"));
            }
            Oordencompraproducto.setImporte(Oordencompraproducto.getPrecioUnitario() * Oordencompraproducto.getCantidad());
            ListaOrdenCompraProducto.add(getOordencompraproducto());
            session.put("ListaOrdenCompraProducto", ListaOrdenCompraProducto);
            setListaOrdenCompraProducto(ListaOrdenCompraProducto);

            double total = 0;
            for (int i = 0; i < ListaOrdenCompraProducto.size(); i++) {
                total = total + ListaOrdenCompraProducto.get(i).getImporte();
            }
            Oordencompra.setTotal(total);

            msg = "Se agrego correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarOrdenCompraProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaOrdenCompraProducto") != null) {
                setListaOrdenCompraProducto((ArrayList<OrdenCompraProducto>) session.get("ListaOrdenCompraProducto"));
            }
            ListaOrdenCompraProducto.remove(index);
            session.put("ListaCotizacionProducto", ListaOrdenCompraProducto);
            setListaOrdenCompraProducto(ListaOrdenCompraProducto);

            double total = 0;
            for (int i = 0; i < ListaOrdenCompraProducto.size(); i++) {
                total = total + ListaOrdenCompraProducto.get(i).getImporte();
            }
            Oordencompra.setTotal(total);

            msg = "Se removio correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String AprobarOrdenCompra() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                OrdenCompraDAO.getInstancia().aprobar(Oordencompra, (Usuario) session.get("Usuario"));
                msg = "Se Aprobo correctamente";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarOrdenCompra() throws Exception {
        try {
            setListaOrdenCompra(OrdenCompraDAO.getInstancia().buscar(Oordencompra));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
        

    public OrdenCompra getOordencompra() {
        return Oordencompra;
    }

    public void setOordencompra(OrdenCompra Oordencompra) {
        this.Oordencompra = Oordencompra;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<OrdenCompra> getListaOrdenCompra() {
        return ListaOrdenCompra;
    }

    public void setListaOrdenCompra(ArrayList<OrdenCompra> ListaOrdenCompra) {
        this.ListaOrdenCompra = ListaOrdenCompra;
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

    public ArrayList<OrdenCompraProducto> getListaOrdenCompraProducto() {
        return ListaOrdenCompraProducto;
    }

    public void setListaOrdenCompraProducto(ArrayList<OrdenCompraProducto> ListaOrdenCompraProducto) {
        this.ListaOrdenCompraProducto = ListaOrdenCompraProducto;
    }

    public ArrayList<Producto> getListaProducto() {
        return ListaProducto;
    }

    public void setListaProducto(ArrayList<Producto> ListaProducto) {
        this.ListaProducto = ListaProducto;
    }

    public OrdenCompraProducto getOordencompraproducto() {
        return Oordencompraproducto;
    }

    public void setOordencompraproducto(OrdenCompraProducto Oordencompraproducto) {
        this.Oordencompraproducto = Oordencompraproducto;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public ArrayList<ReferenciaCompra> getListaReferenciaCompra() {
        return ListaReferenciaCompra;
    }

    public void setListaReferenciaCompra(ArrayList<ReferenciaCompra> ListaReferenciaCompra) {
        this.ListaReferenciaCompra = ListaReferenciaCompra;
    }
}
