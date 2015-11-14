package reportes;

import DAO.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRXmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;


public class Reporte {
    private JasperReport masterReport;
    private Map parametros = new HashMap();

    public static Reporte Cotizacion(String[] nombres,Object[] valores) {
        Reporte nuevo = new Reporte("Cotizacion.jasper");
        nuevo.setParametros(nombres,valores);
        return nuevo;
    }

    public Reporte(String reporte) {
        try{            
            URL master = getClass().getResource("/reportes/"+reporte);
            try
            {
                masterReport = (JasperReport)JRLoader.loadObject(master);
            }
            catch (Exception e)
            {
                throw e;
            }
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    public void setParametros(String[] nombres,Object[] valores){
        for (int i = 0;i<nombres.length;i++) {
            parametros.put(nombres[i],valores[i]);
        }
    }
    public void ponerParametro(String nombre,Object valor){
        parametros.put(nombre,valor);
    }
    public void exportarPDF(String archivo) throws JRException,SQLException,Exception{
        Connection cnn = DAO.Conexion.getConexion();
        JasperPrint jasperPrint = JasperFillManager.fillReport(masterReport,parametros,cnn);
        cnn.close();
        JasperExportManager.exportReportToPdfFile(jasperPrint,archivo);
    }
    public byte[] exportarPDFBytes() throws JRException,SQLException,Exception{
        Connection cnn = DAO.Conexion.getConexion();
        
        JasperPrint jasperPrint = JasperFillManager.fillReport(masterReport,parametros,cnn);
        
        //JasperPrintManager.printReport(jasperPrint, true);
        
        cnn.close();
        //return JasperExportManager.exportReportToPdf(jasperPrint);
        return JasperExportManager.exportReportToPdf(jasperPrint);
    }   
 
    public JasperReport getMasterReport() {
        return masterReport;
    }

    public Map getParametros() {
        return parametros;
    }
}