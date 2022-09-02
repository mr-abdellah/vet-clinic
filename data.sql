/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon','02/03/2020',0,true,10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','11/15/2018',2,true,8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu','01/07/2021',1,false,15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon','05/16/2017',5,true,11);

-- Species

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander','02/08/2020',0,false,-11),
('Plantmon','11/15/2021',2,true,-5.7),
('Squirtle','04/02/1993',3,false,-12.13),
('Angemon','06/12/2005',1,true,-45),
('Boarmon','06/07/2005',7,true,20.4),
('Blossom','10/13/1998',3,true,17),
('Ditto','05/14/2022',4,true,22)
;

-- owners

INSERT INTO owners (full_name, age) VALUES ('Sam Smith',34),('Jennifer Orwell',19), ('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);

-- spicies

INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

-- 

update animals set species_id = 2 where name like '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = (select id from owners where full_name = 'Sam Smith') WHERE name ='Agumon';
UPDATE animals SET owner_id = (select id from owners where full_name = 'Jennifer Orwell') WHERE name in ('Gabumon','Pikachu');
UPDATE animals SET owner_id = (select id from owners where full_name = 'Bob') WHERE name in ('Devimon','Plantmon');
UPDATE animals SET owner_id = (select id from owners where full_name = 'Melody Pond') WHERE name in ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (select id from owners where full_name = 'Dean Winchester') WHERE name in ('Angemon','Boarmon');

-- vets

INSERT INTO vets (name, age, date_of_graduation) 
VALUES 
    ('William Tatcher', 45, '2000-04-23'), 
    ('Maisy Smith', 26, '2019-01-17'), 
    ('Stephanie Mendez', 64, '1981-05-04'), 
    ('Jack Harkness', 38, '2008-06-08');

-- specialties

INSERT INTO specializations (specie_id, vet_id) VALUES (1, 1),(2, 3),(1, 3),(2, 4);

-- visits

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-05-24'
);

-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-07-22'
);

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Gabumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-02'
);

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-01-05'
);

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-03-08'
);

-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-05-14'
);

-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Devimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2021-05-04'
);

-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Charmander'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-24'
);

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-12-21'
);

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-08-10'
);

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-04-07'
);

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Squirtle'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2019-09-29'
);

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2020-10-03'
);

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Angemon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2020-11-04'
);

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-01-24'
);

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2019-05-15'
);

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-02-27'
);

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-03-08'
);

-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-05-24'
);

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2021-01-11'
);