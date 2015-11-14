package Modelo;

public class Aporte {

    private int idAporte;

    public int getIdAporte() {
        return idAporte;
    }

    public void setIdAporte(int idAporte) {
        this.idAporte = idAporte;
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
        return "<Aporte idAporte= '" + getIdAporte() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' Valor= '" + getValor() + "' />";
    }
    
    public Aporte(){
        this.Descripcion="";
        this.idAporte=0;
    }
}
