package controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class ContactController {
	
	private static final String regex = "^(.+)@(.+)$";
	
	@Autowired
	private WelcomeController wc;

    @Autowired
    private JavaMailSender javaMailSender;
	
	@PostMapping("mail")
	public String mail(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		// Recipient's email ID needs to be mentioned.
		Pattern pattern = Pattern.compile(regex);
	      String to = "narettolilian@hotmail.fr";

	      SimpleMailMessage msg = new SimpleMailMessage();
	      msg.setTo(to);
	      msg.setSubject(request.getParameter("subject"));
	      msg.setText("Mail from : "+request.getParameter("email")+"\n"+request.getParameter("message"));
	      if (pattern.matcher(request.getParameter("email")).matches()) {
	    	  session.setAttribute("envoye",1);
		      javaMailSender.send(msg);
	      }else {
	    	  session.setAttribute("envoye",0);
	      }
	      return wc.contact();
	}

}
