package com.walkerChen.estore.commonUtils;

import java.net.InetAddress;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailUtils {
	
	public static void sendEamil(String to , String activecode) throws Exception{
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.auth", "true");
		//mail.smtp.host String The SMTP server to connect to. 
		props.setProperty("mail.smtp.host", "localhost");
		//The SMTP server port to connect to, if the connect() method doesn't explicitly specify one. Defaults to 25
		props.setProperty("mail.smtp.port", "25");
		//一个新的模式出现策略模式，Authenticator类是抽象对象，对提供的方法进行重写
		//以下的重写方式相当于，Authenticator抽象类自己实现自己成一个实体类
		Session session = Session.getInstance(props, new Authenticator(){
			//The PasswordAuthentication collected from the user, or null if none is provided
			protected PasswordAuthentication getPasswordAuthentication(){
				//The class PasswordAuthentication is a data holder that is used by Authenticator. It is simply a repository for a user name and a password
				PasswordAuthentication authentication = new PasswordAuthentication("service@baihoo.com","12345");
				return authentication;
			}
		});
		InetAddress inetAddress = InetAddress.getLocalHost();
		String ip = inetAddress.getHostAddress();
		session.setDebug(true);
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("service@baihoo.com"));
		message.setSubject("来自《baiHoo时尚》 激活邮件");
		message.setContent("<h1>来自 《baiHoo时尚》 的官网激活邮件</h1><h3><a href='http://"+ip+":8080/ZProjectDevelop1_SSH/user_activeAction?activecode="+activecode+"'>"
						+"http://"+ip+"/ZProjectDevelop1_SSH/user_activeAction?activecode="+activecode+"</a></h3>", "text/html;charset=UTF-8");
		message.setRecipients(RecipientType.TO, InternetAddress.parse(to));
		
		Transport.send(message);//静态的会发送后自动关闭资源
	}
}
