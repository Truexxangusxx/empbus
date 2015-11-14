package Controlador;

import Modelo.*;
import DAO.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;

public class OpcionController extends ActionSupport {

    private Modulo Omodulo = new Modulo();
    private Opcion Oopcion = new Opcion();
    private ArrayList<Opcion> ListaOpcion = new ArrayList<Opcion>();
    private String msg = "";

    public String BuscarOpcion() {
        try {
            setListaOpcion(OpcionDAO.getInstancia().BuscarOpcionPorModulo(Omodulo));
        } catch (Exception ex) {
        }
        return SUCCESS;
    }

    public Modulo getOmodulo() {
        return Omodulo;
    }

    public void setOmodulo(Modulo Omodulo) {
        this.Omodulo = Omodulo;
    }

    public Opcion getOopcion() {
        return Oopcion;
    }

    public void setOopcion(Opcion Oopcion) {
        this.Oopcion = Oopcion;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * @return the ListaOpcion
     */
    public ArrayList<Opcion> getListaOpcion() {
        return ListaOpcion;
    }

    /**
     * @param ListaOpcion the ListaOpcion to set
     */
    public void setListaOpcion(ArrayList<Opcion> ListaOpcion) {
        this.ListaOpcion = ListaOpcion;
    }
}
