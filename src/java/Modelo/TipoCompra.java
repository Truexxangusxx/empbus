package Modelo;

public class TipoCompra {

    private int idTipoCompra;

    public int getIdTipoCompra() {
        return idTipoCompra;
    }

    public void setIdTipoCompra(int idTipoCompra) {
        this.idTipoCompra = idTipoCompra;
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
        return "<TipoCompra idTipoCompra= '" + getIdTipoCompra() + "' Descripcion= '" + helper.CadenaValidada(getDescripcion()) + "' Codigo= '" + helper.CadenaValidada(getCodigo()) + "' />";
    }
}
