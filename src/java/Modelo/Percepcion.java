package Modelo;

public class Percepcion {

    private int idPercepcion;

    public int getIdPercepcion() {
        return idPercepcion;
    }

    public void setIdPercepcion(int idPercepcion) {
        this.idPercepcion = idPercepcion;
    }
    private String Descripcion;

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    private double Valor;

    public double getValor() {
        return Valor;
    }

    public void setValor(double Valor) {
        this.Valor = Valor;
    }

    public String xml() {
        return "<Percepcion idPercepcion= '" + getIdPercepcion() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' Valor= '" + getValor() + "' />";
    }
    
    public Percepcion(){
        this.Descripcion = "";
        this.idPercepcion = 0;
    }
}
