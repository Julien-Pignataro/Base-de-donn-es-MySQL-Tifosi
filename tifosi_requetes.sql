/* tifosi_requetes.sql */
USE tifosi;

/* 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant:
   Voir apparaitre les noms des focaccias dans l'ordre alphabétique.
Résultat obtenu :
nom_focaccia Croissant 1
 Américaine
 Emmentalaccia
 Gorgonzollaccia
 Hawaienne
 Mozaccia
 Paysanne
 Raclaccia
 Tradizione
*/
SELECT nom_focaccia FROM focaccia ORDER BY nom_focaccia ASC;

/* 2. Afficher le nombre total d'ingrédients:
   Voir apparaitre le total d'ingrédient
Résultat obtenu :
total_ingredients
      25
*/
SELECT COUNT(*) AS total_ingredients FROM ingredient;

/* 3. Afficher le prix moyen des focaccias:
   Voir apparaitre le prix moyen des focaccias.
Résultat obtenu :
prix_moyen
 10.375000
*/
SELECT AVG(prix) AS prix_moyen FROM focaccia;

/* 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson:
   Voir apparaitre les boisson avec leur marque et leur nom.
Résultat obtenu :
nom_boisson Croissant 1           nom_marque
Capri-sun                          Coca-cola
Coca-cola original                 Coca-cola
Coca-cola zéro                     Coca-cola
Eau de source                      Cristalline
Fanta citron                       Coca-cola
Fanta orange                       Coca-cola
Lipton Peach                       Pepsico
Lipton zéro citron                 Pepsico
Monster energy ultra blue          Monster
Monster energy ultra gold          Monster
Pepsi                              Pepsico
Pepsi Max Zéro                     Pepsico
*/
SELECT b.nom_boisson, m.nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom_boisson;

/* 5. Afficher la liste des ingrédients pour une Raclaccia:
   Voir apparaitre les ingrédients pour une raclaccia.
Résultat obtenu :
nom_ingredient
 Ail
 Base Tomate
 Champignon
 Cresson
 Parmesan
 Poivre
 Raclette
*/
SELECT i.nom_ingredient
FROM ingredient i
JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
JOIN focaccia f ON fi.id_focaccia = f.id_focaccia
WHERE f.nom_focaccia = 'Raclaccia';

/* 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia:
   Voir apparaitre le nom et le nombre d'ingrédient des focaccias.
Résultat obtenu :
nom_focaccia        nb_ingredients
Mozaccia                  10
Gorgonzollaccia            8
Raclaccia                  7
Emmentalaccia              7
Tradizione                 9
Hawaienne                  9
Américaine                 8
Paysanne                  12
 */
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia;

/* 7. Afficher le nom de la focaccia qui a le plus d'ingrédients:
   Voir apparaitre la focaccia avec le plus d'ingrédient.
Résultat obtenu :
nom_focaccia
 Paysanne
 */
SELECT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia
ORDER BY COUNT(fi.id_ingredient) DESC
LIMIT 1;

/* 8. Afficher la liste des focaccia qui contiennent de l'ail:
   Voir apparaitre les focaccia avec de l'ail.
Résultat obtenu :
nom_focaccia
 Mozaccia
 Gorgonzollaccia
 Raclaccia
 Paysanne
*/
SELECT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE i.nom_ingredient = 'Ail';

/* 9. Afficher la liste des ingrédients inutilisés:
   Voir apparaitre les ingrédients non utilisés.
Résultat obtenu :
nom_ingredient
 Salami
 Tomate cerise
 */
SELECT i.nom_ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL;

/* 10. Afficher la liste des focaccia qui n'ont pas de champignons:
   Voir apparaitre les focaccias sans champignon.
Résultat obtenu :
nom_focaccia
 Américaine
 Hawaienne
 */
SELECT f.nom_focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
  SELECT fi.id_focaccia
  FROM focaccia_ingredient fi
  JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
  WHERE i.nom_ingredient = 'Champignon'
);
