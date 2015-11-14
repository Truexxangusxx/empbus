package Modelo;

public class Servicio {

    private int IdServicio;

    public int getIdServicio() {
        return IdServicio;
    }

    public void setIdServicio(int IdServicio) {
        this.IdServicio = IdServicio;
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
    
    public Servicio(){this.Descripcion = ""; this.IdServicio=0;}

    public String xml() {
        return "<Servicio><IdServicio>" + getIdServicio() + "</IdServicio><Descripcion>" + helper.CadenaValidada(getDescripcion()) + "</Descripcion><Codigo>" + helper.CadenaValidada(getCodigo()) + "</Codigo></Servicio>/>";
    }
}
