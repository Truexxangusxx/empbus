package Modelo;

public class OrdenCompra {

    private int IdOrdenCompra;

    public int getIdOrdenCompra() {
        return IdOrdenCompra;
    }

    public void setIdOrdenCompra(int IdOrdenCompra) {
        this.IdOrdenCompra = IdOrdenCompra;
    }
    private int IdSucursal;

    public int getIdSucursal() {
        return IdSucursal;
    }

    public void setIdSucursal(int IdSucursal) {
        this.IdSucursal = IdSucursal;
    }
    private int IdFormaPago;

    public int getIdFormaPago() {
        return IdFormaPago;
    }

    public void setIdFormaPago(int IdFormaPago) {
        this.IdFormaPago = IdFormaPago;
    }
    private int IdMoneda;

    public int getIdMoneda() {
        return IdMoneda;
    }

    public void setIdMoneda(int IdMoneda) {
        this.IdMoneda = IdMoneda;
    }
    private int IdClienteProveedor;

    public int getIdClienteProveedor() {
        return IdClienteProveedor;
    }

    public void setIdClienteProveedor(int IdClienteProveedor) {
        this.IdClienteProveedor = IdClienteProveedor;
    }
    private String Fecha;

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    private double TipoCambio;

    public double getTipoCambio() {
        return TipoCambio;
    }

    public void setTipoCambio(double TipoCambio) {
        this.TipoCambio = TipoCambio;
    }
    private String FechaEntrega;

    public String getFechaEntrega() {
        return FechaEntrega;
    }

    public void setFechaEntrega(String FechaEntrega) {
        this.FechaEntrega = FechaEntrega;
    }
    private String Observaciones;

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }
    private double IGV;

    public double getIGV() {
        return IGV;
    }

    public void setIGV(double IGV) {
        this.IGV = IGV;
    }
    private double Subtotal;

    public double getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(double Subtotal) {
        this.Subtotal = Subtotal;
    }
    private double Total;

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }
    
    private String DClienteProveedor;
    private String Numero;

    public String getDClienteProveedor() {
        return DClienteProveedor;
    }

    public void setDClienteProveedor(String DClienteProveedor) {
        this.DClienteProveedor = DClienteProveedor;
    }

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }
    
    private String Estado;

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    private String RucCliente;

    public String getRucCliente() {
        return RucCliente;
    }

    public void setRucCliente(String RucCliente) {
        this.RucCliente = RucCliente;
    }

    private Boolean Afecto;

    public Boolean getAfecto() {
        return Afecto;
    }

    public void setAfecto(Boolean Afecto) {
        this.Afecto = Afecto;
    }
    
    
}
