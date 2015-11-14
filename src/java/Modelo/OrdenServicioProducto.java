package Modelo;

public class OrdenServicioProducto {

    private int IdOrdenServicioProducto;

    public int getIdOrdenServicioProducto() {
        return IdOrdenServicioProducto;
    }

    public void setIdOrdenServicioProducto(int IdOrdenServicioProducto) {
        this.IdOrdenServicioProducto = IdOrdenServicioProducto;
    }
    private int IdOrdenServicio;

    public int getIdOrdenServicio() {
        return IdOrdenServicio;
    }

    public void setIdOrdenServicio(int IdOrdenServicio) {
        this.IdOrdenServicio = IdOrdenServicio;
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
    private double PrecioUnitario;

    public double getPrecioUnitario() {
        return PrecioUnitario;
    }

    public void setPrecioUnitario(double PrecioUnitario) {
        this.PrecioUnitario = PrecioUnitario;
    }
    private double Descuento;

    public double getDescuento() {
        return Descuento;
    }

    public void setDescuento(double Descuento) {
        this.Descuento = Descuento;
    }
    private double Importe;

    public double getImporte() {
        return Importe;
    }

    public void setImporte(double Importe) {
        this.Importe = Importe;
    }
    private String Glosa;

    public String getGlosa() {
        return Glosa;
    }

    public void setGlosa(String Glosa) {
        this.Glosa = Glosa;
    }

    private String DProducto;

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }
    
    private String DUnidadMedida;
    private String Codigo;

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
    
    private int idOrdenProduccion;
    private String DOrdenProduccion;

    public int getIdOrdenProduccion() {
        return idOrdenProduccion;
    }

    public void setIdOrdenProduccion(int idOrdenProduccion) {
        this.idOrdenProduccion = idOrdenProduccion;
    }

    public String getDOrdenProduccion() {
        return DOrdenProduccion;
    }

    public void setDOrdenProduccion(String DOrdenProduccion) {
        this.DOrdenProduccion = DOrdenProduccion;
    }
    
    public String xml(){
        return "<OrdenServicioProducto><idProducto>"+IdProducto+"</idProducto><idOrdenProduccion>"+idOrdenProduccion+"</idOrdenProduccion><Cantidad>"+Cantidad+"</Cantidad><PrecioUnitario>"+PrecioUnitario+"</PrecioUnitario><Descuento>"+Descuento+"</Descuento><Importe>"+Importe+"</Importe><Glosa>"+Glosa+"</Glosa></OrdenServicioProducto>";
    }
    
}
