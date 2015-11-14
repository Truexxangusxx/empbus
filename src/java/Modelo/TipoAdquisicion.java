package Modelo;

public class TipoAdquisicion {

    private int idTipoAdquisicion;

    public int getIdTipoAdquisicion() {
        return idTipoAdquisicion;
    }

    public void setIdTipoAdquisicion(int idTipoAdquisicion) {
        this.idTipoAdquisicion = idTipoAdquisicion;
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
        return "<TipoAdquisicion idTipoAdquisicion= '" + getIdTipoAdquisicion() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' />";
    }
    
    public TipoAdquisicion(){
        this.Descripcion = "";
        this.idTipoAdquisicion = 0;
    }

    
}