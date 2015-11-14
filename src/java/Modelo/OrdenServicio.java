package Modelo;

public class OrdenServicio {

    private int IdOrdenServicio;

    public int getIdOrdenServicio() {
        return IdOrdenServicio;
    }

    public void setIdOrdenServicio(int IdOrdenServicio) {
        this.IdOrdenServicio = IdOrdenServicio;
    }
    private int IdCentroCosto;

    public int getIdCentroCosto() {
        return IdCentroCosto;
    }

    public void setIdCentroCosto(int IdCentroCosto) {
        this.IdCentroCosto = IdCentroCosto;
    }
    private int IdOrdenProduccion;

    public int getIdOrdenProduccion() {
        return IdOrdenProduccion;
    }

    public void setIdOrdenProduccion(int IdOrdenProduccion) {
        this.IdOrdenProduccion = IdOrdenProduccion;
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
    private double Monto;

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }
    private String Numero;

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

    private int idSucursal;
    private String DSucursal;
    private String DCentroCosto;
    private String DFormaPago;
    private String DMoneda;
    private String DClienteProveedor;

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

    public String getDCentroCosto() {
        return DCentroCosto;
    }

    public void setDCentroCosto(String DCentroCosto) {
        this.DCentroCosto = DCentroCosto;
    }

    public String getDFormaPago() {
        return DFormaPago;
    }

    public void setDFormaPago(String DFormaPago) {
        this.DFormaPago = DFormaPago;
    }

    public String getDMoneda() {
        return DMoneda;
    }

    public void setDMoneda(String DMoneda) {
        this.DMoneda = DMoneda;
    }

    public String getDClienteProveedor() {
        return DClienteProveedor;
    }

    public void setDClienteProveedor(String DClienteProveedor) {
        this.DClienteProveedor = DClienteProveedor;
    }
    
    private String RucProveedor;

    public String getRucProveedor() {
        return RucProveedor;
    }

    public void setRucProveedor(String RucProveedor) {
        this.RucProveedor = RucProveedor;
    }
    
    private Boolean Afecto;

    public Boolean getAfecto() {
        return Afecto;
    }

    public void setAfecto(Boolean Afecto) {
        this.Afecto = Afecto;
    }
    
}
