package controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import model.User;

@Controller
public class UserController {

	@Autowired
	private EntityManager em;
	
	@Autowired 
	private WelcomeController wc;
	
	
	@GetMapping("disconnect")
	public String disconnect(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return wc.inscription(model);
	}
	
	@Transactional
	public User findById(int id) {
		Query query = em.createNamedQuery("User.findById");
		query.setParameter("id",id);
		return (User) query.getSingleResult();
	}
	
	@Transactional
	@PostMapping("/changePass")
	//change le mot de passe
	public String changePass(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String newPass2 = request.getParameter("newPass2");
		if(user!=null && user.getMdp().equals(oldPass) && newPass.equals(newPass2)) {
			user.setMdp(newPass);
			user = em.merge(user);
		}
		return wc.profile(model,request);
	}
	
	@PostMapping("/getUser")
	//vérifie si un utilisaeur existe deja dans la base
	public String findByIdentifiantAndMotdepasse(HttpServletRequest request, Model model){
		Query query = em.createNamedQuery("User.findUserByEmailAndMotDePasse");
		query.setParameter("adresseMail", request.getParameter("email"));
		query.setParameter("mdp", request.getParameter("mdp"));
		@SuppressWarnings("unchecked")
		List<User> results = query.getResultList();
		if (!results.isEmpty()) {
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(5*60);
			session.setAttribute("user",results.get(0));
			return wc.index();
		}else {
			return wc.inscription(model);
		}
	}
	
	@Transactional
	@PostMapping(path="/insertUser")
	//permet de creer un nouvel utilisateur
	public String createUser(@Validated @ModelAttribute("user") User user, HttpServletRequest request){
		HttpSession session = request.getSession(true);
		this.em.persist(user);
		session.setAttribute("user",user);
		return wc.index();
	}

}