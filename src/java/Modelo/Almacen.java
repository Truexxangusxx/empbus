package Modelo;

public class Almacen {

    private int IdAlmacen;

    public int getIdAlmacen() {
        return IdAlmacen;
    }

    public void setIdAlmacen(int IdAlmacen) {
        this.IdAlmacen = IdAlmacen;
    }
    private int IdSucursal;

    public int getIdSucursal() {
        return IdSucursal;
    }

    public void setIdSucursal(int IdSucursal) {
        this.IdSucursal = IdSucursal;
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
    
    private String DSucursal;

    public String getDSucursal() {
        return DSucursal;
    }

    public void setDSucursal(String DSucursal) {
        this.DSucursal = DSucursal;
    }

    public Almacen(){
    this.IdAlmacen = 0;
    this.IdSucursal = 0;
    this.Descripcion = "";
    }
    
}
