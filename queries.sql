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