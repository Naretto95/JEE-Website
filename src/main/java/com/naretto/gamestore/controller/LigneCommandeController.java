package com.naretto.gamestore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naretto.gamestore.model.Commande;
import com.naretto.gamestore.model.LigneCommande;
import com.naretto.gamestore.model.Produit;

@Controller
public class LigneCommandeController {

	private final CommandeController commandeController;

	@Autowired
	public LigneCommandeController(CommandeController commandeController) {
		this.commandeController = commandeController;
	}

	@RequestMapping("/removeLigne")
	public String removeLigne(HttpServletRequest request, @RequestParam("numLigne") int numLigne) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		LigneCommande ligne = commande.getLigneCommandes().get(numLigne);
		if (ligne != null) {
			commande.removeLigneCommande(ligne);
		}
		return commandeController.focusOnCommande(request);
	}

	@PostMapping("/addProduit")
	public String addLigneCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		if (commande == null) {
			commande = new Commande();
		}
		LigneCommande ligne = new LigneCommande();
		ligne.setProduit((Produit) session.getAttribute("produit"));
		commande.addLigneCommande(ligne);
		session.setAttribute("commande", commande);
		return commandeController.focusOnCommande(request);
	}

}
