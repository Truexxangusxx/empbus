package Modelo;

public class DetalleConfiguracionAlmacen {
    private int idDetalleConfiguracionAlmacen;
    private int idConfiguracionAlmacen;
    private CentroCosto CentroCosto;
    private Cuenta Cuenta;

    public int getIdDetalleConfiguracionAlmacen() {
        return idDetalleConfiguracionAlmacen;
    }

    public void setIdDetalleConfiguracionAlmacen(int idDetalleConfiguracionAlmacen) {
        this.idDetalleConfiguracionAlmacen = idDetalleConfiguracionAlmacen;
    }

    public CentroCosto getCentroCosto() {
        return CentroCosto;
    }

    public void setCentroCosto(CentroCosto CentroCosto) {
        this.CentroCosto = CentroCosto;
    }

    public Cuenta getCuenta() {
        return Cuenta;
    }

    public void setCuenta(Cuenta Cuenta) {
        this.Cuenta = Cuenta;
    }
    
    public DetalleConfiguracionAlmacen(){
        this.CentroCosto = new CentroCosto();
        this.Cuenta = new Cuenta();
        this.idDetalleConfiguracionAlmacen = 0;
        this.idConfiguracionAlmacen = 0;
    }
    
    public String xml() {
        return "<DetalleConfiguracionAlmacen><IdConfiguracionAlmacen>" + this.idConfiguracionAlmacen + "</IdConfiguracionAlmacen><IdCentroCosto>" + this.CentroCosto.getIdCentroCosto() + "</IdCentroCosto><IdCuenta>" + this.Cuenta.getIdCuenta() + "</IdCuenta></DetalleConfiguracionAlmacen>";
    }

    public int getIdConfiguracionAlmacen() {
        return idConfiguracionAlmacen;
    }

    public void setIdConfiguracionAlmacen(int idConfiguracionAlmacen) {
        this.idConfiguracionAlmacen = idConfiguracionAlmacen;
    }
    
}
