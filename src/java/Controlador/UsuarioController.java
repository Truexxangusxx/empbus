package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

public class UsuarioController extends ActionSupport {

    private Usuario Ousuario = new Usuario();
    private ArrayList<Usuario> ListaUsuario = new ArrayList<Usuario>();
    private String msg = "";
    private Map session;
    private Boolean error = false;

    public String Load() throws Exception {
        try {
            Ousuario.setNick("");
            setListaUsuario(UsuarioDAO.getInstancia().BuscarUsuario(Ousuario));
            msg = "";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String BuscarUsuario() throws Exception {
        try {
            setListaUsuario(UsuarioDAO.getInstancia().BuscarUsuario(Ousuario));
            msg = "Consulta Correcta";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String GrabarUsuario() throws Exception {
        try {
            UsuarioDAO.getInstancia().ingresar(Ousuario);
            Ousuario.setNick("");
            setListaUsuario(UsuarioDAO.getInstancia().BuscarUsuario(Ousuario));
            msg = "Se registro correctamente";
        } catch (Exception ex) {
            msg = ex.getMessage();
            setError(true);
        }
        return SUCCESS;
    }

    public String ObtenerUsuario() throws Exception {
        try {
            Ousuario = UsuarioDAO.getInstancia().obtener(Ousuario.getIdUsuario());
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EditarUsuario() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            if (PermisoDAO.getInstancia().ObtenerPermiso((Usuario) session.get("Usuario"), "Editar Usuario") || PermisoDAO.getInstancia().ObtenerPermiso((Usuario) session.get("Usuario"), "Administrar")){
                UsuarioDAO.getInstancia().editar(Ousuario);
                msg = "Se Edito correctamente";
            } else {
                error = true;
                msg = "No cuenta con permisos para esta operacion";
            }
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String EliminarUsuario() throws Exception {
        try {
            UsuarioDAO.getInstancia().eliminar(Ousuario);
            msg = "Se Elimino correctamente";
            error = false;
        } catch (Exception ex) {
            error = true;
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public String ValidarUsuario() throws Exception {
        try {
            Ousuario = UsuarioDAO.getInstancia().Validar(Ousuario);
            if (Ousuario.getIdUsuario() != 0) {
                session = ActionContext.getContext().getSession();
                session.put("Usuario", Ousuario);
                
                Periodo periodo = new Periodo();
                periodo.setActivo(false);
                periodo = PeriodoDAO.getInstancia().buscar(periodo).get(0);
                double igv = IGVDAO.getInstancia().obtener().getValor();
                
                int monedalocal=MonedaDAO.getInstancia().obtenerLocal().getIdMoneda();
                ArrayList<TipoCambio> lista= new ArrayList<TipoCambio>();
                TipoCambio tc = new TipoCambio();
                Date ahora = new Date();
                SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
                tc.setFecha(formateador.format(ahora));
                tc.setIdMonedaPago(monedalocal);
                tc.setIdMonedaCobra(0);
                lista = TipoCambioDAO.getInstancia().buscar(tc);
                String mensajemoneda="";
                for (int i = 0; i < lista.size(); i++)
                {
                        mensajemoneda = mensajemoneda + lista.get(i).getDMonedaCobra() +": "+lista.get(i).getValor()+"; ";
                }
                
                session.put("ValoresGlobales", "Periodo: "+periodo.getMes() + " " + periodo.getAnio()+"; IGV: "+igv+"%; "+mensajemoneda);
                
                msg = "Bienvenido " + Ousuario.getNombre();
            } else {
                msg = "Nick o Contraseña incorrecta";
            }
            error = false;
        } catch (Exception ex) {
            msg = ex.getMessage();
            error = true;
        }
        return SUCCESS;
    }

    public String SalirUsuario() throws Exception {
        try {
            session = ActionContext.getContext().getSession();
            session.remove("Usuario");
            msg = "Hasta Pronto";
        } catch (Exception ex) {
            msg = ex.getMessage();
        }
        return SUCCESS;
    }

    public Usuario getOusuario() {
        return Ousuario;
    }

    public void setOusuario(Usuario Ousuario) {
        this.Ousuario = Ousuario;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ArrayList<Usuario> getListaUsuario() {
        return ListaUsuario;
    }

    public void setListaUsuario(ArrayList<Usuario> ListaUsuario) {
        this.ListaUsuario = ListaUsuario;
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
}
