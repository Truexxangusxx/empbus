package Modelo;

public class TipoOrdenProduccion {

    private int idTipoOrdenProduccion;
    private String Descripcion;
    private String Codigo;

    public int getIdTipoOrdenProduccion() {
        return idTipoOrdenProduccion;
    }

    public void setIdTipoOrdenProduccion(int idTipoOrdenProduccion) {
        this.idTipoOrdenProduccion = idTipoOrdenProduccion;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public TipoOrdenProduccion() {
        this.Codigo = "";
        this.Descripcion = "";
        this.idTipoOrdenProduccion = 0;
    }
}
