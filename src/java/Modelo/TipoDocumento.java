package Modelo;

public class TipoDocumento {

    private int IdTipoDocumento;

    public int getIdTipoDocumento() {
        return IdTipoDocumento;
    }

    public void setIdTipoDocumento(int IdTipoDocumento) {
        this.IdTipoDocumento = IdTipoDocumento;
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

    public TipoDocumento(){this.Descripcion=""; this.IdTipoDocumento=0;}
    
    public String xml() {
        return "<TipoDocumento><IdTipoDocumento>" + getIdTipoDocumento() + "</IdTipoDocumento><Descripcion>" + helper.CadenaValidada(getDescripcion()) + "</Descripcion><Codigo>" + helper.CadenaValidada(getCodigo()) + "</Codigo></TipoDocumento>/>";
    }
}
