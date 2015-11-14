package Modelo;

public class DetalleTareo {

    private int idDetalleTareo;
    private int idTareo;
    private Empleado Empleado;
    private OrdenProduccion OrdenProduccion;
    private Actividad Actividad;
    private CentroCosto CentroCosto;
    private String Descripcion;
    private double HoraInicio;
    private double HoraFin;
    private double Horas;

    public int getIdDetalleTareo() {
        return idDetalleTareo;
    }

    public void setIdDetalleTareo(int idDetalleTareo) {
        this.idDetalleTareo = idDetalleTareo;
    }

    public int getIdTareo() {
        return idTareo;
    }

    public void setIdTareo(int idTareo) {
        this.idTareo = idTareo;
    }

    public Empleado getEmpleado() {
        return Empleado;
    }

    public void setEmpleado(Empleado Empleado) {
        this.Empleado = Empleado;
    }

    public OrdenProduccion getOrdenProduccion() {
        return OrdenProduccion;
    }

    public void setOrdenProduccion(OrdenProduccion OrdenProduccion) {
        this.OrdenProduccion = OrdenProduccion;
    }

    public Actividad getActividad() {
        return Actividad;
    }

    public void setActividad(Actividad Actividad) {
        this.Actividad = Actividad;
    }

    public CentroCosto getCentroCosto() {
        return CentroCosto;
    }

    public void setCentroCosto(CentroCosto CentroCosto) {
        this.CentroCosto = CentroCosto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getHoraInicio() {
        return HoraInicio;
    }

    public void setHoraInicio(double HoraInicio) {
        this.HoraInicio = HoraInicio;
    }

    public double getHoraFin() {
        return HoraFin;
    }

    public void setHoraFin(double HoraFin) {
        this.HoraFin = HoraFin;
    }

    public double getHoras() {
        return Horas;
    }

    public void setHoras(double Horas) {
        this.Horas = Horas;
    }
    
    public DetalleTareo(){
        this.Actividad = new Actividad();
        this.CentroCosto = new CentroCosto();
        this.Empleado = new Empleado();
        this.OrdenProduccion = new OrdenProduccion();
    }
    
    public String xml() {
        return "<DetalleTareo> <idTareo>" + this.idTareo + "</idTareo> <idEmpleado>" + this.Empleado.getIdEmpleado() + "</idEmpleado> <idOrdenProduccion>" + this.OrdenProduccion.getIdOrdenProduccion() + "</idOrdenProduccion> <idActividad>" + this.Actividad.getIdActividad() + "</idActividad> <idCentroCosto>" + this.CentroCosto.getIdCentroCosto() + "</idCentroCosto> <Descripcion>"+this.Descripcion+"</Descripcion><HoraInicio>"+this.HoraInicio+"</HoraInicio><HoraFin>"+this.HoraFin+"</HoraFin><Horas>"+this.Horas+"</Horas></DetalleTareo>";
    }
    
    
    
}
