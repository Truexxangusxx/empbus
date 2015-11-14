package Modelo;

public class Pedido {

    private int IdPedido;

    public int getIdPedido() {
        return IdPedido;
    }

    public void setIdPedido(int IdPedido) {
        this.IdPedido = IdPedido;
    }
    private int IdCentroCosto;

    public int getIdCentroCosto() {
        return IdCentroCosto;
    }

    public void setIdCentroCosto(int IdCentroCosto) {
        this.IdCentroCosto = IdCentroCosto;
    }
    private int IdOrdenProduccion;

    public int getIdOrdenProduccion() {
        return IdOrdenProduccion;
    }

    public void setIdOrdenProduccion(int IdOrdenProduccion) {
        this.IdOrdenProduccion = IdOrdenProduccion;
    }
    private int IdEmpleado;

    public int getIdEmpleado() {
        return IdEmpleado;
    }

    public void setIdEmpleado(int IdEmpleado) {
        this.IdEmpleado = IdEmpleado;
    }
    private String Estado;

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    private String DCentroCosto;
    private String DOrdenProduccion;
    private String DEmpleado;
    private String Fecha;
    private String Numero;
    private String Observaciones;

    public String getDCentroCosto() {
        return DCentroCosto;
    }

    public void setDCentroCosto(String DCentroCosto) {
        this.DCentroCosto = DCentroCosto;
    }

    public String getDOrdenProduccion() {
        return DOrdenProduccion;
    }

    public void setDOrdenProduccion(String DOrdenProduccion) {
        this.DOrdenProduccion = DOrdenProduccion;
    }

    public String getDEmpleado() {
        return DEmpleado;
    }

    public void setDEmpleado(String DEmpleado) {
        this.DEmpleado = DEmpleado;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }
    
    public String tabla() {
        return "<table>"
                + "<tr>"
                + "<td>Pedido:</td>"
                + "<td>"+Numero+"</td>"
                + "</tr>"
                + "<tr>"
                + "<td>Fecha:</td>"
                + "<td>"+Fecha+"</td>"
                + "</tr>"
                + "<tr>"
                + "<td>Orden Produccion:</td>"
                + "<td>"+DOrdenProduccion+"</td>"
                + "</tr>"
                + "<tr>"
                + "<td>Centro de Costo:</td>"
                + "<td>"+DCentroCosto+"</td>"
                + "</tr>"
                + "<tr>"
                + "<td>Encargado:</td>"
                + "<td>"+DEmpleado+"</td>"
                + "</tr>"
                + "</table><br/>";
    }
    
}
