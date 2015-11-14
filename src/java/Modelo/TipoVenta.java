package Modelo;

public class TipoVenta {

    private int IdTipoVenta;

    public int getIdTipoVenta() {
        return IdTipoVenta;
    }

    public void setIdTipoVenta(int IdTipoVenta) {
        this.IdTipoVenta = IdTipoVenta;
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

    public String xml() {
        return "<TipoVenta><IdTipoVenta>" + getIdTipoVenta() + "</IdTipoVenta><Descripcion>" + helper.CadenaValidada(getDescripcion()) + "</Descripcion><Codigo>" + helper.CadenaValidada(getCodigo()) + "</Codigo></TipoVenta>/>";
    }
    
    public TipoVenta(){this.Descripcion = ""; this.IdTipoVenta = 0;}
}
