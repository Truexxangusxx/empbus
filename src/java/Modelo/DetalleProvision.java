package Modelo;

public class DetalleProvision {

    private int IdDetalleProvision;

    public int getIdDetalleProvision() {
        return IdDetalleProvision;
    }

    public void setIdDetalleProvision(int IdDetalleProvision) {
        this.IdDetalleProvision = IdDetalleProvision;
    }
    private int IdProvision;

    public int getIdProvision() {
        return IdProvision;
    }

    public void setIdProvision(int IdProvision) {
        this.IdProvision = IdProvision;
    }
    private int IdIngreso;

    public int getIdIngreso() {
        return IdIngreso;
    }

    public void setIdIngreso(int IdIngreso) {
        this.IdIngreso = IdIngreso;
    }
    private int IdCuenta;

    public int getIdCuenta() {
        return IdCuenta;
    }

    public void setIdCuenta(int IdCuenta) {
        this.IdCuenta = IdCuenta;
    }
    private int IdCentroCosto;

    public int getIdCentroCosto() {
        return IdCentroCosto;
    }

    public void setIdCentroCosto(int IdCentroCosto) {
        this.IdCentroCosto = IdCentroCosto;
    }
    private double Importe;

    public double getImporte() {
        return Importe;
    }

    public void setImporte(double Importe) {
        this.Importe = Importe;
    }
  
    public String xml() {
        return "<DetalleProvision> <IdDetalleProvision>" + getIdDetalleProvision() + "</IdDetalleProvision> <IdProvision>" + getIdProvision() + "</IdProvision> <IdIngreso>" + getIdIngreso() + "</IdIngreso> <IdCuenta>" + this.Cuenta.getIdCuenta() + "</IdCuenta> <IdCentroCosto>" + this.CentroCosto.getIdCentroCosto() + "</IdCentroCosto> <Importe>" + getImporte() + "</Importe> <Descripcion>"+this.Descripcion+"</Descripcion><idOrdenProduccion>"+this.OrdenProduccion.getIdOrdenProduccion()+"</idOrdenProduccion></DetalleProvision>";
    }

    private Cuenta Cuenta;
    
    public Cuenta getCuenta() {
        return Cuenta;
    }

    public void setCuenta(Cuenta Cuenta) {
        this.Cuenta = Cuenta;
    }
    
    private CentroCosto CentroCosto;

    public CentroCosto getCentroCosto() {
        return CentroCosto;
    }

    public void setCentroCosto(CentroCosto CentroCosto) {
        this.CentroCosto = CentroCosto;
    }
    
    private String DIngreso;

    public String getDIngreso() {
        return DIngreso;
    }

    public void setDIngreso(String DIngreso) {
        this.DIngreso = DIngreso;
    }
    private String Referencia;

    public String getReferencia() {
        return Referencia;
    }

    public void setReferencia(String Referencia) {
        this.Referencia = Referencia;
    }
    
    private String Descripcion;

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    private OrdenProduccion OrdenProduccion;

    public OrdenProduccion getOrdenProduccion() {
        return OrdenProduccion;
    }

    public void setOrdenProduccion(OrdenProduccion OrdenProduccion) {
        this.OrdenProduccion = OrdenProduccion;
    }
    
    public DetalleProvision(){
        this.Cuenta = new Cuenta();
        this.CentroCosto = new CentroCosto();
        this.OrdenProduccion = new OrdenProduccion();
    }
}
