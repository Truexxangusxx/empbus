package Modelo;

public class CentroCosto {

    private int IdCentroCosto;

    public int getIdCentroCosto() {
        return IdCentroCosto;
    }

    public void setIdCentroCosto(int IdCentroCosto) {
        this.IdCentroCosto = IdCentroCosto;
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
    
    public CentroCosto(){
    this.Descripcion = "";
    this.IdCentroCosto = 0;
    this.Codigo = "";
    }
    
    public CentroCosto(int id, String descripcion, String codigo){
    this.Descripcion = descripcion;
    this.IdCentroCosto = id;
    this.Codigo = codigo;
    }
    
}
