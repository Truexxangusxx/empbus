package Modelo;

public class CotizacionProducto {
    private int IdCotizacionProducto;
    private int IdCotizacion;
    private int IdProducto;
    private int Cantidad;
    private String DProducto;
    private String CodigoProducto;
    private Double Precio;
    private Double SubTotal;

    public int getIdCotizacionProducto() {
        return IdCotizacionProducto;
    }

    public void setIdCotizacionProducto(int IdCotizacionProducto) {
        this.IdCotizacionProducto = IdCotizacionProducto;
    }

    public int getIdCotizacion() {
        return IdCotizacion;
    }

    public void setIdCotizacion(int IdCotizacion) {
        this.IdCotizacion = IdCotizacion;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }
    
    public String xml(Usuario obj){
        return "<CotizacionProducto><idCotizacion>"+IdCotizacion+"</idCotizacion><idProducto>"+IdProducto+"</idProducto><Cantidad>"+Cantidad+"</Cantidad><Usuario>"+obj.getNick()+"</Usuario><Precio>"+Precio+"</Precio></CotizacionProducto>";
    }

    public Double getPrecio() {
        return Precio;
    }

    public void setPrecio(Double Precio) {
        this.Precio = Precio;
    }

    public Double getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(Double SubTotal) {
        this.SubTotal = SubTotal;
    }

    public String getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(String CodigoProducto) {
        this.CodigoProducto = CodigoProducto;
    }
}
