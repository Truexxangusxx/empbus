package Modelo;

public class TipoCambioCuenta {

    private int idTipoCambioCuenta;
    private String Codigo;
    private String Descripcion;

    public int getIdTipoCambioCuenta() {
        return idTipoCambioCuenta;
    }

    public void setIdTipoCambioCuenta(int idTipoCambioCuenta) {
        this.idTipoCambioCuenta = idTipoCambioCuenta;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    public TipoCambioCuenta(){
        this.idTipoCambioCuenta = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    
    
    
    
}
