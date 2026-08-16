package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.User;

@Controller
//le controlleur qui redirige vers toutes les jsp
public class WelcomeController {
	

	@Value("${welcome.message:test}")
    private String message = "";
	
	@Autowired
	private UserController uc;
	

    @RequestMapping("/")
    public String index() {
        return "index";
    }  
    
    @RequestMapping("/item")
    public String item() {
    	return "item";
    }
    
    @RequestMapping("/login")
    public String inscription(Model model) {
    	model.addAttribute("user",new User());
        return "login";
    }
    
    
    @RequestMapping("/contact")
    public String contact() {
    	return "contact";
    }
    
    @Transactional
    @RequestMapping("/profile")
    public String profile(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		User user2 = (User) session.getAttribute("user");
    	if(user2!=null) {
    		user2 = uc.findById(user2.getId());
    		session.setAttribute("user2",user2);
        	return "profile";
    	}else {
    		return inscription(model);
    	}
    }
    
    @RequestMapping("/cart")
    public String cart() {
    	return "cart";
    }
    
    @RequestMapping("/store")
    public String store() {
    	return "store";
    }
	
}
