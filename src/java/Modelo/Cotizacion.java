package Modelo;

public class Cotizacion {

    private int IdCotizacion;

    public int getIdCotizacion() {
        return IdCotizacion;
    }

    public void setIdCotizacion(int IdCotizacion) {
        this.IdCotizacion = IdCotizacion;
    }
    private int IdClienteProveedor;

    public int getIdClienteProveedor() {
        return IdClienteProveedor;
    }

    public void setIdClienteProveedor(int IdClienteProveedor) {
        this.IdClienteProveedor = IdClienteProveedor;
    }
    private int IdModeloChasis;

    public int getIdModeloChasis() {
        return IdModeloChasis;
    }

    public void setIdModeloChasis(int IdModeloChasis) {
        this.IdModeloChasis = IdModeloChasis;
    }
    private String Fecha;

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    private int NumeroChasis;

    public int getNumeroChasis() {
        return NumeroChasis;
    }

    public void setNumeroChasis(int NumeroChasis) {
        this.NumeroChasis = NumeroChasis;
    }
    private int NumeroAsientos;

    public int getNumeroAsientos() {
        return NumeroAsientos;
    }

    public void setNumeroAsientos(int NumeroAsientos) {
        this.NumeroAsientos = NumeroAsientos;
    }
    private int NumeroParabrisas;

    public int getNumeroParabrisas() {
        return NumeroParabrisas;
    }

    public void setNumeroParabrisas(int NumeroParabrisas) {
        this.NumeroParabrisas = NumeroParabrisas;
    }
    private String Ventanas;

    public String getVentanas() {
        return Ventanas;
    }

    public void setVentanas(String Ventanas) {
        this.Ventanas = Ventanas;
    }
    private String TipoCarroceria;

    public String getTipoCarroceria() {
        return TipoCarroceria;
    }

    public void setTipoCarroceria(String TipoCarroceria) {
        this.TipoCarroceria = TipoCarroceria;
    }
    private String ColorFondo;

    public String getColorFondo() {
        return ColorFondo;
    }

    public void setColorFondo(String ColorFondo) {
        this.ColorFondo = ColorFondo;
    }
    private String ColorArtes;

    public String getColorArtes() {
        return ColorArtes;
    }

    public void setColorArtes(String ColorArtes) {
        this.ColorArtes = ColorArtes;
    }
    private String ColorOtros;

    public String getColorOtros() {
        return ColorOtros;
    }

    public void setColorOtros(String ColorOtros) {
        this.ColorOtros = ColorOtros;
    }
    private String Observaciones;

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }
    
    private String DClienteProveedor;
    private String DModeloChasis;
    private String Estado;
    private Double Monto;
    private int idProducto;
    private int idCentroCosto;    
    private String DCentroCosto;
    private Producto producto;
    private CentroCosto centrocosto;
    private String Ruc;
    
    
    public String getDClienteProveedor() {
        return DClienteProveedor;
    }

    /**
     * @param DClienteProveedor the DClienteProveedor to set
     */
    public void setDClienteProveedor(String DClienteProveedor) {
        this.DClienteProveedor = DClienteProveedor;
    }

    /**
     * @return the DModeloChasis
     */
    public String getDModeloChasis() {
        return DModeloChasis;
    }

    /**
     * @param DModeloChasis the DModeloChasis to set
     */
    public void setDModeloChasis(String DModeloChasis) {
        this.DModeloChasis = DModeloChasis;
    }
    
    private String Serie;

    /**
     * @return the Serie
     */
    public String getSerie() {
        return Serie;
    }

    /**
     * @param Serie the Serie to set
     */
    public void setSerie(String Serie) {
        this.Serie = Serie;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public Double getMonto() {
        return Monto;
    }

    public void setMonto(Double Monto) {
        this.Monto = Monto;
    }
    
    public Cotizacion(){
    this.Monto = Double.parseDouble("0");
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
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

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public CentroCosto getCentrocosto() {
        return centrocosto;
    }

    public void setCentrocosto(CentroCosto centrocosto) {
        this.centrocosto = centrocosto;
    }

    public String getRuc() {
        return Ruc;
    }

    public void setRuc(String Ruc) {
        this.Ruc = Ruc;
    }
    
}
