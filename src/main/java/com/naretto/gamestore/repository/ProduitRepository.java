package com.naretto.gamestore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.naretto.gamestore.enumeration.Categorie;
import com.naretto.gamestore.model.Produit;

public interface ProduitRepository extends JpaRepository<Produit, Integer> {

	List<Produit> findByDisponibleEnVente(byte disponibleEnVente);

	List<Produit> findByCategorie(Categorie categorie);

}
