package Modelo;

public class Subdiario {

    private int idSubdiario;
    private String Codigo;
    private String Descripcion;

    public int getIdSubdiario() {
        return idSubdiario;
    }

    public void setIdSubdiario(int idSubdiario) {
        this.idSubdiario = idSubdiario;
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
    
    public Subdiario(){
        this.idSubdiario = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    public Subdiario(int id, String descripcion, String codigo){
        this.idSubdiario = id;
        this.Descripcion=descripcion;
        this.Codigo=codigo;
    }
    
    
}
