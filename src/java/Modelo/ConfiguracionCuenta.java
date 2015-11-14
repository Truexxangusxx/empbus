package Modelo;

public class ConfiguracionCuenta {

    private Cuenta Cuenta;
    private String Descripcion;
    private int idTipoConfiguracionCuenta;
    private boolean ExigeCC;
    private int idClase;
    private int idNaturaleza;
    private int idMoneda;
    private int idTipoAuxiliar;
    private int idAjuste;
    private int idTipoCambioCuenta;
    private Cuenta Cargo;
    private Cuenta Abono;
    private int idConfiguracionCuenta;

    public Cuenta getCuenta() {
        return Cuenta;
    }

    public void setCuenta(Cuenta Cuenta) {
        this.Cuenta = Cuenta;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getIdTipoConfiguracionCuenta() {
        return idTipoConfiguracionCuenta;
    }

    public void setIdTipoConfiguracionCuenta(int idTipoConfiguracionCuenta) {
        this.idTipoConfiguracionCuenta = idTipoConfiguracionCuenta;
    }

    public boolean isExigeCC() {
        return ExigeCC;
    }

    public void setExigeCC(boolean ExigeCC) {
        this.ExigeCC = ExigeCC;
    }

    public int getIdClase() {
        return idClase;
    }

    public void setIdClase(int idClase) {
        this.idClase = idClase;
    }

    public int getIdNaturaleza() {
        return idNaturaleza;
    }

    public void setIdNaturaleza(int idNaturaleza) {
        this.idNaturaleza = idNaturaleza;
    }

    public int getIdMoneda() {
        return idMoneda;
    }

    public void setIdMoneda(int idMoneda) {
        this.idMoneda = idMoneda;
    }

    public int getIdTipoAuxiliar() {
        return idTipoAuxiliar;
    }

    public void setIdTipoAuxiliar(int idTipoAuxiliar) {
        this.idTipoAuxiliar = idTipoAuxiliar;
    }

    public int getIdAjuste() {
        return idAjuste;
    }

    public void setIdAjuste(int idAjuste) {
        this.idAjuste = idAjuste;
    }

    public int getIdTipoCambioCuenta() {
        return idTipoCambioCuenta;
    }

    public void setIdTipoCambioCuenta(int idTipoCambioCuenta) {
        this.idTipoCambioCuenta = idTipoCambioCuenta;
    }

    public Cuenta getCargo() {
        return Cargo;
    }

    public void setCargo(Cuenta Cargo) {
        this.Cargo = Cargo;
    }

    public Cuenta getAbono() {
        return Abono;
    }

    public void setAbono(Cuenta Abono) {
        this.Abono = Abono;
    }

    public ConfiguracionCuenta() {
        this.Cuenta = new Cuenta();
        this.Descripcion = "";
        this.idTipoConfiguracionCuenta = 0;
        this.ExigeCC = false;
        this.idClase = 0;
        this.idNaturaleza = 0;
        this.idMoneda = 0;
        this.idTipoAuxiliar = 0;
        this.idAjuste = 0;
        this.idTipoCambioCuenta = 0;
        this.Cargo = new Cuenta();
        this.Abono = new Cuenta();
        this.idConfiguracionCuenta = 0;
    }

    public int getIdConfiguracionCuenta() {
        return idConfiguracionCuenta;
    }

    public void setIdConfiguracionCuenta(int idConfiguracionCuenta) {
        this.idConfiguracionCuenta = idConfiguracionCuenta;
    }
}
