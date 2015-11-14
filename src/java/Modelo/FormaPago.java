package Modelo;

public class FormaPago {

    private int idFormaPago;
    private String Descripcion;

    public int getIdFormaPago() {
        return idFormaPago;
    }

    public void setIdFormaPago(int idFormaPago) {
        this.idFormaPago = idFormaPago;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    public FormaPago(){
    this.Descripcion = "";
    this.idFormaPago = 0;
    }
}
