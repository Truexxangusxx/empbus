package Modelo;

public class IngresoProducto {

    private int IdIngresoProducto;

    public int getIdIngresoProducto() {
        return IdIngresoProducto;
    }

    public void setIdIngresoProducto(int IdIngresoProducto) {
        this.IdIngresoProducto = IdIngresoProducto;
    }
    private int IdProducto;

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    private int IdIngreso;

    public int getIdIngreso() {
        return IdIngreso;
    }

    public void setIdIngreso(int IdIngreso) {
        this.IdIngreso = IdIngreso;
    }
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

    public String xml(){
        return "<IngresoProducto><idProducto>"+IdProducto+"</idProducto><idCentroCosto>"+IdCentroCosto+"</idCentroCosto><Cantidad>"+Cantidad+"</Cantidad><Precio>"+Precio+"</Precio><Importe>"+Importe+"</Importe></IngresoProducto>";
    }
    
}
