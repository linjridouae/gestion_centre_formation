CREATE TABLE Apprenant (
    ID_apprenant INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(200) NOT NULL,
    prenom VARCHAR(200) NOT NULL,
    email VARCHAR(70) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL
);

CREATE TABLE Admin (
    ID_admin INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mot_de_passe VARCHAR(100) NOT NULL
);

CREATE TABLE Formation (
    ID_formation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    categorie VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    masse_horaire INT NOT NULL,
    sujet VARCHAR(255) NOT NULL
);

CREATE TABLE Formateur (
    ID_formateur INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(200) NOT NULL,
    prenom VARCHAR(200) NOT NULL,
    email VARCHAR(70) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL
);

CREATE TABLE Session (
    ID_session INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_debut DATETIME NOT NULL,
    date_fin DATETIME NOT NULL,
    nombre_de_places INT NOT NULL,
    etat VARCHAR(100) NOT NULL,
    ID_formateur INT NOT NULL,
    ID_formation INT NOT NULL,
    FOREIGN KEY (ID_formateur) REFERENCES Formateur(ID_formateur),
    FOREIGN KEY (ID_formation) REFERENCES Formation(ID_formation)
);



CREATE TABLE Evaluation (
    PRIMARY KEY (ID_apprenant,ID_session ),
    ID_apprenant INT NOT NULL,
    ID_session INT NOT NULL,
    resultat VARCHAR (200) NOT NULL,
    date_evaluation DATETIME NOT NULL,
    FOREIGN KEY (ID_apprenant) REFERENCES Apprenant(ID_apprenant),
    FOREIGN KEY (ID_session) REFERENCES Session(ID_session)

    
);
