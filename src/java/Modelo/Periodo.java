package Modelo;

public class Periodo {

    private Boolean Activo;
    
    private int idPeriodo;

    public int getIdPeriodo() {
        return idPeriodo;
    }

    public void setIdPeriodo(int idPeriodo) {
        this.idPeriodo = idPeriodo;
    }
    private int Anio;

    public int getAnio() {
        return Anio;
    }

    public void setAnio(int Anio) {
        this.Anio = Anio;
    }
    private String Mes;

    public String getMes() {
        return Mes;
    }

    public void setMes(String Mes) {
        this.Mes = Mes;
    }

    public String xml() {
        return "<Periodo idPeriodo= '" + getIdPeriodo() + "' Anio= '" + getAnio() + "' Mes= '" + helper.CadenaValidada(getMes()) + "' />";
    }

    public Boolean getActivo() {
        return Activo;
    }

    public void setActivo(Boolean Activo) {
        this.Activo = Activo;
    }
}
