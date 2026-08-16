package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;



/**
 * The persistent class for the ligne_commande database table.
 * 
 */
@Entity
@Table(name="ligne_commande")
@NamedQuery(name="LigneCommande.findAll", query="SELECT l FROM LigneCommande l")
@NamedQuery(name="LigneCommande.findById", query="SELECT l FROM LigneCommande l WHERE l.id = :id")
public class LigneCommande implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private int quantite=1;

	//bi-directional many-to-one association to Commande
	@ManyToOne (fetch = FetchType.EAGER)
	private Commande commande;
	
	//bi-directional many-to-one association to Produit
	@ManyToOne
	private Produit produit;

	public LigneCommande() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantite() {
		return this.quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public Commande getCommande() {
		return this.commande;
	}

	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	
	public Produit getProduit() {
		return this.produit;
	}

	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	
	public String toString() {
		return "ligne : Id = "+this.id;
	}

}