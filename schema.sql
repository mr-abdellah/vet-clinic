/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(50),
    date_of_birth date,
    escape_attempts int,
    neutered boolean default false,
    weight_kg decimal,
    PRIMARY KEY(id)
);
alter table animals add column species varchar ;

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD COLUMN owner_id INTEGER;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

-- 
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(250), 
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INT, 
    specie_id INT
);

ALTER TABLE specializations 
ADD CONSTRAINT fk_vets 
FOREIGN KEY(vet_id) 
REFERENCES vets(id);

ALTER TABLE specializations 
ADD CONSTRAINT fk_species 
FOREIGN KEY(specie_id) 
REFERENCES species(id);

CREATE TABLE visits (
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    date_of_visit DATE);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create indexes to improve execution time of queries.
CREATE INDEX animal_ids ON visits (animal_id);

CREATE INDEX vet_ids ON visits (vet_id);

CREATE INDEX owner_emails ON owners (email);