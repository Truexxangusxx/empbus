package Modelo;

public class ReferenciaMaterialesOP {

    private int idProducto;
    private String DProducto;
    private String CodigoProducto;
    private int Cantidad;
    private String Fecha;
    private int idSucursal;
    private String DSucursal;
    private int idAlmacen;
    private String DAlmacen;
    private String Numero;

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }

    public String getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(String CodigoProducto) {
        this.CodigoProducto = CodigoProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getDSucursal() {
        return DSucursal;
    }

    public void setDSucursal(String DSucursal) {
        this.DSucursal = DSucursal;
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public String getDAlmacen() {
        return DAlmacen;
    }

    public void setDAlmacen(String DAlmacen) {
        this.DAlmacen = DAlmacen;
    }

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }
}
