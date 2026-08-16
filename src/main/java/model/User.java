package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="user")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
@NamedQuery(name="User.findById", query="SELECT u FROM User u WHERE u.id = :id")
@NamedQuery(name="User.findUserByEmailAndMotDePasse",query="SELECT u FROM User u WHERE u.adresseMail= :adresseMail AND u.mdp= :mdp ")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;


	@Column(nullable = false) 
	private byte admin=0;

	private String adresse="";

	@Column(nullable = false) 
	private String adresseMail="";

	private String identifiant="";

	@Column(nullable = false) 
	private String mdp="";

	@Column(nullable = false) 
	private int pointsFidelite=0;

	private String telephone;

	//bi-directional many-to-one association to Commande
	@OneToMany(fetch = FetchType.EAGER, mappedBy="user",cascade = CascadeType.ALL)
	private List<Commande> commandes= new ArrayList<Commande>();

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="user",cascade = CascadeType.ALL)
	private List<Commentaire> commentaires=new ArrayList<Commentaire>();

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte getAdmin() {
		return this.admin;
	}

	public void setAdmin(byte admin) {
		this.admin = admin;
	}

	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getAdresseMail() {
		return this.adresseMail;
	}

	public void setAdresseMail(String adresseMail) {
		this.adresseMail = adresseMail;
	}

	public String getIdentifiant() {
		return this.identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getMdp() {
		return this.mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public int getPointsFidelite() {
		return this.pointsFidelite;
	}

	public void setPointsFidelite(int pointsFidelite) {
		this.pointsFidelite = pointsFidelite;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public List<Commande> getCommandes() {
		return this.commandes;
	}

	public void setCommandes(List<Commande> commandes) {
		this.commandes = commandes;
	}

	public Commande addCommande(Commande commande) {
		getCommandes().add(commande);
		commande.setUser(this);

		return commande;
	}

	public Commande removeCommande(Commande commande) {
		getCommandes().remove(commande);
		commande.setUser(null);

		return commande;
	}

	public List<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(List<Commentaire> commentaires) {
		this.commentaires = commentaires;
	}

	public Commentaire addCommentaire(Commentaire commentaire) {
		getCommentaires().add(commentaire);
		commentaire.setUser(this);

		return commentaire;
	}

	public Commentaire removeCommentaire(Commentaire commentaire) {
		getCommentaires().remove(commentaire);
		commentaire.setUser(null);

		return commentaire;
	}

}