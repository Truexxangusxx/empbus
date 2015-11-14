package Modelo;

public class Tareo {

    private int idTareo;
    private String Periodo;
    private String Numero;
    private String Fecha;
    private double TipoCambio;
    private Sucursal Sucursal;
    private Empleado Empleado;
    private String Observaciones;
    private double TotalHoras;

    public int getIdTareo() {
        return idTareo;
    }

    public void setIdTareo(int idTareo) {
        this.idTareo = idTareo;
    }

    public String getPeriodo() {
        return Periodo;
    }

    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public double getTipoCambio() {
        return TipoCambio;
    }

    public void setTipoCambio(double TipoCambio) {
        this.TipoCambio = TipoCambio;
    }

    public Sucursal getSucursal() {
        return Sucursal;
    }

    public void setSucursal(Sucursal Sucursal) {
        this.Sucursal = Sucursal;
    }

    public Empleado getEmpleado() {
        return Empleado;
    }

    public void setEmpleado(Empleado Empleado) {
        this.Empleado = Empleado;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }

    public double getTotalHoras() {
        return TotalHoras;
    }

    public void setTotalHoras(double TotalHoras) {
        this.TotalHoras = TotalHoras;
    }
    
    public Tareo(){
        this.Empleado = new Empleado();
        this.Fecha = "";
        this.Numero = "";
        this.Observaciones = "";
        this.Periodo = "";
        this.Sucursal = new Sucursal();
        this.TipoCambio = 0.0;
        this.TotalHoras = 0.0;
        this.idTareo = 0;
    }
}
