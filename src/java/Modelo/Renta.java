package Modelo;

public class Renta {

    private int idRenta;

    public int getIdRenta() {
        return idRenta;
    }

    public void setIdRenta(int idRenta) {
        this.idRenta = idRenta;
    }
    private String Descripcion;

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    private double Valor;
    
    public String xml() {
        return "<Renta idRenta= '" + getIdRenta() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' />";
    }
    
    public Renta(){
        this.Descripcion="";
        this.idRenta=0;
    }

    public double getValor() {
        return Valor;
    }

    public void setValor(double Valor) {
        this.Valor = Valor;
    }
}
