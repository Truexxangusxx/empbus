package Modelo;

public class Moneda {

    private int idMoneda;
    private String Descripcion;
    private String DescripcionCorta;
    private String Simbolo;

    public int getIdMoneda() {
        return idMoneda;
    }

    public void setIdMoneda(int idMoneda) {
        this.idMoneda = idMoneda;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getDescripcionCorta() {
        return DescripcionCorta;
    }

    public void setDescripcionCorta(String DescripcionCorta) {
        this.DescripcionCorta = DescripcionCorta;
    }

    public String getSimbolo() {
        return Simbolo;
    }

    public void setSimbolo(String Simbolo) {
        this.Simbolo = Simbolo;
    }

    public Moneda() {
        this.Descripcion = "";
        this.idMoneda = 0;
    }

    public Moneda(int id, String descripcion) {
        this.Descripcion = descripcion;
        this.idMoneda = id;
    }
}
