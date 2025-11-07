-- tifosi_data.sql
USE tifosi;

INSERT INTO marque (nom_marque) 
VALUES ('Coca-Cola'), 
       ('Cristalline'), 
       ('Monter'), 
       ('Pepsico');

INSERT INTO boisson (nom_boisson, id_marque)
VALUES ('Coca-cola zéro', 1),
       ('Coca-cola original', 1),
       ('Fanta citron', 1),
       ('Fanta orange', 1),
       ('Capri-sun', 1),
       ('Pepsi', 4),
       ('Pepsi Max zéro', 4),
       ('Lipton zéro citron', 4),
       ('Lipton Peach', 4),
       ('Monster energy ultra gold', 3),
       ('Monster energy ultra blue', 3),
       ('Eau de source', 2);

INSERT INTO ingredient (nom_ingredient)
VALUES ('Ail'),
       ('Ananas'),
       ('Artichaut'),
       ('Bacon'),
       ('Base Tomate'),
       ('Base crème'),
       ('Champignon'),
       ('Chèvre'),
       ('Cresson'),
       ('Emmental'),
       ('Gorgonzola'),
       ('Jambon cuit'),
       ('Jambon fumé'),
       ('Oeuf'),
       ('Oignon'),
       ('Olive noire'),
       ('Olive verte'),
       ('Parmesan'),
       ('Piment'),
       ('Poivre'),
       ('Pomme de terre'),
       ('Raclette'),
       ('Salami'),
       ('Tomate cerise'),
       ('Mozarella');

INSERT INTO focaccia (nom_focaccia, prix)
VALUES ('Mozaccia', 9.80),
       ('Gorgonzollaccia', 10.80),
       ('Raclaccia', 8.90),
       ('Emmentalaccia', 9.80),
       ('Tradizione', 8.90),
       ('Hawaienne', 11.20),
       ('Américaine', 10.80),
       ('Paysanne', 12.80);

/* Mozaccia */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('1, 5'),
       ('1, 25'),
       ('1, 9'),
       ('1, 13'),
       ('1, 1'),
       ('1, 3'),
       ('1, 7'),
       ('1, 18'),
       ('1, 20'),
       ('1, 16');

/* Gorgonzollacia */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('2, 5'),
       ('2, 11'),
       ('2, 9'),
       ('2, 1'),
       ('2, 7'),
       ('2, 18'),
       ('2, 20'),
       ('2, 16');

/* Raclaccia */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('3, 5'),
       ('3, 22'),
       ('3, 9'),
       ('3, 1'),
       ('3, 7'),
       ('3, 18'),
       ('3, 20');          

/* Emmentalacia */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('4, 6'),
       ('4, 10'),
       ('4, 9'),
       ('4, 7'),
       ('4, 18'),
       ('4, 20'),
       ('4, 15');

/* Tradizione */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('5, 5'),
       ('5, 25'),
       ('5, 9'),
       ('5, 12'),
       ('5, 7'),
       ('5, 18'),
       ('5, 20'),
       ('5, 16'),
       ('5, 17');

/* Hawaienne */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('6, 5'),
       ('6, 25'),
       ('6, 9'),
       ('6, 4'),
       ('6, 2'),
       ('6, 19'),
       ('6, 18'),
       ('6, 20'),
       ('6, 16');

/* Américaine */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('7, 5'),
       ('7, 25'),
       ('7, 9'),
       ('7, 4'),
       ('7, 21'),
       ('7, 18'),
       ('7, 20'),
       ('7, 16');

/* Paysanne */
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient)
VALUES ('8, 6'),
       ('8, 8'),
       ('8, 9'),
       ('8, 21'),
       ('8, 12'),
       ('8, 1'),
       ('8, 3'),
       ('8, 7'),
       ('8, 18'),
       ('8, 20'),
       ('8, 16'),
       ('8, 14');                     