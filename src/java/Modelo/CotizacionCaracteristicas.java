package Modelo;

public class CotizacionCaracteristicas {
private int idCotizacionCaracteristicas;
private int idCotizacion;
private int idCaracteristicas;
private boolean Estado;
private String Valor;
private String DCaracteristicas;
private String DTipoCaracteristica;

    public int getIdCotizacionCaracteristicas() {
        return idCotizacionCaracteristicas;
    }

    public void setIdCotizacionCaracteristicas(int idCotizacionCaracteristicas) {
        this.idCotizacionCaracteristicas = idCotizacionCaracteristicas;
    }

    public int getIdCotizacion() {
        return idCotizacion;
    }

    public void setIdCotizacion(int idCotizacion) {
        this.idCotizacion = idCotizacion;
    }

    public int getIdCaracteristicas() {
        return idCaracteristicas;
    }

    public void setIdCaracteristicas(int idCaracteristicas) {
        this.idCaracteristicas = idCaracteristicas;
    }

    public boolean getEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }

    public String getValor() {
        return Valor;
    }

    public void setValor(String Valor) {
        this.Valor = Valor;
    }

    public String getDCaracteristicas() {
        return DCaracteristicas;
    }

    public void setDCaracteristicas(String DCaracteristicas) {
        this.DCaracteristicas = DCaracteristicas;
    }

    public String getDTipoCaracteristica() {
        return DTipoCaracteristica;
    }

    public void setDTipoCaracteristica(String DTipoCaracteristica) {
        this.DTipoCaracteristica = DTipoCaracteristica;
    }
    
    public String xml(){
        if (this.Estado)
        {return "<CotizacionCaracteristicas><idCotizacion>"+idCotizacion+"</idCotizacion><idCaracteristicas>"+idCaracteristicas+"</idCaracteristicas><Estado>"+1+"</Estado><Valor>"+Valor+"</Valor></CotizacionCaracteristicas>";}
        else{return "<CotizacionCaracteristicas><idCotizacion>"+idCotizacion+"</idCotizacion><idCaracteristicas>"+idCaracteristicas+"</idCaracteristicas><Estado>"+0+"</Estado><Valor>"+Valor+"</Valor></CotizacionCaracteristicas>";}
    }
    
    public CotizacionCaracteristicas(){
    this.Valor = "";
    this.Estado = false;
    }
    
}
