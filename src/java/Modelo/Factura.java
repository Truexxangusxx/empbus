package Modelo;

public class Factura {

    private int IdFactura;

    public int getIdFactura() {
        return IdFactura;
    }

    public void setIdFactura(int IdFactura) {
        this.IdFactura = IdFactura;
    }
    private String Periodo;

    public String getPeriodo() {
        return Periodo;
    }

    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }
    private String Numero;

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }
    private int IdPuntoVenta;

    public int getIdPuntoVenta() {
        return IdPuntoVenta;
    }

    public void setIdPuntoVenta(int IdPuntoVenta) {
        this.IdPuntoVenta = IdPuntoVenta;
    }
    private int IdTipoVenta;

    public int getIdTipoVenta() {
        return IdTipoVenta;
    }

    public void setIdTipoVenta(int IdTipoVenta) {
        this.IdTipoVenta = IdTipoVenta;
    }
    private int IdCotizacion;

    public int getIdCotizacion() {
        return IdCotizacion;
    }

    public void setIdCotizacion(int IdCotizacion) {
        this.IdCotizacion = IdCotizacion;
    }
    private int IdOrdenProduccion;

    public int getIdOrdenProduccion() {
        return IdOrdenProduccion;
    }

    public void setIdOrdenProduccion(int IdOrdenProduccion) {
        this.IdOrdenProduccion = IdOrdenProduccion;
    }
    private int IdClienteProveedor;

    public int getIdClienteProveedor() {
        return IdClienteProveedor;
    }

    public void setIdClienteProveedor(int IdClienteProveedor) {
        this.IdClienteProveedor = IdClienteProveedor;
    }
    private String DCliente;

    public String getDCliente() {
        return DCliente;
    }

    public void setDCliente(String DCliente) {
        this.DCliente = DCliente;
    }
    private String DocumentoIdentidad;

    public String getDocumentoIdentidad() {
        return DocumentoIdentidad;
    }

    public void setDocumentoIdentidad(String DocumentoIdentidad) {
        this.DocumentoIdentidad = DocumentoIdentidad;
    }
    private int IdTipoDocumento;

    public int getIdTipoDocumento() {
        return IdTipoDocumento;
    }

    public void setIdTipoDocumento(int IdTipoDocumento) {
        this.IdTipoDocumento = IdTipoDocumento;
    }
    private String Serie;

    public String getSerie() {
        return Serie;
    }

    public void setSerie(String Serie) {
        this.Serie = Serie;
    }
    private String NumeroDocumento;

    public String getNumeroDocumento() {
        return NumeroDocumento;
    }

    public void setNumeroDocumento(String NumeroDocumento) {
        this.NumeroDocumento = NumeroDocumento;
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
    private int IdFormaPago;

    public int getIdFormaPago() {
        return IdFormaPago;
    }

    public void setIdFormaPago(int IdFormaPago) {
        this.IdFormaPago = IdFormaPago;
    }
    private String FechaVencimiento;

    public String getFechaVencimiento() {
        return FechaVencimiento;
    }

    public void setFechaVencimiento(String FechaVencimiento) {
        this.FechaVencimiento = FechaVencimiento;
    }
    private int IdMoneda;

    public int getIdMoneda() {
        return IdMoneda;
    }

    public void setIdMoneda(int IdMoneda) {
        this.IdMoneda = IdMoneda;
    }
    private String Glosa;

    public String getGlosa() {
        return Glosa;
    }

    public void setGlosa(String Glosa) {
        this.Glosa = Glosa;
    }
    private double Igv;

    public double getIgv() {
        return Igv;
    }

    public void setIgv(double Igv) {
        this.Igv = Igv;
    }
    private double DPercepcion;

    public double getDPercepcion() {
        return DPercepcion;
    }

    public void setDPercepcion(double DPercepcion) {
        this.DPercepcion = DPercepcion;
    }
    private int IdPercepcion;

    public int getIdPercepcion() {
        return IdPercepcion;
    }

    public void setIdPercepcion(int IdPercepcion) {
        this.IdPercepcion = IdPercepcion;
    }
    private int IdServicio;

    public int getIdServicio() {
        return IdServicio;
    }

    public void setIdServicio(int IdServicio) {
        this.IdServicio = IdServicio;
    }
    private String Referencia;

    public String getReferencia() {
        return Referencia;
    }

    public void setReferencia(String Referencia) {
        this.Referencia = Referencia;
    }
    private String SerieGuia;

    public String getSerieGuia() {
        return SerieGuia;
    }

    public void setSerieGuia(String SerieGuia) {
        this.SerieGuia = SerieGuia;
    }
    private String NumeroGuia;

    public String getNumeroGuia() {
        return NumeroGuia;
    }

    public void setNumeroGuia(String NumeroGuia) {
        this.NumeroGuia = NumeroGuia;
    }
    private String Documento;

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }
    private boolean Aplicar;

    public boolean getAplicar() {
        return Aplicar;
    }

    public void setAplicar(boolean Aplicar) {
        this.Aplicar = Aplicar;
    }
    private double Importe;

    public double getImporte() {
        return Importe;
    }

    public void setImporte(double Importe) {
        this.Importe = Importe;
    }
    private String CotizacionOP;

    public String getCotizacionOP() {
        return CotizacionOP;
    }

    public void setCotizacionOP(String CotizacionOP) {
        this.CotizacionOP = CotizacionOP;
    }

    public String xml() {
        return "<Factura><IdFactura>" + getIdFactura() + "</IdFactura><Periodo>" + helper.CadenaValidada(getPeriodo()) + "</Periodo><Numero>" + helper.CadenaValidada(getNumero()) + "</Numero><IdPunto>" + getIdPuntoVenta() + "</IdPunto><IdTipoVenta>" + getIdTipoVenta() + "</IdTipoVenta><IdCotizacion>" + getIdCotizacion() + "</IdCotizacion><IdOrdenProduccion>" + getIdOrdenProduccion() + "</IdOrdenProduccion><IdClienteProveedor>" + getIdClienteProveedor() + "</IdClienteProveedor><DCliente>" + helper.CadenaValidada(getDCliente()) + "</DCliente><DocumentoIdentidad>" + helper.CadenaValidada(getDocumentoIdentidad()) + "</DocumentoIdentidad><IdTipoDocumento>" + getIdTipoDocumento() + "</IdTipoDocumento><Serie>" + helper.CadenaValidada(getSerie()) + "</Serie><NumeroDocumento>" + helper.CadenaValidada(getNumeroDocumento()) + "</NumeroDocumento><Fecha>" + helper.CadenaValidada(getFecha()) + "</Fecha><TipoCambio>" + getTipoCambio() + "</TipoCambio><IdFormaPago>" + getIdFormaPago() + "</IdFormaPago><FechaVencimiento>" + helper.CadenaValidada(getFechaVencimiento()) + "</FechaVencimiento><IdMoneda>" + getIdMoneda() + "</IdMoneda><Glosa>" + helper.CadenaValidada(getGlosa()) + "</Glosa><Igv>" + getIgv() + "</Igv><DPercecpcion>" + getDPercepcion() + "</DPercecpcion><IdPercecpcion>" + getIdPercepcion() + "</IdPercecpcion><IdServicio>" + getIdServicio() + "</IdServicio><Referencia>" + helper.CadenaValidada(getReferencia()) + "</Referencia><SerieGuia>" + helper.CadenaValidada(getSerieGuia()) + "</SerieGuia><NumeroGuia>" + helper.CadenaValidada(getNumeroGuia()) + "</NumeroGuia><Documento>" + helper.CadenaValidada(getDocumento()) + "</Documento><Aplicar>" + (getAplicar() ? 1 : 0) + "</Aplicar><Importe>" + getImporte() + "</Importe><CotizacionOP>" + helper.CadenaValidada(getCotizacionOP()) + "</CotizacionOP></Factura>/>";
    }
}
