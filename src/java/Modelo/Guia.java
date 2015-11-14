package Modelo;

public class Guia {

    private int IdGuia;

    public int getIdGuia() {
        return IdGuia;
    }

    public void setIdGuia(int IdGuia) {
        this.IdGuia = IdGuia;
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
    private int IdTipoMovimiento;

    public int getIdTipoMovimiento() {
        return IdTipoMovimiento;
    }

    public void setIdTipoMovimiento(int IdTipoMovimiento) {
        this.IdTipoMovimiento = IdTipoMovimiento;
    }
    private String Referencia;

    public String getReferencia() {
        return Referencia;
    }

    public void setReferencia(String Referencia) {
        this.Referencia = Referencia;
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
    private int IdAlmacen;

    public int getIdAlmacen() {
        return IdAlmacen;
    }

    public void setIdAlmacen(int IdAlmacen) {
        this.IdAlmacen = IdAlmacen;
    }
    private String Observaciones;

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }

    private String DOrdenProduccion;
    private String DClienteProveedor;
    
    public String xml() {
        return "<Guia><IdGuia>" + getIdGuia() + "</IdGuia><Periodo>" + helper.CadenaValidada(getPeriodo()) + "</Periodo><Numero>" + helper.CadenaValidada(getNumero()) + "</Numero><Fecha>" + helper.CadenaValidada(getFecha()) + "</Fecha><TipoCambio>" + getTipoCambio() + "</TipoCambio><Serie>" + helper.CadenaValidada(getSerie()) + "</Serie><NumeroDocumento>" + helper.CadenaValidada(getNumeroDocumento()) + "</NumeroDocumento><IdTipoMovimiento>" + getIdTipoMovimiento() + "</IdTipoMovimiento><Referencia>" + helper.CadenaValidada(getReferencia()) + "</Referencia><IdOrdenProduccion>" + getIdOrdenProduccion() + "</IdOrdenProduccion><IdClienteProveedor>" + getIdClienteProveedor() + "</IdClienteProveedor><IdAlmacen>" + getIdAlmacen() + "</IdAlmacen><Observaciones>" + helper.CadenaValidada(getObservaciones()) + "</Observaciones></Guia>/>";
    }

    public String getDOrdenProduccion() {
        return DOrdenProduccion;
    }

    public void setDOrdenProduccion(String DOrdenProduccion) {
        this.DOrdenProduccion = DOrdenProduccion;
    }

    public String getDClienteProveedor() {
        return DClienteProveedor;
    }

    public void setDClienteProveedor(String DClienteProveedor) {
        this.DClienteProveedor = DClienteProveedor;
    }
}
