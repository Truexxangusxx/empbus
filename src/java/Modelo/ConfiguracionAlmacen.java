package Modelo;

public class ConfiguracionAlmacen {

    private int idConfiguracionAlmacen;
    private Familia Familia;
    private String Descripcion;
    private Cuenta CuentaExistencias;
    private Cuenta CuentaCompras;
    private Cuenta CuentaVariacionExistencias;
    private Cuenta CuentaTransferencia;
    private Cuenta CuentaProducto;
    private Cuenta CuentaVariacionProducto;

    public int getIdConfiguracionAlmacen() {
        return idConfiguracionAlmacen;
    }

    public void setIdConfiguracionAlmacen(int idConfiguracionAlmacen) {
        this.idConfiguracionAlmacen = idConfiguracionAlmacen;
    }

    public Familia getFamilia() {
        return Familia;
    }

    public void setFamilia(Familia Familia) {
        this.Familia = Familia;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public Cuenta getCuentaExistencias() {
        return CuentaExistencias;
    }

    public void setCuentaExistencias(Cuenta CuentaExistencias) {
        this.CuentaExistencias = CuentaExistencias;
    }

    public Cuenta getCuentaCompras() {
        return CuentaCompras;
    }

    public void setCuentaCompras(Cuenta CuentaCompras) {
        this.CuentaCompras = CuentaCompras;
    }

    public Cuenta getCuentaVariacionExistencias() {
        return CuentaVariacionExistencias;
    }

    public void setCuentaVariacionExistencias(Cuenta CuentaVariacionExistencias) {
        this.CuentaVariacionExistencias = CuentaVariacionExistencias;
    }

    public Cuenta getCuentaTransferencia() {
        return CuentaTransferencia;
    }

    public void setCuentaTransferencia(Cuenta CuentaTransferencia) {
        this.CuentaTransferencia = CuentaTransferencia;
    }

    public Cuenta getCuentaProducto() {
        return CuentaProducto;
    }

    public void setCuentaProducto(Cuenta CuentaProducto) {
        this.CuentaProducto = CuentaProducto;
    }

    public Cuenta getCuentaVariacionProducto() {
        return CuentaVariacionProducto;
    }

    public void setCuentaVariacionProducto(Cuenta CuentaVariacionProducto) {
        this.CuentaVariacionProducto = CuentaVariacionProducto;
    }

    public ConfiguracionAlmacen() {
        this.CuentaCompras = new Cuenta();
        this.CuentaExistencias = new Cuenta();
        this.CuentaProducto = new Cuenta();
        this.CuentaTransferencia = new Cuenta();
        this.CuentaVariacionExistencias = new Cuenta();
        this.CuentaVariacionProducto = new Cuenta();
        this.Descripcion = "";
        this.Familia = new Familia();
        this.idConfiguracionAlmacen = 0;
    }
}
