SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `user`;
TRUNCATE TABLE `produit`;
TRUNCATE TABLE `commande`;
TRUNCATE TABLE `ligne_commande`;
TRUNCATE TABLE `commentaire`;
SET FOREIGN_KEY_CHECKS=1;
REPLACE INTO `user` VALUES ('1','1', NULL, 'rom@rom.com', NULL, 'rom', '0', NULL);
REPLACE INTO `produit` VALUES ('1', 'ACTION', "Super Mario Bros. 35 sur Switch est un jeu de plateforme en ligne dans lequel vous devez rester le dernier en vie alors que les ennemis que vous éliminez iront envahir les stages des autres joueurs. Reprenant l'univers du premier Super Mario Bros, le jeu vous permet d'utiliser la roulette d'objets et quatre stratégies différentes pour devancer vos adversaires.",'1', "img/51XVjiMwr2L._AC_SX425_.jpg", '75.99', '65',"Mario");
REPLACE INTO `produit` VALUES ('2', 'AVENTURE',"The Legend of Zelda , ou simplement Zelda, est une série de jeux vidéo d'action-aventure produite par la société japonaise Nintendo et créée par Shigeru Miyamoto et Takashi Tezuka. Depuis 1986 et la sortie du jeu The Legend of Zelda sur la console NES, dix-neuf jeux font officiellement partie de la saga. Plusieurs rééditions, remakes et jeux dérivés ont également vu le jour.",'1', "img/zelda.png",'87.99', '36',"Zelda");
REPLACE INTO `produit` VALUES ('3', 'AVENTURE',"Après l'exécution de l'Ordre 66, l'Empire cherche à éradiquer tous les Jedi. En tant que Padawan Jedi en fuite, vous devez lutter pour survivre et percer les secrets d'une civilisation disparue depuis des générations, dans l'espoir de rebâtir l'Ordre Jedi.",'1', "img/Star-Wars-Battlefront-2-PS3.jpg",'84.99', '36',"Star Wars");
REPLACE INTO `produit` VALUES ('4', 'MMO',"Empreint de légendes et d'aventure, l'univers de WoW vous attend ! Vous allez revisiter les terres d'Azeroth sous une nouvelle perspective, explorant des champs de bataille familiers, découvrant de nouvelles terres au travers de quêtes épiques.",'1', "img/wow-classic1.jpg",'84.99', '36',"World of Warcraft");
REPLACE INTO `produit` VALUES ('5', 'RPG',"The Elder Scrolls V: Skyrim isn’t just one of the best RPGs on PC, it’s an institution. It’s managed to stay relevant and eminently playable long after its 2011 debut – tirelessly tugging players back in by their mage robes. With the help of many, many Skyrim mods and console commands, of course.",'1', "img/best-rpg-skyrim-900x506.jpg",'84.99', '36',"THE ELDER SCROLLS V: SKYRIM");
REPLACE INTO `commande` VALUES ('1', NULL, NULL, '2020-12-01', '0', NULL, '0', '1');
REPLACE INTO `ligne_commande` VALUES ('1', '10', '1', '2');
REPLACE INTO `ligne_commande` VALUES ('2', '24', '1', '1');


