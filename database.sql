#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Sport
#------------------------------------------------------------

CREATE TABLE Sport(
        Nom_Sport Varchar (50) NOT NULL
	,CONSTRAINT Sport_PK PRIMARY KEY (Nom_Sport)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Lieu
#------------------------------------------------------------

CREATE TABLE Lieu(
        id_lieu     Int NOT NULL ,
        Ville       Varchar (50) NOT NULL ,
        Voie        Varchar (50) NOT NULL ,
        Code_postal Int NOT NULL
	,CONSTRAINT Lieu_PK PRIMARY KEY (id_lieu)
);


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        Email         Varchar (50) NOT NULL ,
        Nom           Varchar (50) NOT NULL ,
        Prenom        Varchar (50) NOT NULL ,
        Age           Int NOT NULL ,
        Password      Varchar (50) NOT NULL ,
        NbMatchJoue   Int NOT NULL ,
        NbPoint       Int NOT NULL ,
        Photo         Varchar (50) NOT NULL ,
        FormeSportive Int NOT NULL ,
        id_lieu       Int NOT NULL
	,CONSTRAINT Utilisateur_PK PRIMARY KEY (Email)

	,CONSTRAINT Utilisateur_Lieu_FK FOREIGN KEY (id_lieu) REFERENCES Lieu(id_lieu)
);


#------------------------------------------------------------
# Table: Terrain
#------------------------------------------------------------

CREATE TABLE Terrain(
        id_terrain        Int NOT NULL ,
        Nom_terrain       Varchar (50) NOT NULL ,
        Numero_de_terrain Varchar (50) NOT NULL ,
        id_lieu           Int NOT NULL
	,CONSTRAINT Terrain_PK PRIMARY KEY (id_terrain)

	,CONSTRAINT Terrain_Lieu_FK FOREIGN KEY (id_lieu) REFERENCES Lieu(id_lieu)
);


#------------------------------------------------------------
# Table: Date
#------------------------------------------------------------

CREATE TABLE Date(
        id_date Int NOT NULL ,
        Jour    Date NOT NULL ,
        Heure   Time NOT NULL
	,CONSTRAINT Date_PK PRIMARY KEY (id_date)
);


#------------------------------------------------------------
# Table: Match
#------------------------------------------------------------

CREATE TABLE Match(
        Id              Int NOT NULL ,
        Prix            Int NOT NULL ,
        NbJoueurInscrit Int NOT NULL ,
        NbJoueurMax     Int NOT NULL ,
        Duree           Time NOT NULL ,
        Score           Int NOT NULL ,
        NbJoueurMin     Int NOT NULL ,
        Email           Varchar (50) NOT NULL ,
        Nom_Sport       Varchar (50) NOT NULL ,
        id_terrain      Int NOT NULL ,
        id_date         Int NOT NULL
	,CONSTRAINT Match_PK PRIMARY KEY (Id)

	,CONSTRAINT Match_Utilisateur_FK FOREIGN KEY (Email) REFERENCES Utilisateur(Email)
	,CONSTRAINT Match_Sport0_FK FOREIGN KEY (Nom_Sport) REFERENCES Sport(Nom_Sport)
	,CONSTRAINT Match_Terrain1_FK FOREIGN KEY (id_terrain) REFERENCES Terrain(id_terrain)
	,CONSTRAINT Match_Date2_FK FOREIGN KEY (id_date) REFERENCES Date(id_date)
);


#------------------------------------------------------------
# Table: Résultat
#------------------------------------------------------------

CREATE TABLE Resultat(
        id_resultat Int NOT NULL ,
        Score       Int NOT NULL ,
        Email       Varchar (50) NOT NULL ,
        Id          Int NOT NULL
	,CONSTRAINT Resultat_PK PRIMARY KEY (id_resultat)

	,CONSTRAINT Resultat_Utilisateur_FK FOREIGN KEY (Email) REFERENCES Utilisateur(Email)
	,CONSTRAINT Resultat_Match0_FK FOREIGN KEY (Id) REFERENCES Match(Id)
	,CONSTRAINT Resultat_Match_AK UNIQUE (Id)
);


#------------------------------------------------------------
# Table: Point
#------------------------------------------------------------

CREATE TABLE Point(
        id_point    Int NOT NULL ,
        Temps       Time NOT NULL ,
        Equipe      Varchar (50) NOT NULL ,
        Email       Varchar (50) NOT NULL ,
        id_resultat Int NOT NULL
	,CONSTRAINT Point_PK PRIMARY KEY (id_point)

	,CONSTRAINT Point_Utilisateur_FK FOREIGN KEY (Email) REFERENCES Utilisateur(Email)
	,CONSTRAINT Point_Resultat0_FK FOREIGN KEY (id_resultat) REFERENCES Resultat(id_resultat)
);


#------------------------------------------------------------
# Table: Jouer
#------------------------------------------------------------

CREATE TABLE Jouer(
        Email Varchar (50) NOT NULL ,
        Id    Int NOT NULL
	,CONSTRAINT Jouer_PK PRIMARY KEY (Email,Id)

	,CONSTRAINT Jouer_Utilisateur_FK FOREIGN KEY (Email) REFERENCES Utilisateur(Email)
	,CONSTRAINT Jouer_Match0_FK FOREIGN KEY (Id) REFERENCES Match(Id)
);

