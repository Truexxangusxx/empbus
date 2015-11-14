package Modelo;

public class OrdenProduccion {

    private int IdOrdenProduccion;

    public int getIdOrdenProduccion() {
        return IdOrdenProduccion;
    }

    public void setIdOrdenProduccion(int IdOrdenProduccion) {
        this.IdOrdenProduccion = IdOrdenProduccion;
    }
    private int IdSucursal;

    public int getIdSucursal() {
        return IdSucursal;
    }

    public void setIdSucursal(int IdSucursal) {
        this.IdSucursal = IdSucursal;
    }
    private int IdCotizacion;

    public int getIdCotizacion() {
        return IdCotizacion;
    }

    public void setIdCotizacion(int IdCotizacion) {
        this.IdCotizacion = IdCotizacion;
    }
    private String Fecha;

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    private String Numero;

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }
    private String FechaInicio;

    public String getFechaInicio() {
        return FechaInicio;
    }

    public void setFechaInicio(String FechaInicio) {
        this.FechaInicio = FechaInicio;
    }
    private String FechaTermino;

    public String getFechaTermino() {
        return FechaTermino;
    }

    public void setFechaTermino(String FechaTermino) {
        this.FechaTermino = FechaTermino;
    }
    private String Observaciones;

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }
    private double Monto;

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }
    private String Estado;

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    private int idProducto;
    private String DProductoPrincipal;
    private String DCotizacion;
    private String DSucursal;
    private int idTipoOrdenProduccion;
    private String DTipoOrdenProduccion;
    private int idCentroCosto;
    private String DCentroCosto;
    private int idClienteProveedor;
    private String DClienteProveedor;
    private Boolean PedidoGenerado;

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getDProductoPrincipal() {
        return DProductoPrincipal;
    }

    public void setDProductoPrincipal(String DProductoPrincipal) {
        this.DProductoPrincipal = DProductoPrincipal;
    }

    public String getDCotizacion() {
        return DCotizacion;
    }

    public void setDCotizacion(String DCotizacion) {
        this.DCotizacion = DCotizacion;
    }

    public String getDSucursal() {
        return DSucursal;
    }

    public void setDSucursal(String DSucursal) {
        this.DSucursal = DSucursal;
    }

    public int getIdTipoOrdenProduccion() {
        return idTipoOrdenProduccion;
    }

    public void setIdTipoOrdenProduccion(int idTipoOrdenProduccion) {
        this.idTipoOrdenProduccion = idTipoOrdenProduccion;
    }

    public String getDTipoOrdenProduccion() {
        return DTipoOrdenProduccion;
    }

    public void setDTipoOrdenProduccion(String DTipoOrdenProduccion) {
        this.DTipoOrdenProduccion = DTipoOrdenProduccion;
    }

    public int getIdCentroCosto() {
        return idCentroCosto;
    }

    public void setIdCentroCosto(int idCentroCosto) {
        this.idCentroCosto = idCentroCosto;
    }

    public String getDCentroCosto() {
        return DCentroCosto;
    }

    public void setDCentroCosto(String DCentroCosto) {
        this.DCentroCosto = DCentroCosto;
    }

    public int getIdClienteProveedor() {
        return idClienteProveedor;
    }

    public void setIdClienteProveedor(int idClienteProveedor) {
        this.idClienteProveedor = idClienteProveedor;
    }

    public String getDClienteProveedor() {
        return DClienteProveedor;
    }

    public void setDClienteProveedor(String DClienteProveedor) {
        this.DClienteProveedor = DClienteProveedor;
    }

    public Boolean getPedidoGenerado() {
        return PedidoGenerado;
    }

    public void setPedidoGenerado(Boolean PedidoGenerado) {
        this.PedidoGenerado = PedidoGenerado;
    }
    
    public OrdenProduccion(int id, String numero){
        this.IdOrdenProduccion = id;
        this.Numero = numero;
    }
    
    public OrdenProduccion(){
        this.IdOrdenProduccion = 0;
        this.Numero = "";
    }
    
    
}
