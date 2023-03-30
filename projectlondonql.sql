-- The idea is to create a relational database of London's Quality of Life indicators
-- It is possible to notice some direct relationships. However, further research is recommended.
CREATE DATABASE LondonQL;
USE LondonQL;

CREATE TABLE life_expectancy (
	code_ CHAR(9) NOT NULL,
    borough VARCHAR(55) NOT NULL, 
    male DECIMAL(4,2) NULL,
    female DECIMAL(4,2) NULL,
    PRIMARY KEY (borough,code_)
);
CREATE TABLE crime_deprivation (
    code_ CHAR(9) NOT NULL,
    borough VARCHAR(55) NOT NULL,
    region VARCHAR(55) NOT NULL,
    cd_rank_ CHAR(3) NOT NULL,
    PRIMARY KEY (code_,borough),
    FOREIGN KEY (borough,code_) REFERENCES life_expectancy(borough,code_)
);
CREATE TABLE income_deprivation (
    code_ CHAR(9) NOT NULL,
    id_rank_ CHAR(3) NOT NULL,
	PRIMARY KEY (code_),
    FOREIGN KEY (code_) REFERENCES crime_deprivation(code_)
);
CREATE TABLE housing_tenure (
    code_ CHAR(9) NOT NULL,
    borough VARCHAR(55) NOT NULL,
    own INTEGER NULL,
    buying INTEGER NULL,
    public_rent INTEGER NULL,
    private_rent INTEGER NULL,
    PRIMARY KEY (code_),
    FOREIGN KEY (code_) REFERENCES crime_deprivation(code_)
);
CREATE TABLE pm_pollution (
    borough VARCHAR(55) NOT NULL,
    industrial INTEGER NOT NULL,
    transport INTEGER NOT NULL,
    PRIMARY KEY (borough),
    FOREIGN KEY (borough) REFERENCES life_expectancy(borough)
);

INSERT INTO life_expectancy -- source: https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandlifeexpectancies/datasets/lifeexpectancyestimatesallagesuk
 (code_,borough,male,female)
 VALUES
 ('E09000002','Barking and Dagenham',78.06,82.34),
 ('E09000003','Barnet',82.87,85.99),
 ('E09000004','Bexley',80.11,84.1),
 ('E09000005','Brent',81.35,85.49),
 ('E09000006','Bromley',81.61,85.06),
 ('E09000007','Camden',83.27,87.1),
 ('E09000008','Croydon',80.42,83.9),
 ('E09000009','Ealing',81.1,84.77),
 ('E09000010','Enfield',80.95,84.72),
 ('E09000011','Greenwich',79.6,83.42),
 ('E09000012','Hackney',79.78,84.2),
 ('E09000013','Hammersmith and Fulham',79.77,84.74),
 ('E09000014','Haringey',80.67,84.83),
 ('E09000015','Harrow',83.2,86.22),
 ('E09000016','Havering',80.09,84.05),
 ('E09000017','Hillingdon',80.16,84.02),
 ('E09000018','Hounslow',80.19,83.97),
 ('E09000019','Islington',79.66,83.36),
 ('E09000020','Kensington and Chelsea',83.86,86.96),
 ('E09000021','Kingston upon Thames',81.76,85.15),
 ('E09000022','Lambeth',79.51,84.17),
 ('E09000023','Lewisham',79.14,83.84),
 ('E09000024','Merton',81.13,84.5),
 ('E09000025','Newham',80.36,83.52),
 ('E09000026','Redbridge',81.49,85.24),
 ('E09000027','Richmond upon Thames',82.58,86.28),
 ('E09000028','Southwark',79.55,84.92),
 ('E09000029','Sutton',80.94,84.32),
 ('E09000030','Tower Hamlets',80.35,83.64),
 ('E09000031','Waltham Forest',80.73,84.98),
 ('E09000032','Wandsworth',80.64,84.19),
 ('E09000033','Westminster',84.88,87.22),
 ('E09000001','City of London',NULL,NULL); 
 
    INSERT INTO crime_deprivation -- source: https://data.london.gov.uk/dataset/indices-of-deprivation
 (code_,borough,region,cd_rank_)
 VALUES
 ('E09000002','Barking and Dagenham','East',21),
 ('E09000003','Barnet','North',111),
 ('E09000004','Bexley','East',165),
 ('E09000005','Brent','West',45),
 ('E09000006','Bromley','South',132),
 ('E09000007','Camden','Central',70),
 ('E09000008','Croydon','South',74),
 ('E09000009','Ealing','West',80),
 ('E09000010','Enfield','North',84),
 ('E09000011','Greenwich','East',36),
 ('E09000012','Hackney','East',15),
 ('E09000013','Hammersmith and Fulham','West',58),
 ('E09000014','Haringey','North',9),
 ('E09000015','Harrow','West',166),
 ('E09000016','Havering','East',97),
 ('E09000017','Hillingdon','West',83),
 ('E09000018','Hounslow','West',55),
 ('E09000019','Islington','Central',13),
 ('E09000020','Kensington and Chelsea','Central',64),
 ('E09000021','Kingston upon Thames','South',207),
 ('E09000022','Lambeth','Central',26),
 ('E09000023','Lewisham','East',50),
 ('E09000024','Merton','South',139),
 ('E09000025','Newham','East',29),
 ('E09000026','Redbridge','East',71),
 ('E09000027','Richmond upon Thames','West',146),
 ('E09000028','Southwark','Central',37),
 ('E09000029','Sutton','South',172),
 ('E09000030','Tower Hamlets','East',28),
 ('E09000031','Waltham Forest','East',46),
 ('E09000032','Wandsworth','South',101),
 ('E09000033','Westminster','Central',105),
 ('E09000001','City of London','Central',317);
 
 INSERT INTO income_deprivation -- source: https://data.london.gov.uk/dataset/indices-of-deprivation
 (code_,id_rank_)
 VALUES
 ('E09000002',20),
 ('E09000003',149),
 ('E09000004',170),
 ('E09000005',65),
 ('E09000006',207),
 ('E09000007',90),
 ('E09000008',97),
 ('E09000009',94),
 ('E09000010',41),
 ('E09000011',57),
 ('E09000012',19),
 ('E09000013',88),
 ('E09000014',42),
 ('E09000015',156),
 ('E09000016',162),
 ('E09000017',142),
 ('E09000018',111),
 ('E09000019',35),
 ('E09000020',137),
 ('E09000021',242),
 ('E09000022',70),
 ('E09000023',50),
 ('E09000024',181),
 ('E09000025',44),
 ('E09000026',132),
 ('E09000027',283),
 ('E09000028',54),
 ('E09000029',197),
 ('E09000030',23),
 ('E09000031',72),
 ('E09000032',167),
 ('E09000033',101),
 ('E09000001',280);
 
  INSERT INTO housing_tenure -- source:https://data.london.gov.uk/dataset/housing-tenure-borough
 (code_,borough,own,buying,public_rent,private_rent)
 VALUES
 ('E09000002','Barking and Dagenham',18.8,22.9,32.8,25.4),
 ('E09000003','Barnet',30.3,29.1,12.5,28.2),
 ('E09000004','Bexley',35.6,35.9,13.6,14.9),
 ('E09000005','Brent',26.7,21.4,20,31.8),
 ('E09000006','Bromley',32,37.2,9.7,21.1),
 ('E09000007','Camden',19.9,14.7,37.2,28.1),
 ('E09000008','Croydon',22.7,32.6,17.6,27.1),
 ('E09000009','Ealing',26.4,30.8,12.7,30.1),
 ('E09000010','Enfield',26.3,31.4,20.7,21.6),
 ('E09000011','Greenwich',21.2,32.6,25.9,20.3),
 ('E09000012','Hackney',11.2,19.6,42.9,26.3),
 ('E09000013','Hammersmith and Fulham',24.9,18.8,25.8,30.5),
 ('E09000014','Haringey',26.1,18.8,27.3,27.7),
 ('E09000015','Harrow',39.4,27.9,7.5,25.2),
 ('E09000016','Havering',35.4,36.8,15,12.8),
 ('E09000017','Hillingdon',25.7,30.5,14.1,29.7),
 ('E09000018','Hounslow',26.6,26.8,18.3,28.4),
 ('E09000019','Islington',19.6,14.6,41.5,24.4),
 ('E09000020','Kensington and Chelsea',28.6,10,37.1,24.2),
 ('E09000021','Kingston upon Thames',36.2,31,7.3,25.5),
 ('E09000022','Lambeth',12.2,26.3,30.6,30.9),
 ('E09000023','Lewisham',14.7,30.8,29.8,24.7),
 ('E09000024','Merton',26.5,32,11.7,29.8),
 ('E09000025','Newham',16.7,20.3,31.4,31.6),
 ('E09000026','Redbridge',30.3,29.8,10.3,29.7),
 ('E09000027','Richmond upon Thames',34.7,37.2,9.7,18.4),
 ('E09000028','Southwark',11.6,22.7,42.4,23.4),
 ('E09000029','Sutton',34,35.7,13.3,17),
 ('E09000030','Tower Hamlets',12.8,16,34.8,36.4),
 ('E09000031','Waltham Forest',25.4,31.8,18.3,24.5),
 ('E09000032','Wandsworth',22.9,27.5,14.8,34.8),
 ('E09000033','Westminster',21.2,12.7,33.2,32.9),
 ('E09000001','City of London',NULL,NULL, NULL,NULL);
 
 INSERT INTO pm_pollution  -- source:https://data.london.gov.uk/dataset/london-atmospheric-emissions-inventory--laei--2019
 (borough,industrial,transport)
 VALUES
 ('Barking and Dagenham',101.88,46.37),
 ('Barnet',92.31,120.91),
 ('Bexley',116.20,71.57),
 ('Brent',134.67,68.62),
 ('Bromley',64.76,94.98),
 ('Camden',153.45,42.42),
 ('Croydon',132.78,86.22),
 ('Ealing',93.95,91.32),
 ('Enfield',82.77,104.45),
 ('Greenwich',102.83,78.76),
 ('Hackney',47.93,34.40),
 ('Hammersmith and Fulham',71.41,35.62),
 ('Haringey',35.43,43.72),
 ('Harrow',71.76,49.47),
 ('Havering',56.49,94.08),
 ('Hillingdon',338.76,175.74),
 ('Hounslow',260.24,95.69),
 ('Islington',51.29,27.71),
 ('Kensington and Chelsea',45.22,33.82),
 ('Kingston upon Thames',70.79,49.37),
 ('Lambeth',73.03,49.23),
 ('Lewisham',23.42,47.57),
 ('Merton',42.82,45.91),
 ('Newham',254.25,66.28),
 ('Redbridge',34.29,79.74),
 ('Richmond upon Thames',82.07,51.07),
 ('Southwark',72.94,47.43),
 ('Sutton',60.14,39.64),
 ('Tower Hamlets',136.34,57.08),
 ('Waltham Forest',24.44,55.44),
 ('Wandsworth',72.74,54.64),
 ('Westminster',219.67,63.28),
 ('City of London',108.53,11.68);
 
 
 -- Using any type of the joins create a view that combines multiple tables in a logical way
 -- How is the boroughs' male life expectancy directly related to pollution, income and crime deprivation?
SELECT le.borough,male,industrial,transport,id.id_rank_,cd.cd_rank_
FROM life_expectancy le 
INNER JOIN pm_pollution pm
	ON le.borough = pm.borough
INNER JOIN crime_deprivation cd
	ON le.code_ = cd.code_
INNER JOIN income_deprivation id
	ON le.code_ = id.code_
ORDER BY le.male;

 -- Create a stored function that can be applied to a query
 -- Create a stored function to classify pm10 emissions
DELIMITER //
CREATE FUNCTION PMLevel(ind VARCHAR(55))
RETURNS VARCHAR(55)
DETERMINISTIC
BEGIN
	DECLARE PMLevel VARCHAR(55);
	IF  ind <= 50 THEN
		SET PMLevel = 'GOOD';
	ELSEIF (ind > 50 AND ind <= 100) THEN
    	SET PMLevel = 'MODERATE';
	ELSEIF (ind > 100 AND ind <= 150) THEN
		SET PMLevel = 'UNHEALTHY FOR SENSITIVE GROUPS';
	ELSEIF (ind > 150 AND ind <= 200) THEN
		SET PMLevel = 'UNHEALTHY';
	ELSEIF (ind > 200 AND ind <= 300) THEN
		SET PMLevel = 'VERY UNHEALTHY';
	ELSEIF ind > 300 THEN
		SET PMLevel = 'HAZARDOUS';
	END IF;
	RETURN (PMLevel);
END	//
DELIMITER ;

SHOW FUNCTION STATUS 
WHERE db = 'LondonQL';

SELECT borough,PMLevel(industrial)
AS status_
FROM pm_pollution
ORDER BY status_ DESC;

SELECT borough,PMLevel(transport)
AS status_
FROM pm_pollution
ORDER BY status_ DESC;


-- Prepare an example query with a subquery to demonstrate how to extract data from your DB analysis
-- What would be the safest borough option to live in, considering I want to rent from a private landlord in South London?
SELECT borough,cd_rank_
FROM crime_deprivation
WHERE region='South' AND borough IN ( 
    SELECT borough
    FROM housing_tenure
    WHERE private_rent>20
  )
ORDER BY cd_rank_ DESC;
 

-- Create a DB diagram where all tables relations are shown (EER Diagram) -- Please see Presentation or EER Diagram

-- Extra - In your DB, create a stored procedure and demonstrate how it runs 
-- Create a stored procedure to find the percentage of publicly rented properties from a council
DELIMITER //
CREATE PROCEDURE LondonQL.PublicRentbyCouncil(IN council VARCHAR(55))
BEGIN
	SELECT borough,public_rent
    FROM housing_tenure
    WHERE borough = council;
    END //
DELIMITER ;

CALL LondonQL.PublicRentbyCouncil('Harrow');


-- Extra - In your DB, create a trigger and demonstrate how it runs
-- Create a trigger after updating the emissions concentration in each borough, considering PM concentration over 150.
DELIMITER //
CREATE TRIGGER emission_alert AFTER UPDATE ON pm_pollution
FOR EACH ROW
BEGIN
IF NEW.industrial > 150 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Levels of emissions are unhealthy';
END IF;
END //
DELIMITER ;


UPDATE pm_pollution 
SET industrial = 155.4
WHERE borough = 'Wandsworth'; -- Error Code: 1644 - Levels of emissions are unhealthy

UPDATE pm_pollution 
SET industrial = 23
WHERE borough = 'Newham'; -- 1 row affected Rows matched:1 Changed 1 Warnings:0

-- Combined data CSV for Tableau
SELECT DISTINCT*
FROM life_expectancy le 
INNER JOIN pm_pollution pm
	ON le.borough = pm.borough
INNER JOIN crime_deprivation cd
	ON le.code_ = cd.code_
INNER JOIN income_deprivation id
	ON le.code_ = id.code_
INNER JOIN housing_tenure ho
	ON le.code_ = ho.code_;