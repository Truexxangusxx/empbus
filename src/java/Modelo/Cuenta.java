package Modelo;

public class Cuenta {

    private int IdCuenta;

    public int getIdCuenta() {
        return IdCuenta;
    }

    public void setIdCuenta(int IdCuenta) {
        this.IdCuenta = IdCuenta;
    }
    private String Descripcion;

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    private String Codigo;

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String xml() {
        return "<Cuenta IdCuenta= '" + getIdCuenta() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' Codigo= '" + helper.CadenaValidada(getCodigo()) + "' />";
    }
    
    public Cuenta(){this.Descripcion=""; this.IdCuenta=0; this.Codigo="";}
    public Cuenta(int id, String descripcion, String codigo){this.Descripcion=descripcion; this.IdCuenta=id; this.Codigo=codigo;}
}
