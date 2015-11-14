package Modelo;

public class Naturaleza {

    private int idNaturaleza;
    private String Codigo;
    private String Descripcion;

    public int getIdNaturaleza() {
        return idNaturaleza;
    }

    public void setIdNaturaleza(int idNaturaleza) {
        this.idNaturaleza = idNaturaleza;
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
    
    public Naturaleza(){
        this.idNaturaleza = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    
    
    
    
}
