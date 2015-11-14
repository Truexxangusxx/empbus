package Modelo;

public class TipoConfiguracionCuenta {

    private int idTipoConfiguracionCuenta;
    private String Codigo;
    private String Descripcion;

    public int getIdTipoConfiguracionCuenta() {
        return idTipoConfiguracionCuenta;
    }

    public void setIdTipoConfiguracionCuenta(int idTipoConfiguracionCuenta) {
        this.idTipoConfiguracionCuenta = idTipoConfiguracionCuenta;
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
    
    public TipoConfiguracionCuenta(){
        this.idTipoConfiguracionCuenta = 0;
        this.Descripcion="";
        this.Codigo="";
    }
    
    
    
    
    
}
