package Modelo;

public class Producto {

    private String Usuario;
    
    private int idProducto;

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
    private int idTipoProducto;

    public int getIdTipoProducto() {
        return idTipoProducto;
    }

    public void setIdTipoProducto(int idTipoProducto) {
        this.idTipoProducto = idTipoProducto;
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
    private int Contador;

    public int getContador() {
        return Contador;
    }

    public void setContador(int Contador) {
        this.Contador = Contador;
    }
    private double UmCompra;

    public double getUmCompra() {
        return UmCompra;
    }

    public void setUmCompra(double UmCompra) {
        this.UmCompra = UmCompra;
    }
    private double UmConsumo;
    
    private int idUnidadMedidaCompra;

    public int getIdUnidadMedidaCompra() {
        return idUnidadMedidaCompra;
    }

    public void setIdUnidadMedidaCompra(int idUnidadMedidaCompra) {
        this.idUnidadMedidaCompra = idUnidadMedidaCompra;
    }
    private int idUnidadMedidaConsumo;

    public int getIdUnidadMedidaConsumo() {
        return idUnidadMedidaConsumo;
    }

    public void setIdUnidadMedidaConsumo(int idUnidadMedidaConsumo) {
        this.idUnidadMedidaConsumo = idUnidadMedidaConsumo;
    }
    private double Conversion;

    public double getConversion() {
        return Conversion;
    }

    public void setConversion(double Conversion) {
        this.Conversion = Conversion;
    }
    
    private String DTipoProducto;
    private String DUnidadMedidaCompra;
    private String DUnidadMedidaConsumo;
    private Double Precio;

    public String getDTipoProducto() {
        return DTipoProducto;
    }

    public void setDTipoProducto(String DTipoProducto) {
        this.DTipoProducto = DTipoProducto;
    }

    public String getDUnidadMedidaCompra() {
        return DUnidadMedidaCompra;
    }

    public void setDUnidadMedidaCompra(String DUnidadMedidaCompra) {
        this.DUnidadMedidaCompra = DUnidadMedidaCompra;
    }

    public String getDUnidadMedidaConsumo() {
        return DUnidadMedidaConsumo;
    }

    public void setDUnidadMedidaConsumo(String DUnidadMedidaConsumo) {
        this.DUnidadMedidaConsumo = DUnidadMedidaConsumo;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public double getUmConsumo() {
        return UmConsumo;
    }

    public void setUmConsumo(double UmConsumo) {
        this.UmConsumo = UmConsumo;
    }
    
    private int idFamilia;
    private String DFamilia;

    public int getIdFamilia() {
        return idFamilia;
    }

    public void setIdFamilia(int idFamilia) {
        this.idFamilia = idFamilia;
    }

    public String getDFamilia() {
        return DFamilia;
    }

    public void setDFamilia(String DFamilia) {
        this.DFamilia = DFamilia;
    }
    
    public Producto(){
        this.Descripcion = "";
        this.idFamilia = 0;
        this.idProducto = 0;
    }

    public Double getPrecio() {
        return Precio;
    }

    public void setPrecio(Double Precio) {
        this.Precio = Precio;
    }

}
