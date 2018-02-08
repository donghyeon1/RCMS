package donghyeon.rcms.user.find.util;

import java.util.Properties;

import javax.mail.*;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public  class SendMail {
	public static int sendInquiryAnswer(String recipient, String title, String body) {
		return sendEmail(recipient,title,body);
	}
	
	
	//메일 보내기 공통부분, 파라미터 받는사람, 제목, 내용
	//성공하면 1 반환 오류시 2반환
   private static int sendEmail(String recipient,String subject,String body) {
       String host = "smtp.naver.com";
       final String username = "smtpsus3311@naver.com";
       final String password = "1q2w3e!";
       String port="465";
       try {
       Properties props = System.getProperties();
       		
       props.put("mail.smtp.host", host);
       props.put("mail.smtp.port", port);
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.ssl.enable", "true");
       props.put("mail.smtp.ssl.trust", host);
       	//security Socket Layer
     
       Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
           String un=username;
           String pw=password;
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(un, pw);
           }
       });

       session.setDebug(true); //for debug
       
       Message mimeMessage = new MimeMessage(session);
       
       mimeMessage.setFrom(new InternetAddress("AwesomeCar"));
       mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
       mimeMessage.setSubject(subject);
       mimeMessage.setText(body);
       Transport.send(mimeMessage);
       return 1;
       
       } catch(MessagingException e) {
    	   return 2;
       } 

   }
}  
 

