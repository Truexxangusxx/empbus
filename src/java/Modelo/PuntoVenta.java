package Modelo;

public class PuntoVenta {

    private int IdPuntoVenta;

    public int getIdPuntoVenta() {
        return IdPuntoVenta;
    }

    public void setIdPuntoVenta(int IdPuntoVenta) {
        this.IdPuntoVenta = IdPuntoVenta;
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
        return "<PuntoVenta><IdPuntoVenta>" + getIdPuntoVenta() + "</IdPuntoVenta><Descripcion>" + helper.CadenaValidada(getDescripcion()) + "</Descripcion><Codigo>" + helper.CadenaValidada(getCodigo()) + "</Codigo></PuntoVenta>/>";
    }
    
    public PuntoVenta(){this.Descripcion = ""; this.IdPuntoVenta = 0;}
}
