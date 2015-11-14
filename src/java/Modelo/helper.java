package Modelo;

import java.security.AuthProvider;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.Authenticator;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class helper {
    
    private String mailSMPTServer;
    private String mailSMPTServerPort;
    private String mailSenha;
    

    public static String getSerieValida(String x) {
        switch (x.length()) {
            case 1:
                return "00000" + x;
            case 2:
                return "0000" + x;
            case 3:
                return "000" + x;
            case 4:
                return "00" + x;
            case 5:
                return "0" + x;
            default:
                return x;
        }
    }

    public static String CadenaValidada(String xml) {
        if (xml == null || xml.equals("null")) {
            return "";
        } else {
            String functionReturnValue = null;
            functionReturnValue = xml;
            functionReturnValue = functionReturnValue.replace("&", "&amp;");
            functionReturnValue = functionReturnValue.replace(">", "&gt;");
            functionReturnValue = functionReturnValue.replace("<", "&lt;");
            functionReturnValue = functionReturnValue.replace("''", "&quot;");
            functionReturnValue = functionReturnValue.replace("'", "&apos;");
            functionReturnValue = functionReturnValue.replace("Á", "&#193;");
            functionReturnValue = functionReturnValue.replace("á", "&#225;");
            functionReturnValue = functionReturnValue.replace("É", "&#201;");
            functionReturnValue = functionReturnValue.replace("é", "&#233;");
            functionReturnValue = functionReturnValue.replace("Í", "&#205;");
            functionReturnValue = functionReturnValue.replace("í", "&#237;");
            functionReturnValue = functionReturnValue.replace("Ó", "&#211;");
            functionReturnValue = functionReturnValue.replace("ó", "&#243;");
            functionReturnValue = functionReturnValue.replace("Ú", "&#218;");
            functionReturnValue = functionReturnValue.replace("ú", "&#250;");
            functionReturnValue = functionReturnValue.replace("Ñ", "&#209;");
            functionReturnValue = functionReturnValue.replace("ñ", "&#241;");
            functionReturnValue = functionReturnValue.replace("`", "&#96;");
            functionReturnValue = functionReturnValue.replace("´", "&#180;");
            functionReturnValue = functionReturnValue.replace("¨", "&#168;");
            functionReturnValue = functionReturnValue.replace("ä", "&#228;");
            functionReturnValue = functionReturnValue.replace("ë", "&#235;");
            functionReturnValue = functionReturnValue.replace("ö", "&#246;");
            functionReturnValue = functionReturnValue.replace("ü", "&#252;");
            functionReturnValue = functionReturnValue.replace("à", "&#224;");
            functionReturnValue = functionReturnValue.replace("è", "&#232;");
            functionReturnValue = functionReturnValue.replace("ì", "&#236;");
            functionReturnValue = functionReturnValue.replace("ò", "&#242;");
            functionReturnValue = functionReturnValue.replace("ù", "&#249;");
            functionReturnValue = functionReturnValue.replace("ç", "&#231;");
            functionReturnValue = functionReturnValue.replace("Ç", "&#199;");
            functionReturnValue = functionReturnValue.replace("º", "&#186;");
            functionReturnValue = functionReturnValue.replace("”", "&#148;");
            functionReturnValue = functionReturnValue.replace("Ø", "&#216;");
            functionReturnValue = functionReturnValue.replace("È", "&#200;");
            functionReturnValue = functionReturnValue.replace("À", "&#192;");
            functionReturnValue = functionReturnValue.replace("½", "&#189;");
            functionReturnValue = functionReturnValue.replace("°", "&#176;");
            functionReturnValue = functionReturnValue.replace("ª", "&#170;");
            functionReturnValue = functionReturnValue.replace("¡", "&#161;");
            functionReturnValue = functionReturnValue.replace("!", "&#33;");
            functionReturnValue = functionReturnValue.replace("/", "&#47;");
            functionReturnValue = functionReturnValue.replace("¿", "&#191;");
            functionReturnValue = functionReturnValue.replace("?", "&#63;");
            functionReturnValue = functionReturnValue.replace("=", "&#61;");
            functionReturnValue = functionReturnValue.replace("[", "&#91;");
            functionReturnValue = functionReturnValue.replace("]", "&#93;");
            functionReturnValue = functionReturnValue.replace("\\", "&#92;");
            functionReturnValue = functionReturnValue.replace("^", "&#94;");
            functionReturnValue = functionReturnValue.replace("_", "&#95;");
            functionReturnValue = functionReturnValue.replace("{", "&#123;");
            functionReturnValue = functionReturnValue.replace("|", "&#124;");
            functionReturnValue = functionReturnValue.replace("}", "&#125;");
            functionReturnValue = functionReturnValue.replace("~", "&#126;");
            functionReturnValue = functionReturnValue.replace("¬", "&#172;");
            functionReturnValue = functionReturnValue.replace("¦", "&#161;");
            functionReturnValue = functionReturnValue.replace("¯", "&#175;");
            functionReturnValue = functionReturnValue.replace("·", "&#183;");
            functionReturnValue = functionReturnValue.replace("$", "&#36;");
            functionReturnValue = functionReturnValue.replace("%", "&#37;");
            functionReturnValue = functionReturnValue.replace("€", "&euro;");
            functionReturnValue = functionReturnValue.replace("—", "&#8212;");
            functionReturnValue = functionReturnValue.replace("™", "&#8482;");
            functionReturnValue = functionReturnValue.replace("–", "&#8230;");
            functionReturnValue = functionReturnValue.replace("‰", "&#8240;");
            functionReturnValue = functionReturnValue.replace("•", "&#8226;");
            functionReturnValue = functionReturnValue.replace("†", "&#8224;");
            functionReturnValue = functionReturnValue.replace("Ã", "&#195;");
            functionReturnValue = functionReturnValue.replace("Ç", "&#199;");
            functionReturnValue = functionReturnValue.replace("ã", "&#227;");
            return functionReturnValue;
        }
    }

    public static String getFechaValida(String x) throws ParseException {
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
        Date fecha = formateador.parse(x);
        formateador = new SimpleDateFormat("yyyy-MM-dd");
        return formateador.format(fecha);
    }

    public static String getMes(int x) throws ParseException {
        String mes = "";

        switch (x) {
            case 1:
                mes = "Enero";
                break;
            case 2:
                mes = "Febrero";
                break;
            case 3:
                mes = "Marzo";
                break;
            case 4:
                mes = "Abril";
                break;
            case 5:
                mes = "Mayo";
                break;
            case 6:
                mes = "Junio";
                break;
            case 7:
                mes = "Julio";
                break;
            case 8:
                mes = "Agosto";
                break;
            case 9:
                mes = "Setiembre";
                break;
            case 10:
                mes = "Octubre";
                break;
            case 11:
                mes = "Noviembre";
                break;
            case 12:
                mes = "Diciembre";
                break;
        }

        return mes;

    }
    
    public void SendMail(String from, String[] to, String subject, String message) throws AddressException{
    Properties prop = new Properties();
    
    
    mailSMPTServer = "smtp.googlemail.com";
    mailSMPTServerPort = "465";
    mailSenha = "slash123";
    
    prop.put("mail.transport.protocol", "smtp");
    prop.put("mail.smtp.starttls.enable", "true");
    prop.put("mail.smtp.host", mailSMPTServer);
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.smtp.user", from);
    prop.put("mail.debug", "true");
    prop.put("mail.smtp.port", mailSMPTServerPort);
    prop.put("mail.smtp.socketFactory.port", mailSMPTServerPort);
    prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    prop.put("mail.smtp.socketFactory.fallback", "false");
    
    
    SimpleAuth auth = null;
    auth = new SimpleAuth(from, mailSenha);
            
            Session session = Session.getDefaultInstance(prop,auth);
            session.setDebug(true);
            
            Message msg = new MimeMessage(session);
            
            
            InternetAddress[] addressTo = new InternetAddress[to.length];
            for (int i = 0; i < to.length; i++)
            {
                addressTo[i] = new InternetAddress(to[i]);
            }
            try{
                msg.setRecipients(Message.RecipientType.TO, addressTo);
                msg.setFrom(new InternetAddress(from));
                msg.setSubject(subject);
                msg.setContent(message,"text/html");
            }
            catch (Exception e){
                System.out.println("error al enviar mensaje");                        
            }
            
            Transport tr;
            try{
                
                tr = session.getTransport("smtp");
                tr.connect(mailSMPTServer,from,mailSenha);
                msg.saveChanges();
                tr.sendMessage(msg, msg.getAllRecipients());
                tr.close();
            
            }
            catch (Exception e){
            System.out.println("error al enviar mensaje");                        
            }
    
    }
    
    
    class SimpleAuth extends Authenticator{
    
        public String username = null;
        public String password = null;
        
        public SimpleAuth(String user, String pwd){
            username = user;
            password = pwd;
        }
        
        @Override
        protected PasswordAuthentication getPasswordAuthentication(){return new PasswordAuthentication(username,password);}
    
    }
    
    public static int getbit(boolean valor){
        if (valor){return 1;}
        else{return 0;}
    }
    
    
    public String getMailSMPTServer() {
        return mailSMPTServer;
    }

    public void setMailSMPTServer(String mailSMPTServer) {
        this.mailSMPTServer = mailSMPTServer;
    }

    public String getMailSMPTServerPort() {
        return mailSMPTServerPort;
    }

    public void setMailSMPTServerPort(String mailSMPTServerPort) {
        this.mailSMPTServerPort = mailSMPTServerPort;
    }

    public String getMailSenha() {
        return mailSenha;
    }

    public void setMailSenha(String mailSenha) {
        this.mailSenha = mailSenha;
    }
}
