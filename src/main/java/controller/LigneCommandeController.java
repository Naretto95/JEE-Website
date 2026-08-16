package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Commande;
import model.LigneCommande;
import model.Produit;

@Controller
public class LigneCommandeController {

	@Autowired
	private CommandeController cc;
	
	
	
	@RequestMapping("/removeLigne")
	//retire la ligne  n°numLigne de la commande en cours
	public String removeLigne(HttpServletRequest request, @RequestParam("numLigne") int numLigne) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		LigneCommande lc = commande.getLigneCommandes().get(numLigne);
		if (lc!=null) {
			commande.removeLigneCommande(lc);			
		}
		return cc.focusOnCommande(request);
	}
	
	
	@PostMapping("/addProduit")
	//permet d'ajouter un produit au panier en cours de modifications
	public String addLigneCommande(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Commande commande = (Commande) session.getAttribute("commande");
		if (commande==null) {
			commande=new Commande();
		}
		LigneCommande lc = new LigneCommande();
		lc.setProduit((Produit)session.getAttribute("produit"));
		commande.addLigneCommande(lc);
		session.setAttribute("commande",commande);
		return cc.focusOnCommande(request);
	}
}
