package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the commande database table.
 * 
 */
@Entity
@NamedQuery(name="Commande.findAll", query="SELECT c FROM Commande c")
@NamedQuery(name="Commande.findById",query="SELECT c FROM Commande c WHERE c.id= :id")
@NamedQuery(name="Commande.findByUser",query="SELECT c FROM Commande c WHERE c.user= :user")
public class Commande implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.DATE)
	private Date datePassageCommande;

	@Column(nullable = false) 
	private byte expédiée=0;
	
	private String adresseFacturation;
	
	private String adresseLivraison;
	
	private String numCarteBancaire;

	@Column(nullable = false) 
	private byte reglée=0;

	//bi-directional many-to-one association to User
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private User user;

	//bi-directional many-to-one association to LigneCommande
	@OneToMany(fetch = FetchType.EAGER,mappedBy="commande",cascade = CascadeType.ALL,orphanRemoval=true)
	private List<LigneCommande> ligneCommandes=new ArrayList<LigneCommande>();

	public Commande() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDatePassageCommande() {
		return this.datePassageCommande;
	}

	public void setDatePassageCommande(Date datePassageCommande) {
		this.datePassageCommande = datePassageCommande;
	}

	public byte getExpédiée() {
		return this.expédiée;
	}

	public void setExpédiée(byte expédiée) {
		this.expédiée = expédiée;
	}

	public byte getReglée() {
		return this.reglée;
	}

	public void setReglée(byte reglée) {
		this.reglée = reglée;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<LigneCommande> getLigneCommandes() {
		return this.ligneCommandes;
	}

	public void setLigneCommandes(List<LigneCommande> ligneCommandes) {
		this.ligneCommandes = ligneCommandes;
	}

	public LigneCommande addLigneCommande(LigneCommande ligneCommande) {
		getLigneCommandes().add(ligneCommande);
		ligneCommande.setCommande(this);

		return ligneCommande;
	}

	public LigneCommande removeLigneCommande(LigneCommande ligneCommande) {
		getLigneCommandes().remove(ligneCommande);
		ligneCommande.setCommande(null);

		return ligneCommande;
	}
	
	public String toString() {
		String chaine = "Id = "+this.id;
		if (this.user!=null) {
			chaine+= "; User= "+this.getUser().getIdentifiant();
		}
		return chaine;
	}

	public String getAdresseFacturation() {
		return adresseFacturation;
	}

	public void setAdresseFacturation(String adresseFacturation) {
		this.adresseFacturation = adresseFacturation;
	}

	public String getAdresseLivraison() {
		return adresseLivraison;
	}

	public void setAdresseLivraison(String adresseLivraison) {
		this.adresseLivraison = adresseLivraison;
	}

	public String getNumCarteBancaire() {
		return numCarteBancaire;
	}

	public void setNumCarteBancaire(String numCarteBancaire) {
		this.numCarteBancaire = numCarteBancaire;
	}

}