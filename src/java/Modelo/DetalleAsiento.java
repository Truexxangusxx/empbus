package Modelo;

public class DetalleAsiento {

    private int idDetalleAsiento;
    private int idAsiento;
    private Cuenta Cuenta;
    private CentroCosto CentroCosto;
    private double CargoMN;
    private double AbonoMN;
    private double CargoME;
    private double AbonoME;
    private String Glosa;

    public Cuenta getCuenta() {
        return Cuenta;
    }

    public void setCuenta(Cuenta Cuenta) {
        this.Cuenta = Cuenta;
    }

    public CentroCosto getCentroCosto() {
        return CentroCosto;
    }

    public void setCentroCosto(CentroCosto CentroCosto) {
        this.CentroCosto = CentroCosto;
    }

    public double getCargoMN() {
        return CargoMN;
    }

    public void setCargoMN(double CargoMN) {
        this.CargoMN = CargoMN;
    }

    public double getAbonoMN() {
        return AbonoMN;
    }

    public void setAbonoMN(double AbonoMN) {
        this.AbonoMN = AbonoMN;
    }

    public double getCargoME() {
        return CargoME;
    }

    public void setCargoME(double CargoME) {
        this.CargoME = CargoME;
    }

    public double getAbonoME() {
        return AbonoME;
    }

    public void setAbonoME(double AbonoME) {
        this.AbonoME = AbonoME;
    }

    public String getGlosa() {
        return Glosa;
    }

    public void setGlosa(String Glosa) {
        this.Glosa = Glosa;
    }

    public DetalleAsiento() {
        this.Cuenta = new Cuenta();
        this.CentroCosto = new CentroCosto();
    }

    public int getIdDetalleAsiento() {
        return idDetalleAsiento;
    }

    public void setIdDetalleAsiento(int idDetalleAsiento) {
        this.idDetalleAsiento = idDetalleAsiento;
    }

    public int getIdAsiento() {
        return idAsiento;
    }

    public void setIdAsiento(int idAsiento) {
        this.idAsiento = idAsiento;
    }

    public String xml() {
        return "<DetalleAsiento>"
                + "<idDetalleAsiento>" + this.idDetalleAsiento + "</idDetalleAsiento>"
                + "<idAsiento>" + this.idAsiento + "</idAsiento>"
                + "<idCuenta>" + this.Cuenta.getIdCuenta() + "</idCuenta>"
                + "<idCentroCosto>" + this.CentroCosto.getIdCentroCosto() + "</idCentroCosto>"
                + "<CargoMN>" + this.CargoMN + "</CargoMN>"
                + "<AbonoMN>" + this.AbonoMN + "</AbonoMN>"
                + "<CargoME>" + this.CargoME + "</CargoME>"
                + "<AbonoME>" + this.AbonoME + "</AbonoME>"
                + "<Glosa>" + this.Glosa + "</Glosa>"
                + "</DetalleAsiento>";
    }
}
