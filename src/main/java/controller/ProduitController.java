package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import enumeration.Categorie;
import model.Produit;

@Controller
public class ProduitController {
	
	
	@Autowired
	private EntityManager em;
	
	@Autowired
	private WelcomeController wc;
	
	
	@RequestMapping("/showProduit")
	//afficher le produit cliqué
	public String showProduit(@RequestParam("id") int id, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.setAttribute("produit",findById(id));
		return wc.item();
	}
	
	
	//permet de récupérer un produit avec son id	
	Produit findById(int id){
		Query query = em.createNamedQuery("Produit.findById");
		query.setParameter("id", id);
		@SuppressWarnings("unchecked")
		List<Produit> results = query.getResultList();
		if( !results.isEmpty()) {
			return results.get(0);
		}
		return null;
	}
	
	
	//retourne la liste des produits pur une categorie donnee
	public List<Produit> findByCategorie(Categorie categorie){
		Query query = em.createNamedQuery("Produit.findByCategorie");
		query.setParameter("categorie",categorie.toString());
		@SuppressWarnings("unchecked")
		List<Produit> results = query.getResultList();
		return results;
	}
	
	@Transactional
	@PostMapping("/deleteProduit")
	public String deleteProduit(HttpSession session) {
		Produit produit = (Produit) session.getAttribute("produit");
		produit.setDisponibleEnVente((byte) 0);
		produit=em.merge(produit);
		return findAll(session);
	}
	
	
	//retourne tous les produits
	@RequestMapping("/getAllProduit")
	public String findAll(HttpSession session){
		Query query = em.createNamedQuery("Produit.findAll");
		@SuppressWarnings("unchecked")
		List<Produit> results = query.getResultList();
		session.setAttribute("produits",results);
		return wc.store();
	}
	
	@Transactional
	@PostMapping(path="/insertProduit", consumes = {"multipart/form-data"})
	//permet d'insérer un nouveau produit en base
	public String createProduit(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="image") MultipartFile f, HttpSession session) {
		Produit produit = new Produit();
		produit.setDisponibleEnVente((byte) 1);
		Categorie categorie = Categorie.valueOf(request.getParameter("categorie"));
		if (categorie!=null) {produit.setCategorie(categorie);}
		String description = request.getParameter("description");
		if (description!=null) {produit.setDescription(description);}
		String titre = request.getParameter("titre");
		if (titre!=null) {produit.setTitre(titre);}
		double prix = Double.parseDouble(request.getParameter("prix").replace(",","."));
		produit.setPrix(prix);
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		produit.setQuantite(quantite);
		String name = f.getOriginalFilename();
		Path path = Paths.get( new File("").getAbsolutePath()+"/src/main/resources/static/img/"+name);
		produit.setImage("img/"+name);
		try {
			Files.write(path, f.getBytes());
			/*
			InputStream inputStream = f.getInputStream();
			OutputStream os = new FileOutputStream(name);
			int readBytes = 0;
			byte[] buffer = new byte[100000];
			while ((readBytes = inputStream.read(buffer,0,100000))!=-1) {
				os.write(buffer,0,readBytes);
			}
			os.close();
			inputStream.close();
			*/
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		em.persist(produit);
		try {
			response.getWriter().write("{isSuccess: true}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return findAll(session);
	}
}
