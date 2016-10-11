/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gianma
 */
public class PwRecoveryServlet extends HttpServlet {
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String receiver_mail = request.getParameter("username");
        final String servername = "eat.here.noreply@gmail.com";
        final String serverpw = "pallamano9900";
        
        Properties props = System.getProperties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "465");
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.debug", true);
        
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(servername, serverpw);
            };
        });
        
        Message msg = new MimeMessage(session);
        
        try {
            msg.setFrom(new InternetAddress(serverpw));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver_mail,false));
            msg.setSubject("Hello world!");
            msg.setText("What's up?");
            msg.setSentDate(new java.util.Date());
            
            Transport transport = session.getTransport("smtps");
            transport.connect("smtp.gmail.com", 465, servername, serverpw);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            
        } catch (AddressException ex) {
            Logger.getLogger(PwRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(PwRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect(request.getContextPath()+"/login_page.jsp");
    }

}
