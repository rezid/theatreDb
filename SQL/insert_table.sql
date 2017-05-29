TRUNCATE spectacles CASCADE;
TRUNCATE compagnies CASCADE;
TRUNCATE spectacles_achete CASCADE;
TRUNCATE nos_spectacles CASCADE;
TRUNCATE representations CASCADE;
TRUNCATE operations CASCADE;
TRUNCATE organismes CASCADE;
TRUNCATE tarifs CASCADE;
TRUNCATE spec_tar CASCADE;
TRUNCATE billets CASCADE;
TRUNCATE op_rep CASCADE;
TRUNCATE opn_com1 CASCADE;
TRUNCATE opn_com2 CASCADE;
TRUNCATE subventions CASCADE;



INSERT INTO spectacles VALUES
    (1, 'Messmer', 100, NULL),
    (2, 'HIT PARADE', 200, NULL),
    (3, 'Shym', 300, NULL),
    (4, 'Caroline', 400, NULL),
    (5, 'Les Coquette', 500, NULL),
    (6, 'Desperate Housmen', 600, NULL),
    (7, 'Nora Hamzawi', 700, NULL),
    (8, 'Le ponit vergule', 800, NULL),
    (9, 'Haroun', 900, NULL)
;

INSERT INTO compagnies VALUES
    ('theatre de vitry', 'France', 'Ile de France', 'Vitry'),
    ('theatre de paris', 'France', 'Ile de France', 'Paris')
;

INSERT INTO spectacles_achete VALUES
    (1, 100, '28/05/2017', 'theatre de vitry'),
    (2, 200, '27/05/2017', 'theatre de paris'),
    (3, 300, '24/05/2017', 'theatre de paris'),
    (4, 400, '23/05/2017', 'theatre de paris'),
    (5, 500, '22/05/2017', 'theatre de paris')
;

INSERT INTO nos_spectacles VALUES
    (6, '21/05/2017'),
    (7, '20/05/2017'),
    (8, '19/05/2017'),
    (9, '18/05/2017')
;

INSERT INTO representations VALUES
    ('01/06/2017', '08:00', '01/05/2017', 1),
    ('02/06/2017', '08:00', '01/05/2017', 1),
    ('03/06/2017', '08:00', '01/05/2017', 1),
    ('04/06/2017', '08:00', '01/05/2017', 1),
    ('01/06/2017', '09:00', '01/05/2017', 2),
    ('02/06/2017', '09:00', '01/05/2017', 2),
    ('03/06/2017', '09:00', '01/05/2017', 2),
    ('04/06/2017', '09:00', '01/05/2017', 2)
;

INSERT INTO operations VALUES
    ('installation rideaux', NULL),
    ('installation chaise', NULL),
    ('jeux de lumiere', NULL),
    ('netoyage salle', NULL)
;

INSERT INTO organismes VALUES
    ('Municipale'),
    ('Ministere de culture'),
    ('Mecenat privé')
;

INSERT INTO tarifs VALUES
    ('normale', 14),
    ('normale', 24),
    ('etudiant', 7),
    ('etudiant', 16),
    ('personne aggés', 2),
    ('enfant', 2)
;

INSERT INTO spec_tar VALUES
	(1, 'normale', 14),
    (1, 'etudiant', 7),
    (1, 'enfant', 2),
    (2, 'normale', 24),
    (2, 'etudiant', 16),
    (2, 'enfant', 2)
;

INSERT INTO billets VALUES
    ('zidane', 'abderrazak', '01/06/2017', '08:00', 'achetée', NULL, 'normale', 14),
    ('john', 'smith', '01/06/2017', '08:00', 'achetée', NULL, 'etudiant', 7),
    ('zidane', 'meriam', '01/06/2017', '08:00', 'achetée', NULL, 'enfant', 2),
    ('lion', 'marsi', '01/06/2017', '08:00', 'achetée', 12.25, 'normale', 14),
    ('zidane', 'abderrazak1', '01/06/2017', '09:00', 'achetée', NULL, 'normale', 24),
    ('lion', 'marsi', '01/06/2017', '09:00', 'achetée', NULL, 'normale', 24),
    ('founna', 'linda', '01/06/2017', '09:00', 'achetée', NULL, 'normale', 24)
;

INSERT INTO op_rep VALUES
    ('installation rideaux', '01/06/2017', '08:00', '15/05/2017'),
    ('installation chaise', '01/06/2017', '08:00', '15/05/2017'),
    ('jeux de lumiere', '01/06/2017', '08:00', '15/05/2017'),
    ('netoyage salle', '01/06/2017', '08:00', '2/06/2017'),
    ('installation rideaux', '01/06/2017', '09:00', '16/05/2017'),
    ('installation chaise', '01/06/2017', '09:00', '16/05/2017'),
    ('jeux de lumiere', '01/06/2017', '09:00', '16/05/2017'),
    ('netoyage salle', '01/06/2017', '09:00', '03/06/2017')
;

INSERT INTO opn_com2 VALUES
    (6, 'theatre de vitry', '20/05/2017', 5000.25),
    (8, 'theatre de paris', '25/05/2017', 2500.5) 
;

INSERT INTO opn_com1 VALUES
    (6, 'theatre de vitry', '01/01/2018'),
    (6, 'theatre de vitry', '07/01/2018'),
    (6, 'theatre de vitry', '17/01/2018'),
    (8, 'theatre de paris', '19/05/2017') 
;

INSERT INTO subventions VALUES
    (8, 'Municipale', 400),
    (8, 'Mecenat privé', 500),
    (9, 'Ministere de culture', 600),
    (7, 'Ministere de culture', 700) 
;






