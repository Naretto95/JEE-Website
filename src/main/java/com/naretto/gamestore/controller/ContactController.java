package com.naretto.gamestore.controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ContactController {

	private static final Pattern EMAIL_PATTERN = Pattern.compile("^(.+)@(.+)$");

	private final WelcomeController welcomeController;
	private final JavaMailSender javaMailSender;

	@Value("${contact.recipient-email}")
	private String recipientEmail;

	@Autowired
	public ContactController(WelcomeController welcomeController, JavaMailSender javaMailSender) {
		this.welcomeController = welcomeController;
		this.javaMailSender = javaMailSender;
	}

	@PostMapping("mail")
	public String mail(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String senderEmail = request.getParameter("email");

		if (senderEmail != null && EMAIL_PATTERN.matcher(senderEmail).matches()) {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(recipientEmail);
			message.setSubject(request.getParameter("subject"));
			message.setText("Mail from: " + senderEmail + "\n" + request.getParameter("message"));
			javaMailSender.send(message);
			session.setAttribute("envoye", 1);
		} else {
			session.setAttribute("envoye", 0);
		}
		return welcomeController.contact();
	}

}
