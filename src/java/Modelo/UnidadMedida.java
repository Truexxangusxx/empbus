package Modelo;

public class UnidadMedida {

    private int idUnidadMedida;
    private String Descripcion;
    private String Simbolo;

    public int getIdUnidadMedida() {
        return idUnidadMedida;
    }

    public void setIdUnidadMedida(int idUnidadMedida) {
        this.idUnidadMedida = idUnidadMedida;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getSimbolo() {
        return Simbolo;
    }

    public void setSimbolo(String Simbolo) {
        this.Simbolo = Simbolo;
    }
}
