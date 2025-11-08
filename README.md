# 🍕 Projet Tifosi — Base de Données MySQL

## 📖 Description
Le **Tifosi** est un restaurant de Street-Food italien souhaitant disposer d'une base de données MySQL locale pour gérer ses produits :
- les **focaccias** (sandwichs italiens),
- leurs **ingrédients**,
- les **boissons** proposées,
- et les **marques** de boissons.

Ce projet contient la conception, la création et le peuplement de la base de données **tifosi**, ainsi que les requêtes de vérification demandées.

---

## 🧱 Structure du projet
📂 projet-tifosi
│
├── tifosi_schema.sql      # Script de création de la base et des tables
├── tifosi_data.sql        # Script d’insertion des données de test
├── tifosi_requetes.sql    # Script contenant les requêtes de vérification
└── README.md              # Documentation du projet

---

## ⚙️ Prérequis

- **MySQL Server** (ou XAMPP / MAMP avec MySQL)
- **phpMyAdmin** (facultatif, mais recommandé)
- Un utilisateur ayant les droits d'administration (ex : `root`)

---

## 🚀 Installation et exécution

### Étape 1 — Créer la base de données et les tables
1. Ouvre **phpMyAdmin** ou ton terminal MySQL.
2. Exécute le fichier `tifosi_schema.sql`.

#### Via phpMyAdmin :
- Onglet **SQL** → copier le contenu de `tifosi_schema.sql` → **Exécuter**

#### Via le terminal :
```bash
mysql -u root -p < tifosi_schema.sql

Cela créera :
	•	la base tifosi
	•	les tables marque, boisson, ingredient, focaccia, focaccia_ingredient
	•	et un utilisateur tifosi avec mot de passe tifosi123! (modifiable)

Étape 2 — Peupler la base avec les données de test

Une fois la base créée, exécute le fichier tifosi_data.sql :

phpMyAdmin :
	•	Sélectionne la base tifosi
	•	Onglet SQL → copier le contenu de tifosi_data.sql → Exécuter

Terminal :
mysql -u root -p tifosi < tifosi_data.sql
Cela insérera les donnéess d'exemple (focaccias, ingrédients, boissons, marques).

Étape 3 - Exécuter les rêquetes de vérification

Pour vérifier la base et obtenir les résultats demandés :
mysql -u root -p tifosi < tifosi_requetes.sql

Ou bien copier chaque requête dans phpMyAdmin -> SQL

🔍 Requêtes de vérification incluses
	1.	Liste des focaccias par ordre alphabétique
	2.	Nombre total d’ingrédients
	3.	Prix moyen des focaccias
	4.	Liste des boissons avec leur marque
	5.	Liste des ingrédients pour la focaccia “Raclaccia”
	6.	Nombre d’ingrédients par focaccia
	7.	Focaccia ayant le plus d’ingrédients
	8.	Focaccias contenant de l’ail
	9.	Ingrédients inutilisés
	10.	Focaccias sans champignons

Chaque requête est commentée dans le fichier tifosi_requetes.sql.

🗃️ Schéma relationnel

Tables principales :
	•	marque (id_marque, nom_marque)
	•	boisson (id_boisson, nom_boisson, id_marque)
	•	ingredient (id_ingredient, nom_ingredient)
	•	focaccia (id_focaccia, nom_focaccia, prix)
	•	focaccia_ingredient (id_focaccia, id_ingredient)

Relations :
	•	boisson → appartient à une marque
	•	focaccia → composée de plusieurs ingredient via la table focaccia_ingredient

💾 Exemple d’utilisation

Afficher tous les ingrédients de la focaccia “Raclaccia” :
SELECT i.nom_ingredient
FROM ingredient i
JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
JOIN focaccia f ON fi.id_focaccia = f.id_focaccia
WHERE f.nom_focaccia = 'Raclaccia';

🧰 Conseils
	•	Si une erreur FOREIGN KEY apparaît lors de l’insertion :
	•	Vérifie que les données sont insérées dans le bon ordre :
	1.	marque
	2.	boisson
	3.	ingredient
	4.	focaccia
	5.	focaccia_ingredient
	•	Pour supprimer toutes les tables :
DROP DATABASE tifosi;

🧑‍💻 Auteur

Julien Pignataro-Barthome
Projet réalisé dans le cadre du module “Conception de base de données MySQL”.
© Centre Européen de Formation — 2025
