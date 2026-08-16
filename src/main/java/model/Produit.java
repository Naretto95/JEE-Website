package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import enumeration.Categorie;


/**
 * The persistent class for the produit database table.
 * 
 */
@Entity
@NamedQuery(name="Produit.findAll", query="SELECT p FROM Produit p")
@NamedQuery(name="Produit.findById", query="SELECT p FROM Produit p WHERE p.id= :id")
@NamedQuery(name="Produit.findByCategorie", query="SELECT p FROM Produit p WHERE p.categorie= :categorie")
public class Produit implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false) 
	private Categorie categorie;

	@Lob
	@Column(nullable = false) 
	private String description="";
	

	@Column(nullable=false)
	private byte disponibleEnVente = 1;


	private String image="";
	

	@Column(nullable = false) 
	private double prix=0;

	@Column(nullable = false) 
	private int quantite=0;
	
	@Column(nullable=false)
	private String titre="";

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="produit",cascade = CascadeType.ALL)
	private List<Commentaire> commentaires=new ArrayList<Commentaire>();
	
	//bi-directional many-to-one association to LigneCommande
	@OneToMany(mappedBy="produit",fetch=FetchType.LAZY)
	private List<LigneCommande> ligneCommandes=new ArrayList<LigneCommande>();


	public Produit() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Categorie getCategorie() {
		return this.categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrix() {
		return this.prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public int getQuantite() {
		return this.quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public List<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(List<Commentaire> commentaires) {
		this.commentaires = commentaires;
	}

	public Commentaire addCommentaire(Commentaire commentaire) {
		getCommentaires().add(commentaire);
		commentaire.setProduit(this);

		return commentaire;
	}

	public Commentaire removeCommentaire(Commentaire commentaire) {
		getCommentaires().remove(commentaire);
		commentaire.setProduit(null);

		return commentaire;
	}

	public byte getDisponibleEnVente() {
		return disponibleEnVente;
	}

	public void setDisponibleEnVente(byte disponibleEnVente) {
		this.disponibleEnVente = disponibleEnVente;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

}