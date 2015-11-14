package Modelo;

public class OrdenCompraProducto {
private int idOrdenCompraProducto;
private int idOrdenCompra;
private int idProducto;
private int Cantidad;
private Double PrecioUnitario;
private Double Descuento;
private Double Importe;
private String Glosa;
private String Codigo;
private String DProducto;
private String DUnidadMedida;

    public int getIdOrdenCompraProducto() {
        return idOrdenCompraProducto;
    }

    public void setIdOrdenCompraProducto(int idOrdenCompraProducto) {
        this.idOrdenCompraProducto = idOrdenCompraProducto;
    }

    public int getIdOrdenCompra() {
        return idOrdenCompra;
    }

    public void setIdOrdenCompra(int idOrdenCompra) {
        this.idOrdenCompra = idOrdenCompra;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public Double getPrecioUnitario() {
        return PrecioUnitario;
    }

    public void setPrecioUnitario(Double PrecioUnitario) {
        this.PrecioUnitario = PrecioUnitario;
    }

    public Double getDescuento() {
        return Descuento;
    }

    public void setDescuento(Double Descuento) {
        this.Descuento = Descuento;
    }

    public Double getImporte() {
        return Importe;
    }

    public void setImporte(Double Importe) {
        this.Importe = Importe;
    }

    public String getGlosa() {
        return Glosa;
    }

    public void setGlosa(String Glosa) {
        this.Glosa = Glosa;
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }

    public String getDUnidadMedida() {
        return DUnidadMedida;
    }

    public void setDUnidadMedida(String DUnidadMedida) {
        this.DUnidadMedida = DUnidadMedida;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }
    
    public String xml(){
        return "<OrdenCompraProducto><idOrdenCompraProducto>"+idOrdenCompraProducto+"</idOrdenCompraProducto><idOrdenCompra>"+idOrdenCompra+"</idOrdenCompra><idProducto>"+idProducto+"</idProducto><Cantidad>"+Cantidad+"</Cantidad><PrecioUnitario>"+PrecioUnitario+"</PrecioUnitario><Descuento>"+Descuento+"</Descuento><Importe>"+Importe+"</Importe><Glosa>"+Glosa+"</Glosa></OrdenCompraProducto>";
    }

    public OrdenCompraProducto(){
        this.Descuento = 0.0;
    }
    
}
