package Modelo;

public class PedidoProducto {

    private int IdPedidoProducto;

    public int getIdPedidoProducto() {
        return IdPedidoProducto;
    }

    public void setIdPedidoProducto(int IdPedidoProducto) {
        this.IdPedidoProducto = IdPedidoProducto;
    }
    private int IdPedido;

    public int getIdPedido() {
        return IdPedido;
    }

    public void setIdPedido(int IdPedido) {
        this.IdPedido = IdPedido;
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
    private String Glosa;

    public String getGlosa() {
        return Glosa;
    }

    public void setGlosa(String Glosa) {
        this.Glosa = Glosa;
    }
    
    private String DProducto;
    private String CodigoProducto;
    private int Estandar;

    public String xml() {
        return "<PedidoProducto><idProducto>"+IdProducto+"</idProducto><Cantidad>"+Cantidad+"</Cantidad><Glosa>"+Glosa+"</Glosa></PedidoProducto>";
    }

    public String getDProducto() {
        return DProducto;
    }

    public void setDProducto(String DProducto) {
        this.DProducto = DProducto;
    }

    public String getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(String CodigoProducto) {
        this.CodigoProducto = CodigoProducto;
    }
    
    public String tabla() {
        return "<tr><td>"+CodigoProducto+"</td><td>"+DProducto+"</td><td>"+Cantidad+"</td><td>"+Glosa+"</td></tr>";
    }

    public int getEstandar() {
        return Estandar;
    }

    public void setEstandar(int Estandar) {
        this.Estandar = Estandar;
    }
    
}
