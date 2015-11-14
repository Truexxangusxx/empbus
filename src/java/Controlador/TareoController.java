package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class TareoController extends ActionSupport {

    private Tareo Otareo = new Tareo();
    private DetalleTareo Odetalletareo = new DetalleTareo();
    private ArrayList<Tareo> ListaTareo = new ArrayList<Tareo>();
    private ArrayList<DetalleTareo> ListaDetalleTareo = new ArrayList<DetalleTareo>();
    private ArrayList<Sucursal> ListaSucursal = new ArrayList<Sucursal>();
    private int index = 0;
    private String msg = "";
    private Map session;
    private Boolean error = false;
    private Boolean Permiso = false;
    private String Operacion = "Edicion";

    public String Load() {
        try {
            setPermiso(true);
            if (Permiso) {
                setSession(ActionContext.getContext().getSession());

                ListaSucursal = SucursalDAO.getInstancia().buscar(new Sucursal());
                if (Operacion.equals("Nuevo")) {
                    Periodo periodo = new Periodo();
                    periodo.setActivo(false);
                    periodo = PeriodoDAO.getInstancia().buscar(periodo).get(0);
                    Otareo.setPeriodo(periodo.getMes() + " " + periodo.getAnio());
                    Date ahora = new Date();
                    SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                    Otareo.setTipoCambio(TipoCambioDAO.getInstancia().obtenerTipoCambioPorFecha(helper.getFechaValida(formateador.format(ahora)), MonedaDAO.getInstancia().obtenerLocal().getIdMoneda(), MonedaDAO.getInstancia().buscar(new Moneda(0, "Dolar")).get(0).getIdMoneda()).getValor());
                    Otareo.setFecha(formateador.format(ahora));
                } else {

                    if (Otareo.getIdTareo() == 0) {
                        Otareo.setIdTareo(TareoDAO.getInstancia().UltimoID());
                    }
                    Otareo = TareoDAO.getInstancia().obtener(Otareo.getIdTareo());
                    ListaDetalleTareo = TareoDAO.getInstancia().buscarDetalle(Otareo);
                    session.put("ListaDetalleTareo", ListaDetalleTareo);
                }


                return "Autorizado";
            } else {
                return "NoAutorizado";
            }
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
            return "NoAutorizado";
        }
    }

    public String GrabarTareo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (session.get("ListaDetalleTareo") != null) {
                setListaDetalleTareo((ArrayList<DetalleTareo>) session.get("ListaDetalleTareo"));
            }

            double total = 0.00;
            String xml = "<root>";
            for (int i = 0; i < ListaDetalleTareo.size(); i++) {
                xml = xml + ListaDetalleTareo.get(i).xml();
                total = total + ListaDetalleTareo.get(i).getHoras();
            }
            xml = xml + "</root>";

            Otareo.setTotalHoras(total);
            Otareo.setFecha(helper.getFechaValida(Otareo.getFecha()));

            if (Operacion.equals("Nuevo")) {
                int id = TareoDAO.getInstancia().ingresar(getOtareo(), ((Usuario) session.get("Usuario")).getNick(), xml);
                Otareo.setIdTareo(id);
                msg = "Se registro correctamente";
            } else {
                TareoDAO.getInstancia().editar(Otareo, ((Usuario) session.get("Usuario")).getNick(), xml);
                msg = "Se edito correctamente";
            }

            session.remove("ListaDetalleTareo");

        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ObtenerTareo() throws Exception {
        try {
            setOtareo(TareoDAO.getInstancia().obtener(getOtareo().getIdTareo()));
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarTareo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            msg = "Se Edito correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarTareo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            TareoDAO.getInstancia().eliminar(getOtareo(), ((Usuario) session.get("Usuario")));
            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarTareo() throws Exception {
        try {
            setListaTareo(TareoDAO.getInstancia().buscar(getOtareo()));
            msg = "Busqueda correcta";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String AgregarDetalleTareo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (session.get("ListaDetalleTareo") != null) {
                setListaDetalleTareo((ArrayList<DetalleTareo>) session.get("ListaDetalleTareo"));
            }
            double horas = 0;
            int minutosinicio = minutos(Odetalletareo.getHoraInicio());
            int minutosfin = minutos(Odetalletareo.getHoraFin());
            horas = horas(minutosfin-minutosinicio);
            
            Odetalletareo.setHoras(horas);
            
            ListaDetalleTareo.add(Odetalletareo);

            session.put("ListaDetalleTareo", ListaDetalleTareo);

            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String QuitarDetalleTareo() throws Exception {
        try {
            session = ActionContext.getContext().getSession();

            if (session.get("ListaDetalleTareo") != null) {
                setListaDetalleTareo((ArrayList<DetalleTareo>) session.get("ListaDetalleTareo"));
            }

            ListaDetalleTareo.remove(index);

            session.put("ListaDetalleTareo", ListaDetalleTareo);

            msg = "Se Elimino correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Tareo> getListaTareo() {
        return ListaTareo;
    }

    public void setListaTareo(ArrayList<Tareo> ListaTareo) {
        this.ListaTareo = ListaTareo;
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
        return Permiso;
    }

    public void setPermiso(Boolean Permiso) {
        this.Permiso = Permiso;
    }

    public Tareo getOtareo() {
        return Otareo;
    }

    public void setOtareo(Tareo Otareo) {
        this.Otareo = Otareo;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public ArrayList<DetalleTareo> getListaDetalleTareo() {
        return ListaDetalleTareo;
    }

    public void setListaDetalleTareo(ArrayList<DetalleTareo> ListaDetalleTareo) {
        this.ListaDetalleTareo = ListaDetalleTareo;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public DetalleTareo getOdetalletareo() {
        return Odetalletareo;
    }

    public void setOdetalletareo(DetalleTareo Odetalletareo) {
        this.Odetalletareo = Odetalletareo;
    }

    public ArrayList<Sucursal> getListaSucursal() {
        return ListaSucursal;
    }

    public void setListaSucursal(ArrayList<Sucursal> ListaSucursal) {
        this.ListaSucursal = ListaSucursal;
    }

    public int minutos(double hora) {
        int minutos = 0;
        int indice = 0;
        String horas = String.valueOf(hora);
        for (int i = 0; i < horas.length(); i++){
            if (horas.charAt(i)=='.' || horas.charAt(i)==','){
                indice = i;
            }
        }
                
        minutos = minutos + Integer.parseInt(horas.substring(0,indice)) * 60;
        minutos = minutos + Integer.parseInt(horas.substring(indice+1));

        return minutos;
    }
    
    public double horas(int minutos) {
        double horas = 0;
        String hora="";
        String minuto = "";
        
        
        hora = String.valueOf(minutos/60);
        
        
        minuto = String.valueOf(minutos%60);
        horas = Double.parseDouble(hora + "." + minuto);
        
        return horas;
    }
}
