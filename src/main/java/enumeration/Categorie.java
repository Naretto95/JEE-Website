package enumeration;

public enum Categorie {
	ACTION("	Les jeux d'action ça vous connaît ? Alors vous faites peut-être partie des acharnés du clavier face à des jeux de combat (du style Commando Assault ou Armor Mayhem) ou à des jeux d'aventure comme la série des Armed with Wings 1 ou les aventures de Cactus McCoy, ou tout simplement des jeux où ça fait BOOM !"),
	AVENTURE("Un jeu d'aventure, c'est un jeu comme Kingdom Rush ou Goodgame Empire. Les jeux d'aventure vous offrent l'occasion de vous prendre pour Indiana Jones ou Super Mario. De grandes aventures et de grands dangers vous attendent lors de vos périples dans ces jeux ! ..."),
	MMO("	Un jeu de rôle en ligne massivement multijoueur est un genre de jeux vidéo associant le jeu de rôle et le jeu en ligne massivement multijoueur, permettant à un grand nombre de personnes d'interagir simultanément dans un monde virtuel. "),
	RPG("	Oyez, oyez braves gens et laissez-vous conter la fabuleuse épopée des jeux de rôle, sur PC et consoles ! Véritable pilier du panthéon vidéoludique, le genre a sans cesse muté au gré des avancées technologiques mais a préservé sa valeur essentielle : le goût de plonger le joueur dans de fantastiques histoires peuplées d’un bestiaire impressionnant.");
	
	private String value;
	
	Categorie(String string) {
		this.value= string;
	}

	public String getValue() {
		return value;
	}
}
