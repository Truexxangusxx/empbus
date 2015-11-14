package Modelo;

public class Empleado {

    private int IdEmpleado;

    public int getIdEmpleado() {
        return IdEmpleado;
    }

    public void setIdEmpleado(int IdEmpleado) {
        this.IdEmpleado = IdEmpleado;
    }
    private String Nombre;

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre){
        this.Nombre = Nombre;
    }
    private String DNI;

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }
    private String Direccion;

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }
    private String Codigo;

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }
    private String Telefono1;

    public String getTelefono1() {
        return Telefono1;
    }

    public void setTelefono1(String Telefono1) {
        this.Telefono1 = Telefono1;
    }
    private String Telefono2;

    public String getTelefono2() {
        return Telefono2;
    }

    public void setTelefono2(String Telefono2) {
        this.Telefono2 = Telefono2;
    }
    private String Puesto;

    public String getPuesto() {
        return Puesto;
    }

    public void setPuesto(String Puesto) {
        this.Puesto = Puesto;
    }
    
    public Empleado(){
        this.IdEmpleado = 0;
        this.Nombre = "";
        this.Codigo = "";
    }
    
    public Empleado(int id, String nombre, String codigo){
        this.IdEmpleado = id;
        this.Nombre = nombre;
        this.Codigo = codigo;
    }
    
}
