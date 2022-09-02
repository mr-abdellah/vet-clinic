/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE round(weight_kg::numeric, 2) >= 10.23 AND round(weight_kg::numeric, 2) <= 17.3;

-- 
BEGIN;
update animals set species = 'unspecified';
rollback;
-- 
BEGIN;
update animals set species = 'digmon' where name like '%mon';
update animals set species = 'pokemon' where species is NULL;
commit;
-- 
BEGIN;
delete from animals;
rollback;
-- spicies questions 
select COUNT(*) from animals;
select COUNT(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, count(*) from animals group by neutered;
select min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '01/01/1990' and '12/31/2000' group by species;

-- 
SELECT animals.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT COUNT(*), species.name
FROM animals INNER JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.id, animals.name, species.name, owners.full_name
FROM animals INNER JOIN species ON animals.species_id = species.id INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, owners.full_name FROM animals 
JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS "No of animals"
FROM owners LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name; 

-- 

-- Who was the last animal seen by William Tatcher?
SELECT vets.name, animals.name, visits.date_of_visit
FROM vets LEFT OUTER JOIN visits ON vets.id = visits.vet_id LEFT OUTER JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(*)
FROM vets LEFT OUTER JOIN visits ON vets.id = visits.vet_id LEFT OUTER JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name
FROM vets LEFT OUTER JOIN specializations ON vets.id = specializations.vet_id LEFT OUTER JOIN species ON species.id = specializations.specie_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name , animals.name, visits.date_of_visit
FROM animals LEFT OUTER JOIN visits ON animals.id = visits.animal_id LEFT OUTER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.date_of_visit) AS visit_count
FROM animals JOIN visits ON visits.animal_id = animals.id 
GROUP BY animals.name 
ORDER BY visit_count 
DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.date_of_visit AS visit_date
FROM animals INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name AS animal_name, animals.date_of_birth, animals.neutered, animals.escape_attempts, animals.weight_kg, vets.name AS vets_name, visits.date_of_visit AS date_visited
FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
ORDER BY date_visited DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(visits.animal_id)
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN specializations ON specializations.specie_id = vets.id
WHERE specializations.specie_id != animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS specie, COUNT(visits.animal_id) AS visits
FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY visits DESC;