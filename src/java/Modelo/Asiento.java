package Modelo;

import java.text.ParseException;

public class Asiento {
    private int idAsiento;
    private String Periodo;
    private Subdiario Subdiario;
    private String Fecha; 
    private Sucursal Sucursal;
    private Moneda Moneda;
    private double TipoCambio;
    private String Glosa;
    private String Numero;

    
    public String getPeriodo() {
        return Periodo;
    }

    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }

    public Subdiario getSubdiario() {
        return Subdiario;
    }

    public void setSubdiario(Subdiario Subdiario) {
        this.Subdiario = Subdiario;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) throws ParseException {
        this.Fecha = Fecha;
    }

    public Sucursal getSucursal() {
        return Sucursal;
    }

    public void setSucursal(Sucursal Sucursal) {
        this.Sucursal = Sucursal;
    }

    public Moneda getMoneda() {
        return Moneda;
    }

    public void setMoneda(Moneda Moneda) {
        this.Moneda = Moneda;
    }

    public double getTipoCambio() {
        return TipoCambio;
    }

    public void setTipoCambio(double TipoCambio) {
        this.TipoCambio = TipoCambio;
    }

    public String getGlosa() {
        return Glosa;
    }

    public void setGlosa(String Glosa) {
        this.Glosa = Glosa;
    }
    
    public Asiento(){
        this.idAsiento=0;
        this.Glosa="";
        this.Moneda = new Moneda();
        this.Periodo = "";
        this.Subdiario = new Subdiario();
        this.Sucursal = new Sucursal();
        this.TipoCambio = 0;
        this.Numero="";
    }

    public int getIdAsiento() {
        return idAsiento;
    }

    public void setIdAsiento(int idAsiento) {
        this.idAsiento = idAsiento;
    }

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }
    
}
