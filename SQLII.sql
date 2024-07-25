Select * from Trainers 
Select top(1) * from PokemonData
Select * from Battles
Select * from TablaIntermedia
-- Comandos para Añadir o remover columnas
ALTER TABLE Trainers
ADD Team VARCHAR(255)
ALTER TABLE PokemonData
ADD Estadisticas VARCHAR(255)

CREATE TABLE TablaIntermedia(
Trainer_id int,
pokemon_id int,
FOREIGN KEY (Trainer_id) REFERENCES Trainers(TrainersID),
FOREIGN KEY (pokemon_id) REFERENCES PokemonData(PokemonID)
)
CREATE TABLE Battles(
Fecha Date,
BattleId INT PRIMARY KEY,
Resultado VARCHAR(50),
Trainer1_id int,
Trainer2_id int,
Pokemon1_id int,
Pokemon2_id int,
FOREIGN KEY (Trainer1_id) REFERENCES Trainers(TrainersID),  -- Enlazamos trainer1_id a la columna id de la tabla Trainer
FOREIGN KEY (Trainer2_id) REFERENCES Trainers(TrainersID),  -- Mismo caso para el trainer2_id a la columna id
FOREIGN KEY (Pokemon1_id) REFERENCES PokemonData(PokemonID), -- Repetimos el caso con la tabla pokemones
FOREIGN KEY (Pokemon2_id) REFERENCES PokemonData(PokemonID)
)
-- Insertamos los datos para poder interactuar
INSERT INTO Trainers (TrainersID,TrainerName, Team) VALUES
(1, 'Anibal', 'Amarillo'),(3, 'Trainer2', 'Verde');

INSERT INTO TablaIntermedia(Trainer_id, Pokemon_id)Values
(2,7),(4,20);

INSERT INTO  Battles (Fecha, Battleid, Resultado, Trainer1_id, Trainer2_id, Pokemon1_id, Pokemon2_id)
VALUES ('2024-07-24', 5, 'Lose', 4,3,10,3);

INSERT INTO Trainers (TrainersID,TrainerName, Team) VALUES
(3, 'Franco', 'PROS'),(4, 'Trainer69', 'SIXNINE');

-- Cambiamos el Id del pokemon por un Id = 20
DECLARE @IDaCambiar INT = ;
UPDATE Trainers 
SET Team = 'Tres3amigos'
WHERE TrainersID = @IDaCambiar

-- Cambiamos el Id del entrenador 
UPDATE TablaIntermedia
SET Trainer_id = 3
WHERE Trainer_id = 4 or pokemon_id = 10

UPDATE Battles
SET Resultado = 'Empate'
WHERE BattleId = 5

-- Eliminar datos
DECLARE @trainer_id INT = 3;

-- Primero eliminamos las batallas relacionadas con el entrenador
DELETE FROM Battles
WHERE Trainer1_id = @trainer_id OR Trainer2_id = @trainer_id;

DELETE FROM TablaIntermedia 
WHERE Trainer_id = @trainer_id;

-- Luego eliminamos el entrenador
DELETE FROM Trainers
WHERE TrainersID = @trainer_id;
