﻿Drop Table [utilisateur]
Drop Table [recette]
Drop Table [images]
Drop Table [Category]

CREATE TABLE utilisateur (
    Id             INT          IDENTITY (1, 1) NOT NULL,
    date          DATETIME     NULL,
    nom           VARCHAR (50) NULL,
    prenom        VARCHAR (50) NULL,
    nomutilisateur VARCHAR (50) NULL,
    email          VARCHAR (50) NULL,
    nbrecettecree  INT          NULL,
    mdp            VARCHAR (50) NULL,
    admin          VARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED (Id ASC)
);

INSERT INTO utilisateur (date, nom, prenom, nomutilisateur, email, nbrecettecree, mdp, admin)
VALUES
(1979-06-20,'Mister','Admin','Admin','admin@admin.fr',0, 'Admin', 'true'),
(1973-10-08,'Corbeel','Virginie','Nini','nini@nini.fr',5, 'nini', 'false'),
(1979-06-20,'Di persio','Anthony','Tonino','tonino@admin.fr',5, 'tonino', 'false');


CREATE TABLE recette (
    Id             INT           IDENTITY (1, 1) NOT NULL,
    date           DATETIME      NULL,
    nomutilisateur VARCHAR (20)  NULL,
    nomrecette     VARCHAR (100) NULL,
    nbpersonne     INT           NULL,
    difficulte     VARCHAR (5)   NULL,
    ingredient     NTEXT         NULL,
    realisation    NTEXT         NULL,
    nomcategory    VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

INSERT INTO recette (nomutilisateur, nomrecette, nbpersonne, difficulte, ingredient, realisation, nomcategory) 
VALUES
('Tonino', 'Spaghetti alla Bolognese', 4, '**', ' - 500 g de spaghetti - 1 oignon - 2 gousses d''ail - 1 carotte - 1 branche de céleri - 850 g de tomate (fraîches ou en boîte selon la saison) - 37.5 ml de vin rouge - 500 g de boeuf haché - 50 cl de bouillon - Persil - 1 cuillère à café de sucre - 2 cuillères à soupe d''huile', 'Etape 1 : Hachez l''ail, l''oignon, puis coupez la carotte et le céleri en petits dés (enlevez les principales nervures du céleri). Etape 2 : Faites chauffer l''huile dans une casserole assez grande. Faites revenir l''ail, l''oignon, la carotte et le céleri à feu doux pendant 5 min en remuant. Etape 3 : Augmenter la flamme, puis ajoutez le boeuf. Faites brunir et remuez de façon à ce que la viande ne fasse pas de gros paquets. Etape 4 : Ajoutez le bouillon, le vin rouge, les tomates préalablement coupées assez grossièrement, le sucre et le persil haché. Portez à ébullition. Etape 5 : Baisser ensuite le feu et laissez mijoter à couvert 1h à 1h30, de façon à ce que le vin s''évapore. Etape 6 : Faites cuire les spaghetti, puis mettez-les dans un plat. Etape 7 : Ajoutez la sauce bolognaise.', 'Cuisine Italienne'),
('Nini', 'Gigot de 7 Heures', 10, '***', ' - 1 gigot d''agneau de 2,5 kg - 250 g de couenne - 200 g de carotte - 300 g d''oignon - 500 g de tomate pelée , épépinées - 1 bouquet garni (thym, laurier, persils, clou de girofle) - 30 cl de bouillon de boeuf - 10 cl d''huile d''olive - 10 cl de cognac - 50 cl de vin blanc - Poivre, Sel.', 'Etape 1: Saler et poivrer le gigot, le faire revenir dans de l''huile chaude. Etape 2 : Tapisser de couennes le fond d''une cocotte (gras vers l''extérieur). Y déposer le gigot, entourer des carottes, de l''oignons et des tomates. Ajouter le reste des ingrédients, saler et poivrer. Etape 3 : Faire cuire 7 heures au four à 170°C (thermostat 5-6). Etape 4 : Note de la rédaction Marmiton : cuire à 120°C est plus approprié. Surveiller la cuisson et rajouter de l''eau si nécessaire. Etape 5 : Rectifier l''assaisonnement et servir à la cuillère dans la cocotte (la particularité de ce gigot est d''être fondant au point qu''on puisse le couper à la cuillère). ', 'Cuisine Française'),
('Nini', 'Noix de Saint Jacques à la Truffe & Son Crumble de Pomme de Terre', 1, '****', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.', 'Cuisine Française'),
('Tonino', 'Curry Vert de Crevettes Khao Pad Kaï', 4, '***', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.', 'Cuisine Thaï'),
('Nini', 'Chilli Sin Carne', 5, '***', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.

', 'Cuisine Mexicaine'),
('Nini', 'Filets de sole à la mousseline au riesling et aux crevettes grises', 4, '*', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.

', 'Cuisine Française'),
('Tonino', 'Spaghetti alla Carbonara', 4, '**', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.', 'Cuisine Italienne'),
('Tonino', 'Les Tonino''s Burger', 5, '***', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.', 'Cuisine du Monde'),
('Nini', 'Tempura de Gambas', 6, '**', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.', 'Cuisine Japonaise'),
('Tonino', 'Poulet au Curry Jaune', 5,'***', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin efficitur nunc eget metus feugiat dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci lorem, tempor vitae ante eget, feugiat sodales ante. Morbi vitae dui sodales, vulputate urna in, vehicula eros. Mauris nulla nibh, feugiat non leo eu, imperdiet consequat sem. Curabitur a varius turpis. Vivamus pulvinar efficitur tempus. Aliquam erat volutpat. Aliquam interdum turpis sapien, in dignissim risus facilisis et. Donec nisl est, facilisis at justo ut, laoreet posuere turpis.

Nunc a ornare eros. Sed rhoncus libero massa, eu mattis metus convallis non. Nullam eu pretium risus. Aenean euismod nunc libero, vitae pharetra turpis tempor vitae. Aenean a odio in ligula aliquam hendrerit porttitor non velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur luctus nibh ante, at dignissim odio aliquam vitae. In aliquam quam et lobortis tincidunt. Mauris gravida neque non molestie pellentesque. Morbi malesuada erat ut erat dignissim, at laoreet eros vulputate. Etiam eleifend condimentum magna nec luctus. Mauris ut condimentum mi. Sed gravida lorem vel dictum fringilla. Fusce lorem neque, gravida quis purus nec, eleifend fringilla justo.

Donec et quam et neque egestas fermentum. Morbi scelerisque felis lorem, vel rhoncus urna lacinia ut. Etiam eu turpis ut dolor scelerisque malesuada at in massa. Maecenas commodo magna arcu, ut rhoncus velit tristique nec. Aenean aliquam nunc nec mollis malesuada. Duis tempor nibh lacus, vel luctus nunc finibus sit amet. Duis eget laoreet lorem. Nunc libero erat, dapibus quis sollicitudin at, auctor ut risus. Sed sed nunc ac nunc egestas sagittis.', 'Cuisine Thaï');

CREATE TABLE images (
    Id        INT           IDENTITY (1, 1) NOT NULL,
    Idrecette INT           NOT NULL,
    urlimage  VARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC)
);

INSERT INTO images (Idrecette,urlimage)
VALUES
( 1 ,'images/recette/Cuisine Italienne-Spaghetti_Alla_Bolognese.jpg'),
( 2 ,'images/recette/Cuisine Française-Gigot_7_Heures.jpg'),
( 3 ,'images/recette/Cuisine Française-St_Jacques_Truffe.jpg'),
( 4 ,'images/recette/Cuisine Thaï-Khao_Pad_Kai.jpg'),
( 5 ,'images/recette/Cuisine Mexicaine-Chilli_sin_Carne.jpg'),
( 6 ,'images/recette/Cuisine Française-Sole_Riesling.jpg'),
( 7 ,'images/recette/Cuisine Italienne-Spaghetti_Alla_Carbonara.jpg'),
( 8 ,'images/recette/Cuisine du Monde-Toninos_Burger.jpg'),
( 9 ,'images/recette/Cuisine Japonaise-Tempura_de_gambas.jpg'),
( 10 ,'images/recette/Cuisine Thaï-Poulet_Curry_Jaune_Thai.jpg');

CREATE TABLE Category (
    Id    INT          IDENTITY (1, 1) NOT NULL,
    Titre VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC)
);


INSERT INTO Category ([Titre]) VALUES (N'Cuisine Française')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Italienne')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Asiatique')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Chinoise')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Japonaise')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Thaï')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Cambodgienne')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Grecque')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Mexicaine')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Marocaine')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine Algérienne')
INSERT INTO Category ([Titre]) VALUES (N'Cuisine des Iles')


