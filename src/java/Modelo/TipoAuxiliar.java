package Modelo;

public class TipoAuxiliar {

    private int idTipoAuxiliar;
    private String Codigo;
    private String Descripcion;

    public int getIdTipoAuxiliar() {
        return idTipoAuxiliar;
    }

    public void setIdTipoAuxiliar(int idTipoAuxiliar) {
        this.idTipoAuxiliar = idTipoAuxiliar;
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
    
    public TipoAuxiliar(){
        this.idTipoAuxiliar = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    
    
    
    
}
