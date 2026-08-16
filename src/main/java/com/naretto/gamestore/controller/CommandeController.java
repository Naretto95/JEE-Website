package com.naretto.gamestore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naretto.gamestore.model.Commande;
import com.naretto.gamestore.model.LigneCommande;
import com.naretto.gamestore.model.User;
import com.naretto.gamestore.service.CommandeService;

@Controller
public class CommandeController {

	private final CommandeService commandeService;
	private final WelcomeController welcomeController;

	@Autowired
	public CommandeController(CommandeService commandeService, WelcomeController welcomeController) {
		this.commandeService = commandeService;
		this.welcomeController = welcomeController;
	}

	@PostMapping("/selectThisCommande")
	public String findById(HttpServletRequest request, @RequestParam("id") int id) {
		HttpSession session = request.getSession(true);
		Commande commande = commandeService.findById(id);
		if (commande != null) {
			session.setAttribute("commande", commande);
		}
		return welcomeController.cart();
	}

	@PostMapping("/getAllCommands")
	@ResponseBody
	public List<Commande> findAll() {
		return commandeService.findAll();
	}

	@RequestMapping("/createCommande")
	@ResponseBody
	public Commande createCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		Commande commande = commandeService.create(user);
		if (commande != null) {
			session.setAttribute("commande", commande);
		}
		return commande;
	}

	/** Displays the cart/order currently being edited in session. */
	@RequestMapping("/focusOnCommande")
	public String focusOnCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		Commande commande = (Commande) session.getAttribute("commande");
		if (commande == null) {
			commande = new Commande();
		}
		if (user != null) {
			commande.setUser(user);
		}
		session.setAttribute("commande", commande);
		return welcomeController.cart();
	}

	@RequestMapping("/instantePushToBdd")
	public String saveToBdd(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		commande = commandeService.save(commande);
		session.setAttribute("commande", commande);
		return welcomeController.cart();
	}

	@PostMapping("/saveTheCommande")
	public String saveCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		List<LigneCommande> lignes = commande.getLigneCommandes();
		for (int i = 0; i < lignes.size(); i++) {
			lignes.get(i).setQuantite(Integer.parseInt(request.getParameter(String.valueOf(i))));
		}
		return saveToBdd(request);
	}

}
