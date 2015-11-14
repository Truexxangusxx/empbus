package Modelo;

public class Familia {

    private int IdFamilia;

    public int getIdFamilia() {
        return IdFamilia;
    }

    public void setIdFamilia(int IdFamilia) {
        this.IdFamilia = IdFamilia;
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

    private int IdCuenta;
        
    public Familia() {
        this.IdFamilia = 0;
        this.Descripcion = "";
    }

    public int getIdCuenta() {
        return IdCuenta;
    }

    public void setIdCuenta(int IdCuenta) {
        this.IdCuenta = IdCuenta;
    }
    
    private String DCuenta;

    public String getDCuenta() {
        return DCuenta;
    }

    public void setDCuenta(String DCuenta) {
        this.DCuenta = DCuenta;
    }
    
    public Familia(int id, String descripcion, String codigo) {
        this.IdFamilia = id;
        this.Descripcion = descripcion;
        this.Codigo = codigo;
    }
    
}
