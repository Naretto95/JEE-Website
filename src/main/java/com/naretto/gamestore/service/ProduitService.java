package com.naretto.gamestore.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.naretto.gamestore.enumeration.Categorie;
import com.naretto.gamestore.model.Produit;
import com.naretto.gamestore.repository.ProduitRepository;

@Service
public class ProduitService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProduitService.class);

	private final ProduitRepository produitRepository;

	@Autowired
	public ProduitService(ProduitRepository produitRepository) {
		this.produitRepository = produitRepository;
	}

	public Produit findById(int id) {
		return produitRepository.findById(id).orElse(null);
	}

	/** Products currently offered for sale in the store. */
	public List<Produit> findAllOnSale() {
		return produitRepository.findByDisponibleEnVente((byte) 1);
	}

	public List<Produit> findByCategorie(Categorie categorie) {
		return produitRepository.findByCategorie(categorie);
	}

	@Transactional
	public void markUnavailable(Produit produit) {
		produit.setDisponibleEnVente((byte) 0);
		produitRepository.save(produit);
	}

	@Transactional
	public Produit create(Categorie categorie, String titre, String description, double prix, int quantite, MultipartFile image) {
		Produit produit = new Produit();
		produit.setDisponibleEnVente((byte) 1);
		produit.setCategorie(categorie);
		produit.setTitre(titre);
		produit.setDescription(description);
		produit.setPrix(prix);
		produit.setQuantite(quantite);
		produit.setImage(storeImage(image));
		return produitRepository.save(produit);
	}

	/**
	 * Saves the uploaded image under a generated file name so a crafted original
	 * file name can never escape the target directory or overwrite another file.
	 */
	private String storeImage(MultipartFile image) {
		if (image == null || image.isEmpty()) {
			return "";
		}
		String originalName = image.getOriginalFilename();
		String extension = "";
		if (originalName != null && originalName.contains(".")) {
			extension = originalName.substring(originalName.lastIndexOf('.'));
		}
		String generatedName = UUID.randomUUID() + extension;
		Path destination = Paths.get(new File("").getAbsolutePath(), "src", "main", "resources", "static", "img", generatedName);
		try {
			Files.write(destination, image.getBytes());
		} catch (IOException e) {
			LOGGER.error("Failed to store uploaded product image '{}'", generatedName, e);
			return "";
		}
		return "img/" + generatedName;
	}

}
