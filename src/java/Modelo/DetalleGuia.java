package Modelo;

public class DetalleGuia {

    private int IdDetalleGuia;

    public int getIdDetalleGuia() {
        return IdDetalleGuia;
    }

    public void setIdDetalleGuia(int IdDetalleGuia) {
        this.IdDetalleGuia = IdDetalleGuia;
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
    private int IdGuia;

    public int getIdGuia() {
        return IdGuia;
    }

    public void setIdGuia(int IdGuia) {
        this.IdGuia = IdGuia;
    }

    private String DProducto;

    public String xml() {
        return "<DetalleGuia><IdDetalleGuia>" + getIdDetalleGuia() + "</IdDetalleGuia><IdProducto>" + getIdProducto() + "</IdProducto><Cantidad>" + getCantidad() + "</Cantidad><Precio>" + getPrecio() + "</Precio><SubTotal>" + getSubTotal() + "</SubTotal><IdGuia>" + getIdGuia() + "</IdGuia></DetalleGuia>/>";
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }
}
