package Modelo;

public class Estandar {

    private int IdEstandar;

    public int getIdEstandar() {
        return IdEstandar;
    }

    public void setIdEstandar(int IdEstandar) {
        this.IdEstandar = IdEstandar;
    }
    private int IdProductoPrincipal;

    public int getIdProductoPrincipal() {
        return IdProductoPrincipal;
    }

    public void setIdProductoPrincipal(int IdProductoPrincipal) {
        this.IdProductoPrincipal = IdProductoPrincipal;
    }
    private int IdProducto;

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    private int Cantidad;

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    private String DProductoPrincipal;
    private String DProducto;

    public String getDProductoPrincipal() {
        return DProductoPrincipal;
    }

    public void setDProductoPrincipal(String DProductoPrincipal) {
        this.DProductoPrincipal = DProductoPrincipal;
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }
    
    private String CodigoProductoPrincipal;
    private String CodigoProducto;

    public String getCodigoProductoPrincipal() {
        return CodigoProductoPrincipal;
    }

    public void setCodigoProductoPrincipal(String CodigoProductoTerminado) {
        this.CodigoProductoPrincipal = CodigoProductoTerminado;
    }

    public String getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(String CodigoProducto) {
        this.CodigoProducto = CodigoProducto;
    }
    
    public String xml(){
        return "<Estandar><idProductoPrincipal>"+IdProductoPrincipal+"</idProductoPrincipal><idProducto>"+IdProducto+"</idProducto><Cantidad>"+Cantidad+"</Cantidad></Estandar>";
    }
}
