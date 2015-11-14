package Modelo;

public class Permiso {

    private int idPermiso;
    private int idOpcion;
    private int idUsuario;
    private String DOpcion;
    private String DUsuario;
    private int idModulo;
    private String DModulo;

    public int getIdPermiso() {
        return idPermiso;
    }

    public void setIdPermiso(int idPermiso) {
        this.idPermiso = idPermiso;
    }

    public int getIdOpcion() {
        return idOpcion;
    }

    public void setIdOpcion(int idOpcion) {
        this.idOpcion = idOpcion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDOpcion() {
        return DOpcion;
    }

    public void setDOpcion(String DOpcion) {
        this.DOpcion = DOpcion;
    }

    public String getDUsuario() {
        return DUsuario;
    }

    public void setDUsuario(String DUsuario) {
        this.DUsuario = DUsuario;
    }

    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public String getDModulo() {
        return DModulo;
    }

    public void setDModulo(String DModulo) {
        this.DModulo = DModulo;
    }

    public String xml(Usuario obj){
        return "<Permiso><idUsuario>"+idUsuario+"</idUsuario><idOpcion>"+idOpcion+"</idOpcion><Usuario>"+obj.getNick()+"</Usuario></Permiso>";
    }
    
}
