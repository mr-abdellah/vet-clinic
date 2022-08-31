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