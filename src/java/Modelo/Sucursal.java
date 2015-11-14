package Modelo;

public class Sucursal {

    private int IdSucursal;

    public int getIdSucursal() {
        return IdSucursal;
    }

    public void setIdSucursal(int IdSucursal) {
        this.IdSucursal = IdSucursal;
    }
    private String Descripcion;

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    private String Direccion;

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }
    
    public Sucursal(){
    this.IdSucursal = 0;
    this.Descripcion = "";
    }
    
    public Sucursal(int id, String descripcion){
    this.IdSucursal = id;
    this.Descripcion = descripcion;
    }

}
