package Modelo;

public class Configuracion {

    private int idConfiguracion;
    private Subdiario Subdiario;
    private Familia Familia;
    private String Descripcion;

    public int getIdConfiguracion() {
        return idConfiguracion;
    }

    public void setIdConfiguracion(int idConfiguracion) {
        this.idConfiguracion = idConfiguracion;
    }

    public Subdiario getSubdiario() {
        return Subdiario;
    }

    public void setSubdiario(Subdiario Subdiario) {
        this.Subdiario = Subdiario;
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

    public Configuracion() {
        this.Descripcion = "";
        this.Familia = new Familia();
        this.Subdiario = new Subdiario();
        this.idConfiguracion = 0;
    }
}
