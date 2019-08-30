
--2 QUERIES WITH INNER JOIN***************

--List Superhero names and their specie type if their specie type has a match in the species table (have a match)--
SELECT s.superhero_firstName, s.superhero_lastName, c.species_name
FROM species c
INNER JOIN superhero s ON c.species_name = s.superhero_species
ORDER BY s.superhero_lastName;


--List out ALL Superhero names and the organization they are affiliated with, if the organization matches one in organization table--
SELECT s.superhero_firstName, s.superhero_lastName, o.organization_name 
FROM organization o 
INNER JOIN superhero s ON o.organization_name = s.superhero_affiliation
ORDER BY s.superhero_lastName;

--ADDITIONAL***************
--List ALL Cyborg Superhero names and affiliation, if they have a matching affiliation on organization table--
SELECT s.superhero_firstName, s.superhero_lastName, o.organization_name
FROM organization o
INNER JOIN superhero s ON  o.organization_name = s.superhero_affiliation
WHERE s.superhero_species = "Cyborg"
ORDER BY s.superhero_lastName;


--2 QUERIES WITH LEFT JOIN***************
--List out the planet name that does not have any species listed to live on it (NULL value)--
SELECT p.planet_name, c.species_name
FROM planet p
LEFT JOIN species c ON c.species_planet = p.planet_name
WHERE c.species_name IS NULL
ORDER BY c.species_name;

--List out the organizations that have the most powerful superheroes affiliated with them--
SELECT DISTINCT(o.organization_name)
FROM organization o
LEFT JOIN superhero s ON s.superhero_affiliation = o.organization_name
WHERE s.superhero_firstName IS NOT NULL AND s.superhero_powerTier > 5
ORDER BY s.superhero_powerTier;

--2 QUERIES WITH NESTED QUEERIES***************
--List out the supernatural planets that are closer than the averagee distance between Earth and the rest
SELECT p.planet_name
FROM planet p 
WHERE p.planet_distanceFromEarthAU < (SELECT AVG(planet.planet_distanceFromEarthAU) FROM planet)  AND 
p.planet_name != "Earth"
ORDER BY p.planet_distanceFromEarthAU;


--List out the stronger female superheroes and their prime powers--
SELECT s.superhero_alias, s.superhero_primePower
FROM superhero s
WHERE s.superhero_alias IN
(SELECT superhero_alias 
FROM superhero 
WHERE superhero_gender = "Female" AND superhero_powerTier > 5)
ORDER BY s.superhero_alias;



-- QUERY WITH TWO INNER JOIN***************
--List the alias of superheeroes that either have a species match from the species table or have a planet match from the planet table
SELECT s.superhero_alias
FROM superhero s
INNER JOIN species c ON s.superhero_species = c.species_name
WHERE c.species_name IN
(SELECT c.species_name
FROM species c
INNER JOIN planet p ON c.species_planet = p.planet_name)
ORDER BY s.superhero_alias;



--ADDITIONAL RIGHT JOIN***************
--Checking for refeerential integrity --correct full matching---
--SELECT p.planet_name,c.species_name
--FROM planet p 
--RIGHT JOIN species c ON p.planet_name = c.species_planet
---ORDER BY p.planet_name;

