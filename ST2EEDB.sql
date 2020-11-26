USE ST2EEDB;
DROP TABLE IF EXISTS Internship;
DROP TABLE IF EXISTS Intern;
DROP TABLE IF EXISTS Enterprise;
DROP TABLE IF EXISTS Tutor;

CREATE TABLE Tutor (

  id INTEGER PRIMARY KEY,
  login VARCHAR(50),
  password VARCHAR(50),
  firstName VARCHAR(30),
  lastName VARCHAR(30)

);

CREATE TABLE Intern (

  id INTEGER PRIMARY KEY,
  tutorId INTEGER,
  firstName VARCHAR(30),
  lastName VARCHAR(30),
  class VARCHAR(10),
  year INTEGER,
  linkedinProfile VARCHAR(100),
  skills VARCHAR(100),

  CONSTRAINT intern_tutorid_fk FOREIGN KEY (tutorId) REFERENCES Tutor(id)

);

CREATE TABLE Enterprise (

  id INTEGER PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(300)

);

CREATE TABLE Internship(

  internId INTEGER,
  enterpriseId INTEGER,
  hasCdc VARCHAR(3) CHECK(hasCdc in ('YES','NO')),
  hasFicheVisite VARCHAR(3) CHECK(hasFicheVisite in ('YES','NO')),
  hasFicheEvalEntr VARCHAR(3) CHECK(hasFicheEvalEntr in ('YES','NO')),
  hasSondageWeb VARCHAR(3) CHECK(hasSondageWeb in ('YES','NO')),
  hasRapportRendu VARCHAR(3) CHECK(hasRapportRendu in ('YES','NO')),
  hasSout VARCHAR(3) CHECK(hasSout in ('YES','NO')),
  hasPlanif VARCHAR(3) CHECK(hasPlanif in ('YES','NO')),
  hasFaite VARCHAR(3) CHECK(hasFaite in ('YES','NO')),
  missionDescription VARCHAR(400),
  startDate DATE,
  endDate DATE,
  supervisorName VARCHAR(50),
  midIntInfo VARCHAR(400),
  internComment VARCHAR(400),
  supervisorComment VARCHAR(400),
  reportTitle VARCHAR(50),
  noteTech DECIMAL(3,1),
  noteCom DECIMAL(3,1),
  keywords VARCHAR(500),

  PRIMARY KEY (internId, enterpriseId),
  CONSTRAINT internship_internid_fk FOREIGN KEY (internId) REFERENCES Intern(id),
  CONSTRAINT internship_enterpriseid_fk FOREIGN KEY (enterpriseId) REFERENCES Enterprise(id)

);

INSERT INTO Tutor VALUES
  (1,'login1','password1','Gilles','Cohen'),
  (2,'login2','password2','Virginie','Bonnet'),
  (3,'login3','password3','Arthur','Renard'),
  (4,'login4','password4','Yves','Boulanger');


INSERT INTO Intern VALUES
  (1,2,'Guillaume','Marie','L2',2016,'This is a LinkedIn url','creativity, management, coding, listening'),
  (2,1,'Laurence','Guillou','L1',2019,'This is a LinkedIn url','creativity, management, coding, listening'),
  (3,3,'Claudine','Bourgeois','M2',2017,'This is a LinkedIn url','creativity, management, coding, listening'),
  (4,1,'Emile','Lemonnier','L2',2017,'This is a LinkedIn url','creativity, management, coding, listening'),
  (5,4,'Theophile','Ribeiro','L1',2019,'This is a LinkedIn url','creativity, management, coding, listening'),
  (6,2,'Elise','Garcia','M2',2015,'This is a LinkedIn url','creativity, management, coding, listening'),
  (7,3,'Martin','Riou','M1',2018,'This is a LinkedIn url','creativity, management, coding, listening'),
  (8,2,'Daniel','Lecoq','L3',2017,'This is a LinkedIn url','creativity, management, coding, listening'),
  (9,1,'Mathilde','Mahe','M1',2015,'This is a LinkedIn url','creativity, management, coding, listening'),
  (10,4,'Jerome','Coulon','L1',2018,'This is a LinkedIn url','creativity, management, coding, listening'),
  (11,4,'Robin','Devaux','L3',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (12,1,'Arthur','Vincent','L2',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (13,1,'Adrien','Renault','L3',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (14,1,'Margaux','Goncalves','M1',2016,'This is a LinkedIn url','creativity, management, coding, listening'),
  (15,3,'Patricia','Maillard','L3',2018,'This is a LinkedIn url','creativity, management, coding, listening'),
  (16,3,'Capucine','Raymond','L1',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (17,3,'Thibaut','Costa','L1',2017,'This is a LinkedIn url','creativity, management, coding, listening'),
  (18,4,'Lucie','Rossi','L3',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (19,4,'Colette','Remy','L3',2017,'This is a LinkedIn url','creativity, management, coding, listening'),
  (20,1,'Gerard','Pottier','L3',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (21,2,'Lucy','Boyer','L3',2019,'This is a LinkedIn url','creativity, management, coding, listening'),
  (22,1,'Maryse','Bousquet','M2',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (23,2,'Olivier','Gillet','L3',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (24,1,'Christophe','Roux','L1',2019,'This is a LinkedIn url','creativity, management, coding, listening'),
  (25,3,'Denis','Blanchard','L2',2020,'This is a LinkedIn url','creativity, management, coding, listening'),
  (26,1,'Roger','Blin','M2',2017,'This is a LinkedIn url','creativity, management, coding, listening');


INSERT INTO Enterprise VALUES
  (1,'Walmart','20, Rue Hubert de Lisle 39000 Lons-le-Saunier'),
  (2,'Amazon','49, Place de la Madeleine 75011 PARIS'),
  (3,'Toyota','97, rue Charles Corbeau 27000 ÉVREUX'),
  (4,'LCL','2, rue Gustave Eiffel 69140 RILLIEUX-LA-PAPE'),
  (5,'AirFrance','21, Rue de Strasbourg 63000 CLERMONT-FERRAND'),
  (6,'Fnac','20, rue Bonneterie 25200 MONTBÉLIARD');


INSERT INTO Internship VALUES
  (1 ,4,'NO' ,'YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2016-04-21','2016-06-21','Marc Langelier','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',12.3,14.0,'keyword1, keyword2, keyword3'),
  (2 ,4,'NO' ,'YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2019-05-14','2019-08-14','Valentine Dumas','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',09.4,11.6,'keyword1, keyword2, keyword3'),
  (3 ,3,'NO' ,'YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2017-03-21','2017-05-21','Arnaude Merle','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',13.5,13.5,'keyword1, keyword2, keyword3'),
  (4 ,1,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2017-04-21','2017-07-21','Véronique Grondin','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',17.4,14.6,'keyword1, keyword2, keyword3'),
  (5 ,1,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2019-01-21','2019-04-21','Denise Martinez','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',13.3,15.8,'keyword1, keyword2, keyword3'),
  (6 ,3,'YES','YES','YES','YES','YES','YES','NO' ,'NO' ,'Customer Service and Management','2015-02-21','2015-07-21','Michel Albert','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',16.1,17.5,'keyword1, keyword2, keyword3'),
  (7 ,6,'YES','YES','YES','NO' ,'YES','YES','YES','YES','Customer Service and Management','2018-08-21','2018-11-21','Vincent Aubry','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',18.3,12.2,'keyword1, keyword2, keyword3'),
  (8 ,3,'YES','YES','YES','YES','YES','NO' ,'YES','YES','Customer Service and Management','2017-03-21','2017-08-21','Marc Charles','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',15.6,13.1,'keyword1, keyword2, keyword3'),
  (9 ,5,'YES','YES','NO' ,'YES','YES','YES','YES','YES','Customer Service and Management','2015-05-21','2015-12-21','Geneviève Rousset','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',11.2,10.8,'keyword1, keyword2, keyword3'),
  (10,3,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2018-06-21','2018-09-21','Marthe Fernandes','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',08.1,11.6,'keyword1, keyword2, keyword3'),
  (11,5,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2020-06-21','2020-09-21','Dominique Gautier','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',12.1,16.4,'keyword1, keyword2, keyword3'),
  (12,1,'YES','YES','YES','NO' ,'YES','YES','YES','YES','Customer Service and Management','2020-07-21','2020-10-21','Denise Martinez','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',13.4,14.5,'keyword1, keyword2, keyword3'),
  (13,5,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2020-02-21','2020-05-21','Andrée Gilbert','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',14.7,17.4,'keyword1, keyword2, keyword3'),
  (14,2,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2016-01-21','2016-07-21','Augustin Coste','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',13.6,16.1,'keyword1, keyword2, keyword3'),
  (15,2,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2018-03-21','2018-09-21','Christelle Jourdan','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',10.8,13.4,'keyword1, keyword2, keyword3'),
  (16,5,'YES','YES','NO' ,'YES','YES','YES','YES','YES','Customer Service and Management','2020-04-21','2020-08-21','Andrée Gilbert','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',11.3,12.4,'keyword1, keyword2, keyword3'),
  (17,2,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2017-07-21','2017-12-21','Sabine Texier','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',17.6,18.8,'keyword1, keyword2, keyword3'),
  (18,6,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2020-07-21','2020-08-21','Margaux Masson','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',19.4,17.6,'keyword1, keyword2, keyword3'),
  (19,1,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2020-05-21','2020-08-21','David Blot','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',13.6,15.2,'keyword1, keyword2, keyword3'),
  (20,4,'YES','YES','YES','YES','YES','NO' ,'YES','YES','Customer Service and Management','2017-06-21','2017-07-21','Alix Lemonnier','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',14.6,17.1,'keyword1, keyword2, keyword3'),
  (21,3,'YES','YES','NO' ,'NO' ,'YES','YES','YES','YES','Customer Service and Management','2019-09-21','2019-11-21','Hugues Boulay','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',11.4,13.5,'keyword1, keyword2, keyword3'),
  (22,2,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2020-08-21','2020-11-21','Henriette Labbe','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',10.8,09.6,'keyword1, keyword2, keyword3'),
  (23,2,'YES','YES','YES','YES','YES','YES','NO' ,'NO' ,'Customer Service and Management','2020-01-21','2020-04-21','Océane Bonnin','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',14.4,15.2,'keyword1, keyword2, keyword3'),
  (24,1,'YES','YES','YES','NO' ,'YES','YES','YES','YES','Customer Service and Management','2019-06-21','2019-09-21','Dominique Boutin','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',16.5,15.5,'keyword1, keyword2, keyword3'),
  (25,4,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2020-08-21','2020-11-21','Sophie Julien','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',14.3,18.2,'keyword1, keyword2, keyword3'),
  (26,1,'YES','YES','YES','YES','YES','YES','YES','YES','Customer Service and Management','2017-07-21','2017-10-21','Pauline Petit','Everything is going smoothly','I learned a lot during this internship!','The intern did a nice job during his stay, understood and learned quickly.','This is a report title',12.6,14.1,'keyword1, keyword2, keyword3');
