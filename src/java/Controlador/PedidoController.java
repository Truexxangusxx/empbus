package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class PedidoController extends ActionSupport {

    private Pedido Opedido = new Pedido();
    private ArrayList<Pedido> ListaPedido = new ArrayList<Pedido>();
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean permiso = false;
    private int index;
    private ArrayList<PedidoProducto> ListaPedidoProducto = new ArrayList<PedidoProducto>();
    private PedidoProducto Opedidoproducto = new PedidoProducto();
    private String Operacion = "Edicion";
    private ArrayList<CentroCosto> ListaCentroCosto = new ArrayList<CentroCosto>();
    private ArrayList<Estandar> ListaEstandar = new ArrayList<Estandar>();

    public String Load() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            session.remove("ListaPedidoProducto");
            setPermiso((Boolean) true);
            if (getPermiso()) {

                CentroCosto centro = new CentroCosto();
                setListaCentroCosto(CentroCostoDAO.getInstancia().buscar(centro));

                if (Operacion.equals("Edicion")) {
                    if (Opedido.getIdPedido() == 0) {
                        Opedido.setIdPedido(PedidoDAO.getInstancia().obtenerUltimo());
                    }
                    setOpedido(PedidoDAO.getInstancia().obtener(Opedido.getIdPedido()));
                    setListaPedidoProducto(PedidoDAO.getInstancia().buscardetalle(Opedido));
                    session.put("ListaPedidoProducto", ListaPedidoProducto);
                }

                if (Operacion.equals("Nuevo")) {
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                    Opedido.setFecha(formateador.format(ahora));
                    session.remove("ListaPedidoProducto");
                }

                msg = "Bienvenido";
                return "Autorizado";
            } else {
                msg = "No cuenta con los permisos necesarios";
                return "Autorizado";
            }

        } catch (Exception ex) {
            msg = ex.getMessage();
            return "Autorizado";
        }
    }

    public String GrabarPedido() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                if (session.get("ListaPedidoProducto") != null) {
                    setListaPedidoProducto((ArrayList<PedidoProducto>) session.get("ListaPedidoProducto"));
                }
                if (ListaPedidoProducto.isEmpty()) {
                    error = true;
                    msg = "Debe agregar al menos un item";
                } else {
                    String tabla = "<table border='1'><thead><th>Codigo</th><th>Producto</th><th>Cantidad</th><th>Glosa</th></thead><tbody>";
                    String xml = "<root>";
                    for (int i = 0; i < ListaPedidoProducto.size(); i++) {
                        xml = xml + ListaPedidoProducto.get(i).xml();
                        tabla = tabla + ListaPedidoProducto.get(i).tabla();
                    }
                    xml = xml + "</root>";
                    tabla = tabla + "</tbody></table>";
                    Opedido.setFecha(helper.getFechaValida(Opedido.getFecha()));

                    if (Operacion.equals("Edicion")) {
                        PedidoDAO.getInstancia().editar(Opedido, (Usuario) session.get("Usuario"), xml);
                        msg = "Se edito correctamente";
                    }
                    if (Operacion.equals("Nuevo")) {
                        Opedido.setIdPedido(PedidoDAO.getInstancia().ingresar(Opedido, (Usuario) session.get("Usuario"), xml));
                        setOpedido(PedidoDAO.getInstancia().obtener(Opedido.getIdPedido()));
                        msg = "Se registro correctamente";
                    }
                    helper hel = new helper();
                    String[] destinatarios = {"angus_acdc_w3@hotmail.com", "backinblack83@gmail.com"};
                    hel.SendMail("c.medina.carranza@gmail.com", destinatarios, "Pedido: " + Opedido.getNumero(), Opedido.tabla() + tabla);
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

    public String ObtenerPedido() throws Exception {
        try {
            Opedido = PedidoDAO.getInstancia().obtener(Opedido.getIdPedido());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarPedido() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {

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

    public String EliminarPedido() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            permiso = true;
            if (permiso) {
                PedidoDAO.getInstancia().eliminar(Opedido, (Usuario) session.get("Usuario"));
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

    public String BuscarPedido() throws Exception {
        try {
            setListaPedido(PedidoDAO.getInstancia().buscar(Opedido));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarPedidoProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaPedidoProducto") != null) {
                setListaPedidoProducto((ArrayList<PedidoProducto>) session.get("ListaPedidoProducto"));
            }
            if (session.get("ListaEstandar") != null) {
                setListaEstandar((ArrayList<Estandar>) session.get("ListaEstandar"));
            }
            for (int i = 0; i < ListaEstandar.size(); i++) {
                if (ListaEstandar.get(i).getIdProducto() == Opedidoproducto.getIdProducto()) {
                    Opedidoproducto.setEstandar(ListaEstandar.get(i).getCantidad());
                }
            }
            ListaPedidoProducto.add(Opedidoproducto);
            session.put("ListaPedidoProducto", ListaPedidoProducto);
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarPedidoProducto() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (session.get("ListaPedidoProducto") != null) {
                setListaPedidoProducto((ArrayList<PedidoProducto>) session.get("ListaPedidoProducto"));
            }
            ListaPedidoProducto.remove(index);
            session.put("ListaPedidoProducto", ListaPedidoProducto);
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Pedido getOpedido() {
        return Opedido;
    }

    public void setOpedido(Pedido Opedido) {
        this.Opedido = Opedido;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Pedido> getListaPedido() {
        return ListaPedido;
    }

    public void setListaPedido(ArrayList<Pedido> ListaPedido) {
        this.ListaPedido = ListaPedido;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }

    public Boolean getPermiso() {
        return permiso;
    }

    public void setPermiso(Boolean permiso) {
        this.permiso = permiso;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public ArrayList<PedidoProducto> getListaPedidoProducto() {
        return ListaPedidoProducto;
    }

    public void setListaPedidoProducto(ArrayList<PedidoProducto> ListaPedidoProducto) {
        this.ListaPedidoProducto = ListaPedidoProducto;
    }

    public PedidoProducto getOpedidoproducto() {
        return Opedidoproducto;
    }

    public void setOpedidoproducto(PedidoProducto Opedidoproducto) {
        this.Opedidoproducto = Opedidoproducto;
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

    public ArrayList<Estandar> getListaEstandar() {
        return ListaEstandar;
    }

    public void setListaEstandar(ArrayList<Estandar> ListaEstandar) {
        this.ListaEstandar = ListaEstandar;
    }
}
