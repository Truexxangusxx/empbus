package Modelo;

import java.text.ParseException;

public class ListaPrecio {

    private int IdListaPrecio;

    public int getIdListaPrecio() {
        return IdListaPrecio;
    }

    public void setIdListaPrecio(int IdListaPrecio) {
        this.IdListaPrecio = IdListaPrecio;
    }
    private int IdProducto;

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    private double Precio;

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }
    private double TipoCambio;

    public double getTipoCambio() {
        return TipoCambio;
    }

    public void setTipoCambio(double TipoCambio) {
        this.TipoCambio = TipoCambio;
    }
    private String Fecha;

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    private boolean Estado;

    public boolean getEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }
    
    private String DProducto;

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }
    
}
