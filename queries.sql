/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE round(weight_kg::numeric, 2) >= 10.23 AND round(weight_kg::numeric, 2) <= 17.3;

-- spicies questions 
select COUNT(*) from animals;
select COUNT(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, count(*) from animals group by neutered;
select min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '01/01/1990' and '12/31/2000' group by species;