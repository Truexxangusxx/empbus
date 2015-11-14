package Modelo;

public class Clase {

    private int idClase;
    private String Codigo;
    private String Descripcion;

    public int getIdClase() {
        return idClase;
    }

    public void setIdClase(int idClase) {
        this.idClase = idClase;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    public Clase(){
        this.idClase = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    
    
    
    
}
