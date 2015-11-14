package Modelo;

public class Ajuste {

    private int idAjuste;
    private String Codigo;
    private String Descripcion;

    public int getIdAjuste() {
        return idAjuste;
    }

    public void setIdAjuste(int idAjuste) {
        this.idAjuste = idAjuste;
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
    
    public Ajuste(){
        this.idAjuste = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    
    
    
    
}
