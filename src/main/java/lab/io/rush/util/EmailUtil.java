package lab.io.rush.util;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class EmailUtil {
	
	private MailSender mailSender;
    private SimpleMailMessage simpleMailMessage;
	
    //spring 依赖注入
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}
	
	public void sendEmail(String subject, String content, String to) {
		simpleMailMessage.setSubject(subject);   //设置邮件主题
        simpleMailMessage.setTo(to);             //设定收件人
        simpleMailMessage.setText(content);      //设置邮件主题内容
        mailSender.send(simpleMailMessage);      //发送邮件
	}

}
