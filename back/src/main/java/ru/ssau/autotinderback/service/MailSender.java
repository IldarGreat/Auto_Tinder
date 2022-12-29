package ru.ssau.autotinderback.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MailSender {
    private final JavaMailSender javaMailSender;
    @Value("${spring.mail.username}")
    private String username;

    public void send(String emailTo,String text,String subject){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(username);
        mailMessage.setTo(emailTo);
        mailMessage.setText(text);
        mailMessage.setSubject(subject);
        javaMailSender.send(mailMessage);
    }
}
