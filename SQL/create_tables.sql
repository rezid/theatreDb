CREATE TABLE IF NOT EXISTS spectacles (
    id              int	primary key not null,
    nom         	text not null,           
    capacite        real not null,          
    description     text
);

CREATE TABLE IF NOT EXISTS compagnies (
    nom             text primary key not null,
    pays      		text not null,           
    departement     text not null,          
    ville  			text not null
);

CREATE TABLE IF NOT EXISTS spectacles_achete (
    id              int	primary key not null REFERENCES spectacles,
    prix_achat      real not null,           
    date_achat      date not null,          
    nom_compagnie   text not null REFERENCES compagnies
);

CREATE TABLE IF NOT EXISTS nos_spectacles (
    id              int	primary key not null REFERENCES spectacles,
    date_creation   date not null
);

CREATE TABLE IF NOT EXISTS representations (
    date_rep    date not null,
    heure_rep   time not null,
    date_vente  date not null,
    id_spectacle int not null REFERENCES spectacles, 
    PRIMARY KEY (date_rep, heure_rep)
);


CREATE TABLE  IF NOT EXISTS operations (
    nom             text primary key not null,
    description		text
);

CREATE TABLE IF NOT EXISTS organismes (
    nom             text primary key not null
);

CREATE TABLE IF NOT EXISTS tarifs (
    type_tarif        text not null,
    valeur             real not null,
    PRIMARY KEY (type_tarif, valeur)
);

CREATE TABLE IF NOT EXISTS billets (
    nom        				text not null,
    premon     				text not null,
    date_rep      			date not null,
    heure_rep      			time not null,
    status     				text not null,
    prix_effective     		text not null,
    type_tarif	     		text not null,
    valeur_tarif    		real not null,
    PRIMARY KEY (nom, premon, date_rep, heure_rep),
    FOREIGN KEY (date_rep, heure_rep) REFERENCES representations(date_rep, heure_rep),
    FOREIGN KEY (type_tarif, valeur_tarif) REFERENCES tarifs(type_tarif, valeur)
);

CREATE TABLE IF NOT EXISTS op_rep (
    nom_operation   text not null REFERENCES operations,
    date_rep    	date not null,
    heure_rep   	time not null,
    date_operation        date not null,
    PRIMARY KEY (nom_operation, date_rep, heure_rep),
    FOREIGN KEY (date_rep, heure_rep) REFERENCES representations(date_rep, heure_rep)
);

CREATE TABLE IF NOT EXISTS op_spec (
    nom_operation   text not null REFERENCES operations,
    id_spectacle int not null REFERENCES spectacles,
    prix real not null
);


CREATE TABLE IF NOT EXISTS opn_com1 (
    id_spectacle int not null REFERENCES spectacles,
    nom_compagine   text not null REFERENCES compagnies,
    date_rep date not null
);

CREATE TABLE IF NOT EXISTS opn_com2 (
    id_spectacle int not null REFERENCES spectacles,
    nom_compagine   text not null REFERENCES compagnies,
    date_vente date not null,
    prix_vente real not null
);

CREATE TABLE IF NOT EXISTS spec_tar (
    id_spectacle int not null REFERENCES spectacles,
    type_tarif	     		text not null,
    valeur_tarif    		real not null,
    FOREIGN KEY (type_tarif, valeur_tarif) REFERENCES tarifs(type_tarif, valeur)
);

CREATE TABLE IF NOT EXISTS subventions (
    id_spectacle int not null REFERENCES spectacles,
    nom_organisme   text not null REFERENCES organismes,
    valeur real not null
);
