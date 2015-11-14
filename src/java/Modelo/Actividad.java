package Modelo;

public class Actividad {

    private int idActividad;
    private String Codigo;
    private String Descripcion;

    public int getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(int idActividad) {
        this.idActividad = idActividad;
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
    
    public Actividad(){
        this.idActividad = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    public Actividad(int id, String descripcion, String codigo){
        this.idActividad = id;
        this.Descripcion=descripcion;
        this.Codigo=codigo;
    }
    
    
    
    
    
}
