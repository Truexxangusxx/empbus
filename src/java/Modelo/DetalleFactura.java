package Modelo;

public class DetalleFactura {

    private int IdDetalleFactura;

    public int getIdDetalleFactura() {
        return IdDetalleFactura;
    }

    public void setIdDetalleFactura(int IdDetalleFactura) {
        this.IdDetalleFactura = IdDetalleFactura;
    }
    private int IdProducto;

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    private int Cantidad;

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    private double Precio;

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }
    private double SubTotal;

    public double getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(double SubTotal) {
        this.SubTotal = SubTotal;
    }
    private int IdFactura;

    public int getIdFactura() {
        return IdFactura;
    }

    public void setIdFactura(int IdFactura) {
        this.IdFactura = IdFactura;
    }

    private String DProducto;
    
    public String xml() {
        return "<DetalleFactura><IdDetalleFactura>" + getIdDetalleFactura() + "</IdDetalleFactura><IdProducto>" + getIdProducto() + "</IdProducto><Cantidad>" + getCantidad() + "</Cantidad><Precio>" + getPrecio() + "</Precio><SubTotal>" + getSubTotal() + "</SubTotal><IdFactura>" + getIdFactura() + "</IdFactura></DetalleFactura>/>";
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }
}
