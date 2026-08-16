package main;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class MyRunner implements CommandLineRunner{
	
	//@Autowired
	//private EntityManager em;

	@Override
	public void run(String... args) throws Exception {
		/*
		// TODO Auto-generated method stub
		List<User> usersInseres = new ArrayList<User>();
		String[][] users = {{"1","1", null, "rom@rom.com", null, "rom", "0", null}};
		String[][] produits = {{"1", "MMO", "Super Mario Bros. 35 sur Switch est un jeu de plateforme en ligne dans lequel vous devez rester le dernier en vie alors que les ennemis que vous éliminez iront envahir les stages des autres joueurs. Reprenant l'univers du premier Super Mario Bros, le jeu vous permet d'utiliser la roulette d'objets et quatre stratégies différentes pour devancer vos adversaires.","1", null, "75", "65","Super Mario Bros"},{"2", "ACTION", "star wars","1", null, "87", "36","star wars"}};
		String[][] commandes = {{"1", null, null, "2020-12-01", "0", null, "0", "1"}};
		String[][] lignes = {{"1", "10", "1", "2"},{"2", "24", "1", "1"}};
		User user;
		for (int i=0;i<users.length;i++) {
			user=new User();
			user.setId(Integer.parseInt(users[i][0]));
			user.setAdresseMail(users[i][3]);
			user.setIdentifiant(users[i][4]);
			user.setMdp(users[i][5]);
			user.setAdresse(users[i][2]);
			user.setPointsFidelite(Integer.parseInt(users[i][6]));
			user.setTelephone(users[i][7]);
			user.setAdmin(Byte.parseByte(users[i][1]));
			usersInseres.add(em.merge(user));
		}
		Produit produit;
		for(int j=0;j<produits.length;j++) {
			produit = new Produit();
			produit.setId(Integer.parseInt(produits[j][0]));
			produit.setCategorie(Categorie.valueOf(produits[j][1]));
			produit.setDescription(produits[j][2]);
			produit.setDisponibleEnVente(Byte.parseByte(produits[j][3]));
			produit.setImage(produits[j][4]);
			produit.setPrix(Double.parseDouble(produits[j][5]));
			produit.setQuantite(Integer.parseInt(produits[j][6]));
			em.persist(produit);
		}
		Commande commande;
		List<Commande> commandesInserees = new ArrayList<>();
		for(int k=0;k<commandes.length;k++) {
			
			commande = new Commande();
			commande.setId(Integer.parseInt(commandes[k][0]));
			commande.setAdresseFacturation(commandes[k][1]);
			commande.setAdresseLivraison(commandes[k][2]);
			commande.setDatePassageCommande(Date.(commandes[k][3]));
			commande.setExpédiée(Byte.parseByte(commandes[k][4]));
			commande.setNumCarteBancaire(commandes[k][5]);
			commande.setUser(usersInseres.get(Integer.parseInt(commandes[k][6])));
			em.persist(commande);
		}
		LigneCommande ligne;
		List<LigneCommande> lignes = new ArrayList<LigneCommande>();
		for(int l=0;k<lignes.length;l++) {
			
			ligne = new LigneCommande();
			ligne.setId(Integer.parseInt(lignes[l][0]));
			ligne.setQuantite(lignes[l][1]);
			ligne.setCommande(lignes[l][2]);
			ligne.setProduit(lignes[l][3]));
			em.persist(ligne);
		}
		*/
		
	}

}
