package Modelo;

public class DetalleConfiguracion {

    private int idDetalleConfiguracion;
    private int idConfiguracion;
    private Cuenta Cuenta;
    private CentroCosto CentroCosto;
    private boolean Cargo;

    public int getIdDetalleConfiguracion() {
        return idDetalleConfiguracion;
    }

    public void setIdDetalleConfiguracion(int idDetalleConfiguracion) {
        this.idDetalleConfiguracion = idDetalleConfiguracion;
    }

    public int getIdConfiguracion() {
        return idConfiguracion;
    }

    public void setIdConfiguracion(int idConfiguracion) {
        this.idConfiguracion = idConfiguracion;
    }

    public Cuenta getCuenta() {
        return Cuenta;
    }

    public void setCuenta(Cuenta Cuenta) {
        this.Cuenta = Cuenta;
    }

    public CentroCosto getCentroCosto() {
        return CentroCosto;
    }

    public void setCentroCosto(CentroCosto CentroCosto) {
        this.CentroCosto = CentroCosto;
    }

    public boolean isCargo() {
        return Cargo;
    }

    public void setCargo(boolean Cargo) {
        this.Cargo = Cargo;
    }

    public DetalleConfiguracion() {
        this.Cargo = false;
        this.CentroCosto = new CentroCosto();
        this.Cuenta = new Cuenta();
    }
    
    public String xml(){
        return "<DetalleConfiguracion>"
                + "<idDetalleConfiguracion>"+this.idDetalleConfiguracion+"</idDetalleConfiguracion>"
                + "<idConfiguracion>"+this.idConfiguracion+"</idConfiguracion>"
                + "<idCuenta>"+this.Cuenta.getIdCuenta()+"</idCuenta>"
                + "<idCentroCosto>"+this.CentroCosto.getIdCentroCosto()+"</idCentroCosto>"
                + "<Cargo>"+this.Cargo+"</Cargo>"
                + "</DetalleConfiguracion>";
    }
    
}
