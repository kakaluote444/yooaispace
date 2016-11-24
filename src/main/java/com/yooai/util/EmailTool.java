package com.yooai.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailTool {
	private Properties properties;
	private Session session;
	private String fromEmailHost;
	private String fromEmailName;
	private String fromEmailPassword;

	// 发送的内容
	private String subject;
	private String content;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public EmailTool(String configPath,String fromEmailHost, String fromEmailName,
			String fromEmailPassword) {
		super();
		this.fromEmailHost = fromEmailHost;
		this.fromEmailName = fromEmailName;
		this.fromEmailPassword = fromEmailPassword;
		initSession(configPath);
	}

	private void initSession(String path) {
		this.properties = new Properties();
//		InputStream inputStream = this.getClass().getClassLoader()
//				.getResourceAsStream("email.properties ");
		try {
			FileInputStream inputStream = new FileInputStream(path+"/email.properties");
			Properties prop = new Properties();
			this.properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (this.properties != null) {
			this.session = Session.getInstance(properties);
			this.session.setDebug(true);
		}
		System.out.println(this.properties);// TODO
	}

	public static void main(String[] args) {
		String path = "D:/WORKSPACE_EE/ME2015/yooaispace_v2.0/yooaispace/src/main/resources/";
		EmailTool emailTool = new EmailTool(path,"smtp.163.com", "18702604785","psw13870160279");
		emailTool.setSubject("友爱空间激活地址++++");
		emailTool.setContent("<a href='http://127.0.0.1:8080/yooaispace/user/c9f0f895fb98ab9159f51fd0297e236dfefg2354gdb/8'>我的第一封邮件在哪里？？？</a>");
		emailTool.SendEmailMsg("18702604785@163.com", "1099501218@qq.com");
	}

	private MimeMessage createSimpleMail(String fromEmail, String toEmail,
			String subject, String content) {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(this.session);
		// 指明邮件的发件人
		try {
			message.setFrom(new InternetAddress(fromEmail));
			// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(
					toEmail));
			// 邮件的标题
			message.setSubject(subject);
			// 邮件的文本内容
			message.setContent(content, "text/html;charset=UTF-8");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 返回创建好的邮件对象
		return message;
	}

	public void SendEmailMsg(String fromEmail, String toEmail) {
		try {
			Transport ts = session.getTransport();
			// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
			// ts.connect("smtp.163.com", "18702604785", "psw13870160279");
			ts.connect(this.fromEmailHost, this.fromEmailName,
					this.fromEmailPassword);
			// 4、创建邮件
			Message message = createSimpleMail(fromEmail, toEmail, subject,
					content);
			// 5、发送邮件
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
