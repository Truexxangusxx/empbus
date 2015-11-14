package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

public class OrdenProduccionController extends ActionSupport {

    private OrdenProduccion Oordenproduccion = new OrdenProduccion();
    private ArrayList<OrdenProduccion> ListaOrdenProduccion = new ArrayList<OrdenProduccion>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private String Operacion = "Edicion";
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private ArrayList<TipoOrdenProduccion> ListaTipoOrdenProduccion = new ArrayList<TipoOrdenProduccion>();
    private ArrayList<CotizacionProducto> ListaCotizacionProducto = new ArrayList<CotizacionProducto>();
    private ArrayList<CotizacionCaracteristicas> ListaCotizacionCaracteristicas = new ArrayList<CotizacionCaracteristicas>();
    private ArrayList<Familia> ListaFamilia = new ArrayList<Familia>();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private ArrayList<ReferenciaMaterialesOP> ListaReferenciaMaterialesOP = new ArrayList<ReferenciaMaterialesOP>();
    private ArrayList<Estandar> ListaEstandar = new ArrayList<Estandar>();
    private ArrayList<ReferenciaServiciosOP> ListaReferenciaServiciosOP = new ArrayList<ReferenciaServiciosOP>();

    public String Load() throws Exception {
        try {
            permiso = true;
            if (permiso) {

                Sucursal su = new Sucursal();
                setListaSucursal(SucursalDAO.getInstancia().buscar(su));
                TipoOrdenProduccion tipo = new TipoOrdenProduccion();
                setListaTipoOrdenProduccion(TipoOrdenProduccionDAO.getInstancia().listar(tipo));
                Familia fam = new Familia();
                setListaFamilia(FamiliaDAO.getInstancia().buscar(fam));
                fam.setDescripcion("Todos");
                ListaFamilia.add(0, fam);
                CentroCosto centro = new CentroCosto();
                setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(centro));
                
                if (Operacion.equals("Edicion")){
                if (Oordenproduccion.getIdOrdenProduccion() == 0) {
                    int id = 0;
                    id = OrdenProduccionDAO.getInstancia().ultimoid();
                    setOordenproduccion(OrdenProduccionDAO.getInstancia().obtener(id));
                } else {
                    setOordenproduccion(OrdenProduccionDAO.getInstancia().obtener(Oordenproduccion.getIdOrdenProduccion()));
                }
                setListaReferenciaMaterialesOP(OrdenProduccionDAO.getInstancia().buscarReferenciaMateriales(Oordenproduccion));
                setListaReferenciaServiciosOP(OrdenProduccionDAO.getInstancia().buscarReferenciaServicios(Oordenproduccion));
                }
                if (Operacion.equals("Nuevo")){
                    ListaTipoOrdenProduccion.remove(0);
                }
                
                Cotizacion cot = new Cotizacion();
                cot.setIdCotizacion(Oordenproduccion.getIdCotizacion());
                setListaCotizacionProducto(CotizacionDAO.getInstancia().obtenerCotizacionProducto(cot));
                setListaCotizacionCaracteristicas(CotizacionDAO.getInstancia().obtenerCotizacionCaracteristicas(cot));
                
                return "Autorizado";
            } else {
                error = true;
                msg = "No cuenta con los permisos necesarios";
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarOrdenProduccion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

                if (Operacion.equals("Edicion")) {
                    Oordenproduccion.setFecha(helper.getFechaValida(Oordenproduccion.getFecha()));
                    Oordenproduccion.setFechaInicio(helper.getFechaValida(Oordenproduccion.getFechaInicio()));
                    Oordenproduccion.setFechaTermino(helper.getFechaValida(Oordenproduccion.getFechaTermino()));
                    OrdenProduccionDAO.getInstancia().editar(Oordenproduccion, (Usuario) session.get("Usuario"));
                    msg = "Se edito correctamente";
                }
                if (Operacion.equals("Nuevo")) {
                    Oordenproduccion.setFecha(helper.getFechaValida(Oordenproduccion.getFecha()));
                    Oordenproduccion.setFechaInicio(helper.getFechaValida(Oordenproduccion.getFechaInicio()));
                    Oordenproduccion.setFechaTermino(helper.getFechaValida(Oordenproduccion.getFechaTermino()));
                    setOordenproduccion(OrdenProduccionDAO.getInstancia().obtener(OrdenProduccionDAO.getInstancia().ingresar(Oordenproduccion, (Usuario) session.get("Usuario"))));
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

    public String ObtenerOrdenProduccion() throws Exception {
        try {
            Oordenproduccion = OrdenProduccionDAO.getInstancia().obtener(Oordenproduccion.getIdOrdenProduccion());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarOrdenProduccion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                OrdenProduccionDAO.getInstancia().editar(Oordenproduccion, (Usuario) session.get("Usuario"));
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

    public String EliminarOrdenProduccion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                OrdenProduccionDAO.getInstancia().eliminar(Oordenproduccion, (Usuario) session.get("Usuario"));
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
    
    public String BuscarOrdenProduccion() throws Exception {
        try {
            setListaOrdenProduccion(OrdenProduccionDAO.getInstancia().buscar(Oordenproduccion));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String BuscarEstandar() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            setListaEstandar(OrdenProduccionDAO.getInstancia().buscarEstandar(Oordenproduccion));
            session.put("ListaEstandar", ListaEstandar);
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    public String GenerarPedido() throws Exception{
        try{
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
            Pedido pedido = new Pedido();
            ArrayList<PedidoProducto> ListaPedidoProducto = new ArrayList<PedidoProducto>();
            
            pedido.setIdCentroCosto(Oordenproduccion.getIdCentroCosto());
            pedido.setIdOrdenProduccion(Oordenproduccion.getIdOrdenProduccion());
            //pedido.setIdEmpleado();
            pedido.setObservaciones("");
            
            ArrayList<Estandar> ListaEstandar = EstandarDAO.getInstancia().buscar(Oordenproduccion.getIdProducto());
            String xml = "<root>";
            for (int i = 0; i < ListaEstandar.size(); i++){
                PedidoProducto pp = new PedidoProducto();
                pp.setCantidad(ListaEstandar.get(i).getCantidad());
                pp.setIdProducto(ListaEstandar.get(i).getIdProducto());
                pp.setGlosa("");
                xml = xml + pp.xml();
            }
            xml = xml + "</root>";
            int idPedido = OrdenProduccionDAO.getInstancia().GenerarPedido(pedido, (Usuario) session.get("Usuario"), xml);
            msg = "Se registro correctamente";
            }
            else{msg = "No cuenta con los permisos necesarios"; error = true;}
            
        }catch (Exception ex){
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }
    
    

    public OrdenProduccion getOordenproduccion() {
        return Oordenproduccion;
    }

    public void setOordenproduccion(OrdenProduccion Oordenproduccion) {
        this.Oordenproduccion = Oordenproduccion;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<OrdenProduccion> getListaOrdenProduccion() {
        return ListaOrdenProduccion;
    }

    public void setListaOrdenProduccion(ArrayList<OrdenProduccion> ListaOrdenProduccion) {
        this.ListaOrdenProduccion = ListaOrdenProduccion;
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

    public ArrayList<Sucursal> getListaSucursal() {
        return ListaSucursal;
    }

    public void setListaSucursal(ArrayList<Sucursal> ListaSucursal) {
        this.ListaSucursal = ListaSucursal;
    }

    public ArrayList<TipoOrdenProduccion> getListaTipoOrdenProduccion() {
        return ListaTipoOrdenProduccion;
    }

    public void setListaTipoOrdenProduccion(ArrayList<TipoOrdenProduccion> ListaTipoOrdenProduccion) {
        this.ListaTipoOrdenProduccion = ListaTipoOrdenProduccion;
    }

    public ArrayList<CotizacionProducto> getListaCotizacionProducto() {
        return ListaCotizacionProducto;
    }

    public void setListaCotizacionProducto(ArrayList<CotizacionProducto> ListaCotizacionProducto) {
        this.ListaCotizacionProducto = ListaCotizacionProducto;
    }

    public ArrayList<CotizacionCaracteristicas> getListaCotizacionCaracteristicas() {
        return ListaCotizacionCaracteristicas;
    }

    public void setListaCotizacionCaracteristicas(ArrayList<CotizacionCaracteristicas> ListaCotizacionCaracteristicas) {
        this.ListaCotizacionCaracteristicas = ListaCotizacionCaracteristicas;
    }

    public ArrayList<Familia> getListaFamilia() {
        return ListaFamilia;
    }

    public void setListaFamilia(ArrayList<Familia> ListaFamilia) {
        this.ListaFamilia = ListaFamilia;
    }

    public ArrayList<CentroCosto> getListaCentroCosto() {
        return ListaCentroCosto;
    }

    public void setListaCentroCosto(ArrayList<CentroCosto> ListaCentroCosto) {
        this.ListaCentroCosto = ListaCentroCosto;
    }

    public ArrayList<ReferenciaMaterialesOP> getListaReferenciaMaterialesOP() {
        return ListaReferenciaMaterialesOP;
    }

    public void setListaReferenciaMaterialesOP(ArrayList<ReferenciaMaterialesOP> ListaReferenciaMaterialesOP) {
        this.ListaReferenciaMaterialesOP = ListaReferenciaMaterialesOP;
    }

    public ArrayList<Estandar> getListaEstandar() {
        return ListaEstandar;
    }

    public void setListaEstandar(ArrayList<Estandar> ListaEstandar) {
        this.ListaEstandar = ListaEstandar;
    }

    public ArrayList<ReferenciaServiciosOP> getListaReferenciaServiciosOP() {
        return ListaReferenciaServiciosOP;
    }

    public void setListaReferenciaServiciosOP(ArrayList<ReferenciaServiciosOP> ListaReferenciaServiciosOP) {
        this.ListaReferenciaServiciosOP = ListaReferenciaServiciosOP;
    }
}
