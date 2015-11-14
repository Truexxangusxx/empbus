package Modelo;

public class TipoCambio {
private int idTipoCambio;
private int idMonedaPago;
private int idMonedaCobra;
private double Valor;
private String DMonedaPago;
private String DMonedaCobra;
private String Fecha;


    public int getIdTipoCambio() {
        return idTipoCambio;
    }

    public void setIdTipoCambio(int idTipoCambio) {
        this.idTipoCambio = idTipoCambio;
    }

    public int getIdMonedaPago() {
        return idMonedaPago;
    }

    public void setIdMonedaPago(int idMonedaPago) {
        this.idMonedaPago = idMonedaPago;
    }

    public int getIdMonedaCobra() {
        return idMonedaCobra;
    }

    public void setIdMonedaCobra(int idMonedaCobra) {
        this.idMonedaCobra = idMonedaCobra;
    }

    public String getDMonedaPago() {
        return DMonedaPago;
    }

    public void setDMonedaPago(String DMonedaPago) {
        this.DMonedaPago = DMonedaPago;
    }

    public String getDMonedaCobra() {
        return DMonedaCobra;
    }

    public void setDMonedaCobra(String DidMonedaCobra) {
        this.DMonedaCobra = DidMonedaCobra;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    
    public TipoCambio(){
        this.DMonedaPago = "";
        this.DMonedaCobra = "";
        this.Fecha = "";
        this.Valor = 0;
        this.idMonedaCobra = 0;
        this.idMonedaPago = 0;
        this.idTipoCambio = 0;
    }

    public double getValor() {
        return Valor;
    }

    public void setValor(double Valor) {
        this.Valor = Valor;
    }
}
