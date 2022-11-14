package team1.mini2.dz3.auth.core;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:mail/mail.properties")
class MailAuthenticator extends Authenticator {
	
	private final String sender;
    private final String pwd;
    
    private MailAuthenticator(@Value("${sender}") String sender, @Value("${pwd}") String pwd){
    	this.sender = sender;
    	this.pwd = pwd;
    }
    
    String getSender() {
    	return sender;
    }
    
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(sender, pwd);
    }
}