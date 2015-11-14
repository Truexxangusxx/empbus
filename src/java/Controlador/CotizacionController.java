package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import reportes.Reporte;

public class CotizacionController extends ActionSupport {

    private Cotizacion Ocotizacion = new Cotizacion();
    private ArrayList<Cotizacion> ListaCotizacion = new ArrayList<Cotizacion>();
    private String msg = "";
    private Boolean permiso = false;
    private Boolean error = false;
    private Map session;
    private ArrayList<Producto> ListaProducto = new ArrayList<Producto>();
    private ArrayList<ClienteProveedor> ListaClienteProveedor = new ArrayList<ClienteProveedor>();
    private ArrayList<ModeloChasis> ListaModeloChasis = new ArrayList<ModeloChasis>();
    private ArrayList<CotizacionProducto> ListaCotizacionProducto = new ArrayList<CotizacionProducto>();
    private CotizacionProducto Ocotizacionproducto = new CotizacionProducto();
    private int indice = 0;
    private InputStream reportepdf;
    private NumeroSerie Onumeroserie = new NumeroSerie();
    private String numserie = "";
    private ArrayList<CotizacionCaracteristicas> ListaCotizacionCaracteristicas = new ArrayList<CotizacionCaracteristicas>();
    private CotizacionCaracteristicas Ocotizacioncaracteristicas = new CotizacionCaracteristicas();
    private String variable = "";
    private String Operacion = "Edicion";
    private ArrayList<String> ListaTipoCarroceria = new ArrayList<String>();
    private ArrayList<String> ListaModeloVentanas = new ArrayList<String>();
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;

            ListaTipoCarroceria.add("Costero");
            ListaTipoCarroceria.add("Urbano");
            ListaTipoCarroceria.add("Transporte Personal");
            ListaTipoCarroceria.add("Andino");

            ListaModeloVentanas.add("Estandar");
            ListaModeloVentanas.add("Pegado");
            
            CentroCosto centro = new CentroCosto();
            setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(centro));

            if (permiso) {
                if (Operacion.equals("Edicion")) {
                    ClienteProveedor cliente = new ClienteProveedor();
                    cliente.setRuc("");
                    cliente.setRazonSocial("");
                    cliente.setIdClienteProveedor(0);
                    setListaClienteProveedor(ClienteProveedorDAO.getInstancia().buscar(cliente));
                    ModeloChasis modelo = new ModeloChasis();
                    modelo.setDescripcion("");
                    setListaModeloChasis(ModeloChasisDAO.getInstancia().buscar(modelo));
                    Producto pro = new Producto();
                    pro.setIdTipoProducto(0);
                    pro.setDescripcion("");
                    setListaProducto(ProductoDAO.getInstancia().buscar(pro));
                    ListaProducto.add(0, pro);                    
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
                    Ocotizacion.setFecha(formateador.format(ahora));

                    if (Ocotizacion.getIdCotizacion() == 0) {
                        Ocotizacion.setIdCotizacion(CotizacionDAO.getInstancia().id());
                    }
                    setOcotizacion(CotizacionDAO.getInstancia().obtener(Ocotizacion.getIdCotizacion()));
                    pro = ProductoDAO.getInstancia().obtener(Ocotizacion.getProducto().getIdProducto());
                    Ocotizacion.getProducto().setPrecio(pro.getPrecio());
                    setListaCotizacionProducto(CotizacionDAO.getInstancia().obtenerCotizacionProducto(Ocotizacion));
                    setListaCotizacionCaracteristicas(CotizacionDAO.getInstancia().obtenerCotizacionCaracteristicas(Ocotizacion));
                    session.put("ListaCotizacionCaracteristicas", ListaCotizacionCaracteristicas);
                    session.put("ListaCotizacionProducto", ListaCotizacionProducto);
                } else {
                    if (Operacion.equals("Nuevo")) {
                        ClienteProveedor cliente = new ClienteProveedor();
                        cliente.setRuc("");
                        cliente.setRazonSocial("");
                        cliente.setIdClienteProveedor(0);
                        setListaClienteProveedor(ClienteProveedorDAO.getInstancia().buscar(cliente));
                        ModeloChasis modelo = new ModeloChasis();
                        modelo.setDescripcion("");
                        setListaModeloChasis(ModeloChasisDAO.getInstancia().buscar(modelo));
                        Producto pro = new Producto();
                        pro.setIdTipoProducto(0);
                        pro.setDescripcion("");
                        setListaProducto(ProductoDAO.getInstancia().buscar(pro));
                        ListaProducto.add(0, pro);                        
                        Date ahora = new Date();
                        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
                        Ocotizacion.setFecha(formateador.format(ahora));
                        setListaCotizacionCaracteristicas(CaracteristicaDAO.getInstancia().listar());
                        session.put("ListaCotizacionCaracteristicas", ListaCotizacionCaracteristicas);
                        session.remove("ListaCotizacionProducto");
                    }
                }
                return "Autorizado";
            } else {
                return "Autorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarCotizacion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

                if (session.get("ListaCotizacionProducto") != null) {
                    setListaCotizacionProducto((ArrayList<CotizacionProducto>) session.get("ListaCotizacionProducto"));
                }

                String xml = "<root>";
                double total = 0;
                for (int i = 0; i < ListaCotizacionProducto.size(); i++) {
                    xml = xml + ListaCotizacionProducto.get(i).xml((Usuario) session.get("Usuario"));

                    if (ListaCotizacionProducto.get(i).getSubTotal() == null) {
                        ListaCotizacionProducto.get(i).setSubTotal(0.0);
                    }
                    //total = total + ListaCotizacionProducto.get(i).getSubTotal();
                }
                xml = xml + "</root>";

                if (session.get("ListaCotizacionCaracteristicas") != null) {
                    setListaCotizacionCaracteristicas((ArrayList<CotizacionCaracteristicas>) session.get("ListaCotizacionCaracteristicas"));
                }
                String xmlCaracteristicas = "<root>";
                for (int i = 0; i < ListaCotizacionCaracteristicas.size(); i++) {
                    xmlCaracteristicas = xmlCaracteristicas + ListaCotizacionCaracteristicas.get(i).xml();
                }
                xmlCaracteristicas = xmlCaracteristicas + "</root>";

                //Ocotizacion.setMonto(total);

                if (Operacion.equals("Edicion")) {
                    CotizacionDAO.getInstancia().editar(Ocotizacion, ((Usuario) session.get("Usuario")).getNick(), xml, xmlCaracteristicas);
                    msg = "Se edito correctamente";
                } else {
                    Ocotizacion.setIdCotizacion(CotizacionDAO.getInstancia().ingresar(Ocotizacion, ((Usuario) session.get("Usuario")).getNick(), xml, xmlCaracteristicas));
                    msg = "Se registro correctamente";
                }

                error = false;
                session.remove("ListaCotizacionProducto");
                setListaCotizacionProducto(new ArrayList<CotizacionProducto>());
                
            } else {
                msg = "No cuenta con los permisos necesarios";
            }

        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerCotizacion() throws Exception {
        try {
            Ocotizacion = CotizacionDAO.getInstancia().obtener(Ocotizacion.getIdCotizacion());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarCotizacion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            //CotizacionDAO.getInstancia().editar(Ocotizacion, ((Usuario) session.get("Usuario")).getNick());
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarCotizacion() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                session = ActionContext.getContext().getSession();
                CotizacionDAO.getInstancia().eliminar(Ocotizacion, ((Usuario) session.get("Usuario")).getNick());
                msg = "Se Elimino correctamente";
            } else {
                error = true;
                msg = "No cuenta con permisos para esta accion";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarCotizacionProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaCotizacionProducto") != null) {
                setListaCotizacionProducto((ArrayList<CotizacionProducto>) session.get("ListaCotizacionProducto"));
            }
            Producto pro = new Producto();
            pro = ProductoDAO.getInstancia().obtener(Ocotizacionproducto.getIdProducto());
            Ocotizacionproducto.setCodigoProducto(pro.getCodigo());
            Ocotizacionproducto.setPrecio(pro.getPrecio());
            Ocotizacionproducto.setSubTotal(Ocotizacionproducto.getCantidad() * Ocotizacionproducto.getPrecio());

            ListaCotizacionProducto.add(Ocotizacionproducto);
            for (int i = 0; i < ListaCotizacionProducto.size(); i++) {
                if (ListaCotizacionProducto.get(i).getSubTotal() == null) {
                    ListaCotizacionProducto.get(i).setSubTotal(0.0);
                }
                Ocotizacion.setMonto(Ocotizacion.getMonto() + ListaCotizacionProducto.get(i).getSubTotal());
            }
            session.put("ListaCotizacionProducto", ListaCotizacionProducto);
            setListaCotizacionProducto(ListaCotizacionProducto);
            msg = "Se agrego correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String RemoverCotizacionProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaCotizacionProducto") != null) {
                setListaCotizacionProducto((ArrayList<CotizacionProducto>) session.get("ListaCotizacionProducto"));
            }
            ListaCotizacionProducto.remove(indice);
            for (int i = 0; i < ListaCotizacionProducto.size(); i++) {
                if (ListaCotizacionProducto.get(i).getSubTotal() == null) {
                    ListaCotizacionProducto.get(i).setSubTotal(0.0);
                }
                Ocotizacion.setMonto(Ocotizacion.getMonto() + ListaCotizacionProducto.get(i).getSubTotal());
            }
            session.put("ListaCotizacionProducto", ListaCotizacionProducto);
            setListaCotizacionProducto(ListaCotizacionProducto);
            msg = "Se removio correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String CotizacionBuscar() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                ClienteProveedor cliente = new ClienteProveedor();
                cliente.setRuc("");
                cliente.setRazonSocial("");
                cliente.setIdClienteProveedor(0);
                setListaClienteProveedor(ClienteProveedorDAO.getInstancia().buscar(cliente));
                ListaClienteProveedor.add(0, cliente);
                Cotizacion cotizacion = new Cotizacion();
                cotizacion.setIdClienteProveedor(0);
                cotizacion.setSerie("");
                setListaCotizacion(CotizacionDAO.getInstancia().buscar(cotizacion));
                return "Autorizado";
            } else {
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String BuscarCotizacion() throws Exception {
        try {
            Ocotizacion.setSerie(helper.getSerieValida(Ocotizacion.getSerie()));
            setListaCotizacion(CotizacionDAO.getInstancia().buscar(Ocotizacion));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ImprimirCotizacion() throws Exception {
        try {
          String[] nombres = new String[]{"idCotizacion"};
            Object[] valores = new Object[]{Ocotizacion.getIdCotizacion()};

            byte[] datos = Reporte.Cotizacion(nombres, valores).exportarPDFBytes();
            Reporte.Cotizacion(nombres, valores).exportarPDFBytes();
            setReportepdf(new ByteArrayInputStream(datos));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ValidarEditarCotizacion() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                return EnviarEditarCotizacion();
            } else {
                msg = "No cuenta con permisos para esta accion";
                return SUCCESS;
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return SUCCESS;
        }
    }

    public String EnviarEditarCotizacion() throws Exception {
        try {
            permiso = true;
            if (permiso) {
                return ImprimirCotizacion();
            } else {
                msg = "No cuenta con permisos para esta accion";
                return SUCCESS;
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            return SUCCESS;
        }
    }

    public String EnviarListaCotizacionCaracteristicas() {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaCotizacionCaracteristicas") != null) {
                setListaCotizacionCaracteristicas((ArrayList<CotizacionCaracteristicas>) session.get("ListaCotizacionCaracteristicas"));
            }
            int idcaracteristica = 0;
            for (int i = 0; i < ListaCotizacionCaracteristicas.size(); i++) {
                if (i == indice) {
                    if (variable.equals("Estado")) {
                        ListaCotizacionCaracteristicas.get(indice).setEstado(Ocotizacioncaracteristicas.getEstado());
                    }
                    if (variable.equals("Valor")) {
                        ListaCotizacionCaracteristicas.get(indice).setValor(Ocotizacioncaracteristicas.getValor());
                    }
                    idcaracteristica = ListaCotizacionCaracteristicas.get(indice).getIdCaracteristicas();
                }
            }
            
            for (int i = 0; i < ListaCotizacionCaracteristicas.size(); i++) {
                if (i != indice && ListaCotizacionCaracteristicas.get(i).getIdCaracteristicas() == idcaracteristica)
                {
                    ListaCotizacionCaracteristicas.get(i).setEstado(false);
                }
            }

            session = ActionContext.getContext().getSession();
            session.put("ListaCotizacionCaracteristicas", ListaCotizacionCaracteristicas);
            msg = "Editado";

        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }

    public String AprobarCotizacion() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                CotizacionDAO.getInstancia().aprobar(Ocotizacion, ((Usuario) session.get("Usuario")).getNick());
                msg = "Cotizacion aprobada correctamente";
            } else {
                msg = "No cuenta con los permisos necesarios";
                error = true;
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }

    public Cotizacion getOcotizacion() {
        return Ocotizacion;
    }

    public void setOcotizacion(Cotizacion Ocotizacion) {
        this.Ocotizacion = Ocotizacion;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Cotizacion> getListaCotizacion() {
        return ListaCotizacion;
    }

    public void setListaCotizacion(ArrayList<Cotizacion> ListaCotizacion) {
        this.ListaCotizacion = ListaCotizacion;
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

    /**
     * @return the ListaProducto
     */
    public ArrayList<Producto> getListaProducto() {
        return ListaProducto;
    }

    /**
     * @param ListaProducto the ListaProducto to set
     */
    public void setListaProducto(ArrayList<Producto> ListaProducto) {
        this.ListaProducto = ListaProducto;
    }

    /**
     * @return the ListaClienteProveedor
     */
    public ArrayList<ClienteProveedor> getListaClienteProveedor() {
        return ListaClienteProveedor;
    }

    /**
     * @param ListaClienteProveedor the ListaClienteProveedor to set
     */
    public void setListaClienteProveedor(ArrayList<ClienteProveedor> ListaClienteProveedor) {
        this.ListaClienteProveedor = ListaClienteProveedor;
    }

    /**
     * @return the ListaModeloChasis
     */
    public ArrayList<ModeloChasis> getListaModeloChasis() {
        return ListaModeloChasis;
    }

    /**
     * @param ListaModeloChasis the ListaModeloChasis to set
     */
    public void setListaModeloChasis(ArrayList<ModeloChasis> ListaModeloChasis) {
        this.ListaModeloChasis = ListaModeloChasis;
    }

    /**
     * @return the ListaCotizacionProducto
     */
    public ArrayList<CotizacionProducto> getListaCotizacionProducto() {
        return ListaCotizacionProducto;
    }

    /**
     * @param ListaCotizacionProducto the ListaCotizacionProducto to set
     */
    public void setListaCotizacionProducto(ArrayList<CotizacionProducto> ListaCotizacionProducto) {
        this.ListaCotizacionProducto = ListaCotizacionProducto;
    }

    /**
     * @return the Ocotizacionproducto
     */
    public CotizacionProducto getOcotizacionproducto() {
        return Ocotizacionproducto;
    }

    /**
     * @param Ocotizacionproducto the Ocotizacionproducto to set
     */
    public void setOcotizacionproducto(CotizacionProducto Ocotizacionproducto) {
        this.Ocotizacionproducto = Ocotizacionproducto;
    }

    /**
     * @return the indice
     */
    public int getIndice() {
        return indice;
    }

    /**
     * @param indice the indice to set
     */
    public void setIndice(int indice) {
        this.indice = indice;
    }

    /**
     * @return the reportepdf
     */
    public InputStream getReportepdf() {
        return reportepdf;
    }

    /**
     * @param reportepdf the reportepdf to set
     */
    public void setReportepdf(InputStream reportepdf) {
        this.reportepdf = reportepdf;
    }

    public NumeroSerie getOnumeroserie() {
        return Onumeroserie;
    }

    public void setOnumeroserie(NumeroSerie Onumeroserie) {
        this.Onumeroserie = Onumeroserie;
    }

    public String getNumserie() {
        return numserie;
    }

    public void setNumserie(String numserie) {
        this.numserie = numserie;
    }

    public ArrayList<CotizacionCaracteristicas> getListaCotizacionCaracteristicas() {
        return ListaCotizacionCaracteristicas;
    }

    public void setListaCotizacionCaracteristicas(ArrayList<CotizacionCaracteristicas> ListaCotizacionCaracteristicas) {
        this.ListaCotizacionCaracteristicas = ListaCotizacionCaracteristicas;
    }

    public CotizacionCaracteristicas getOcotizacioncaracteristicas() {
        return Ocotizacioncaracteristicas;
    }

    public void setOcotizacioncaracteristicas(CotizacionCaracteristicas Ocotizacioncaracteristicas) {
        this.Ocotizacioncaracteristicas = Ocotizacioncaracteristicas;
    }

    public String getVariable() {
        return variable;
    }

    public void setVariable(String variable) {
        this.variable = variable;
    }

    public ArrayList<String> getListaTipoCarroceria() {
        return ListaTipoCarroceria;
    }

    public void setListaTipoCarroceria(ArrayList<String> ListaTipoCarroceria) {
        this.ListaTipoCarroceria = ListaTipoCarroceria;
    }

    public ArrayList<String> getListaModeloVentanas() {
        return ListaModeloVentanas;
    }

    public void setListaModeloVentanas(ArrayList<String> ListaModeloVentanas) {
        this.ListaModeloVentanas = ListaModeloVentanas;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public ArrayList<CentroCosto> getListaCentroCosto() {
        return ListaCentroCosto;
    }

    public void setListaCentroCosto(ArrayList<CentroCosto> ListaCentroCosto) {
        this.ListaCentroCosto = ListaCentroCosto;
    }
}
