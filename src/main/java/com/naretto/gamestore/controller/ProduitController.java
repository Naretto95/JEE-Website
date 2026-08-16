package com.naretto.gamestore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.naretto.gamestore.enumeration.Categorie;
import com.naretto.gamestore.model.Produit;
import com.naretto.gamestore.service.ProduitService;

@Controller
public class ProduitController {

	private final ProduitService produitService;
	private final WelcomeController welcomeController;

	@Autowired
	public ProduitController(ProduitService produitService, WelcomeController welcomeController) {
		this.produitService = produitService;
		this.welcomeController = welcomeController;
	}

	@RequestMapping("/showProduit")
	public String showProduit(@RequestParam("id") int id, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.setAttribute("produit", produitService.findById(id));
		return welcomeController.item();
	}

	@PostMapping("/deleteProduit")
	public String deleteProduit(HttpSession session) {
		Produit produit = (Produit) session.getAttribute("produit");
		produitService.markUnavailable(produit);
		return findAll(session);
	}

	/** Lists every product currently on sale. */
	@RequestMapping("/getAllProduit")
	public String findAll(HttpSession session) {
		session.setAttribute("produits", produitService.findAllOnSale());
		return welcomeController.store();
	}

	@PostMapping(path = "/insertProduit", consumes = { "multipart/form-data" })
	public String createProduit(HttpServletRequest request, @RequestParam(value = "image") MultipartFile image, HttpSession session) {
		Categorie categorie = Categorie.valueOf(request.getParameter("categorie"));
		String titre = request.getParameter("titre");
		String description = request.getParameter("description");
		double prix = Double.parseDouble(request.getParameter("prix").replace(",", "."));
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		produitService.create(categorie, titre, description, prix, quantite, image);
		return findAll(session);
	}

}
