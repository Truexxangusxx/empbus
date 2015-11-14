package Modelo;


public class SalidaProducto {
    private int IdSalidaProducto;
    private int IdProducto;
    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    private int IdSalida;
    
    private int IdCentroCosto;

    public int getIdCentroCosto() {
        return IdCentroCosto;
    }

    public void setIdCentroCosto(int IdCentroCosto) {
        this.IdCentroCosto = IdCentroCosto;
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
    private double Importe;

    public double getImporte() {
        return Importe;
    }

    public void setImporte(double Importe) {
        this.Importe = Importe;
    }

    private String Codigo;
    private String DProducto;
    private String DUnidadMedida;
    private String DCentroCosto;
    private int Estandar;

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
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

    public String getDCentroCosto() {
        return DCentroCosto;
    }

    public void setDCentroCosto(String DCentroCosto) {
        this.DCentroCosto = DCentroCosto;
    }
    
    private int Stock;

    public String xml(){
        return "<SalidaProducto><idProducto>"+IdProducto+"</idProducto><idCentroCosto>"+IdCentroCosto+"</idCentroCosto><Cantidad>"+Cantidad+"</Cantidad><Precio>"+Precio+"</Precio><Importe>"+Importe+"</Importe><Estandar>"+Estandar+"</Estandar></SalidaProducto>";
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public int getEstandar() {
        return Estandar;
    }

    public void setEstandar(int Estandar) {
        this.Estandar = Estandar;
    }

    public int getIdSalidaProducto() {
        return IdSalidaProducto;
    }

    public void setIdSalidaProducto(int IdSalidaProducto) {
        this.IdSalidaProducto = IdSalidaProducto;
    }

    public int getIdSalida() {
        return IdSalida;
    }

    public void setIdSalida(int IdSalida) {
        this.IdSalida = IdSalida;
    }
        
}
