package Modelo;

public class Tasa {

    private int idTasa;

    public int getIdTasa() {
        return idTasa;
    }

    public void setIdTasa(int idTasa) {
        this.idTasa = idTasa;
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
        return "<Tasa idTasa= '" + getIdTasa() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' Valor= '" + getValor() + "' />";
    }
    
    public Tasa(){
        this.idTasa = 0;
        this.Descripcion = "";
    }
}
