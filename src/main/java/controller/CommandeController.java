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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Commande;
import model.User;

@Controller
public class CommandeController {
	
	@Autowired 
	private EntityManager em;
	
	@Autowired
	private WelcomeController wc;
	
	@PostMapping("/selectThisCommande")
	//affiche une commande en lui passant son identifiant
	public String findById(HttpServletRequest request, @RequestParam("id") int id){
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		Query query = em.createNamedQuery("Command.findById");
		query.setParameter("id", id);
		@SuppressWarnings("unchecked")
		List<Commande> results = query.getResultList();
		if(!results.isEmpty()) {
			commande = results.get(0);
		}
		session.setAttribute("commande",commande);
		return wc.cart();
	}
	
	@PostMapping("/getAllCommands")
	//récupère toutes les commandes
	public List<Commande> findAll(){
		Query query = em.createNamedQuery("Commande.findAll");
		@SuppressWarnings("unchecked")
		List<Commande> results = query.getResultList();
		return results;
	}
	
	@RequestMapping("/showMyCommands")
	//afficher ses commandes
	public String showMyCommand(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			session.setAttribute("mescommandes",findByUser(user));
			return "";
		}else {
			return wc.inscription(model);
		}
	}
	
	
	//récupère les commandes de l'utilisateur logé
	public List<Commande> findByUser(User user){
		if (user!=null) {
			Query query = em.createNamedQuery("Commande.findByUser");
			query.setParameter("user", user);
			@SuppressWarnings("unchecked")
			List<Commande> results = query.getResultList();
			return results;
		}else {
			return null;
		}
		
	}
	
	@Transactional
	@RequestMapping("/createCommande")
	//si un utilisateur est logé, retourne une nouvelle commande pour cet utilisateur
	public Commande createCommande(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			Commande commande = new Commande();
			commande.setUser(user);
			em.persist(commande);
			session.setAttribute("commande",commande);
			return commande;
		}else {
			return null;
		}
	}
	
	
	@RequestMapping("/focusOnCommande")
	//affiche le panier/commande en cours de modifications
	public String focusOnCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		Commande commande = (Commande) session.getAttribute("commande");
		if(commande==null) {
			commande = new Commande();
		}
		if (user!=null) {
			commande.setUser(user);
		}
		session.setAttribute("commande",commande);
		return wc.cart();
	}
	
	@Transactional
	@RequestMapping("/instantePushToBdd")
	//simple merge de la commande en cours vers la base
	public String saveToBdd(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		commande=em.merge(commande);
		session.setAttribute("commande",commande);
		return wc.cart();
	}
	
	@Transactional
	@PostMapping("/saveTheCommande")
	//recalculer les prix affichés et sauvegarder en base
	public String saveCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		for (int i =0 ; i<commande.getLigneCommandes().size();i++) {
			commande.getLigneCommandes().get(i).setQuantite(Integer.parseInt(request.getParameter(i+"")));
		}
		return saveToBdd(request);
	}

}
